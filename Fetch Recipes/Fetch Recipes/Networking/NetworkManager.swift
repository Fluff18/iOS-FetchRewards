//
//  NetworkManager.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/20/22.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
     
    func trialRequest(completion: @escaping(Result<String, Error>) -> Void) {
        request(route: .temp, method: .get, completion: completion)
    }
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void )  {
        guard  let request = createReq(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
            
        }
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not convert data to String"
                print("The response is :\(responseString)")
            }
            else if let error = error {
                result = .failure(error)
                print("The error is :\(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            }
            if let decodedData =  response.data {
                completion(.success(decodedData))
            }
            else {
                completion(.failure(AppError.noData))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// This  function helps us to generate a url request
    /// - Parameters:
    ///   - route: The path to the resource and the backend
    ///   - method: The type of the request
    ///   - parameters: Extra  info  to be pass to the backend
    /// - Returns: Returns Url request
    public func createReq(route: Route,
                          method: Method,
                          parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl +  route.description
        guard let url = urlString.asUrl else { return nil }
        var  urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod  = method.rawValue
        
        if let params = parameters {
            switch method {
                case .get:
                var urlComponent = URLComponents(string: urlString)
                    urlComponent?.queryItems = params.map{ URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url =  urlComponent?.url
                case .post, .delete:
                    let bodyData = try? JSONSerialization.data(withJSONObject: params, options: []) as! String?
                    urlRequest.httpMethod = bodyData
            }
        }
        return urlRequest
    }
}
