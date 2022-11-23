//
//  Network Manager.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/22/22.
//

import Foundation

struct NetworkManager {
    // singleton to access the properties of the struct
    static let shared = NetworkManager()
    private init() {}
    
    /// Function to get the regions
    func getRegions(completion: @escaping(Result<[Regions], Error>) -> Void) {
        request(route: .region, method: .get, completion: completion)
    }
    
    /// Function to get all the desserts
    func getDesserts(completion: @escaping(Result<[AllDesserts], Error>) -> Void) {
        request(route: .deserts, method: .get, completion: completion)
    }
    
    /// This function helps us generate the URLRequest
    /// - Parameters:
    ///   - route: Path to the resource in the backend
    ///   - method: The type of request to be made
    ///   - parameters: Extra information that has to be passed to the backend
    /// - Returns: Returns the URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        
        //Get the url from the route and check if nil or not
        let urlString = Route.baseUrl + route.description
        guard let url =  urlString.asUrl else { return nil }
        
        //Send Url request to a website which returns JSON
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        //Check what action has to be done
        if let params = parameters {
            switch method {
            case .get:
                //Gets the sub category and convert params to url query items
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                //Update url request to use new URL
                urlRequest.url = urlComponent?.url
            case .post:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    
    /// Create a generic function to make different types of API Requests
    /// - Parameters:
    ///   - route: Path to the resource in the backend
    ///   - method: The type of request to be made
    ///   - parameters: Extra information that has to be passed to the backend
    private func request<T: Decodable>(route: Route,
                                       method: Method,
                                       parameters: [String: Any]? = nil,
                                       completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        // Generate URL session
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                //Convert data to string
                let responseString = String(data: data, encoding: .utf8) ?? "Cannot convert data to string"
                print("The response is : \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            // Async
            DispatchQueue.main.async {
                self.handeResponse(result: result, completion: completion)
            }
            
        }.resume()
        
    }
    
    /// Decode the JSON response
    /// - Parameters:
    ///   - result: Data/Error
    ///   - completion: Completion Handler
    private func handeResponse<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            // We know we have data, but have to check for error in data with decoding
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(AppError.internalServerError(error)))
                return
            }
            if let categoriesData = response.categories {
                completion(.success(categoriesData ))
                
            } else if let mealsData = response.meals {
                completion(.success(mealsData))
            }
            else {
                completion(.failure(AppError.noData))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
        
    }

}
