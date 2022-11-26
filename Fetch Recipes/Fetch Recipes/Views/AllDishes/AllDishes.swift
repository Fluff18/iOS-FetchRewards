//
//  AllDishes.swift
//  Fetch Recipes
//
//  Created by Luminosity on 11/25/22.
//

import Foundation
import UIKit
class AllDishes: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var AllDishes: [AllDesserts] = []
    var selectedCategory: FoodCategory!
    
    @IBOutlet weak var setTtile: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTtile.title = selectedCategory.strCategory
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        setupCells()
    }
    
    func setupCells() {
        NetworkManager.shared.listFood(endPoint: selectedCategory.strCategory) { (result) in
            switch result {
            case .success(let data):
                print("The data after decoding is:\(data)")
                self.AllDishes = data.map({ AllDesserts.init(strMeal: $0.strMeal, strMealThumb: $0.strMealThumb, idMeal: $0.idMeal)})
                self.AllDishes = self.AllDishes.sorted(by: { $0.strMeal < $1.strMeal })
                self.tableView.reloadData()
                
            case .failure(let error):
                print("The error is \(error.localizedDescription)")
            }
        }
    }
}

extension AllDishes: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dish = AllDishes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AllDishesTableViewCell.identifier) as! AllDishesTableViewCell
        cell.setup(dish: dish)
        return cell
    }
}
