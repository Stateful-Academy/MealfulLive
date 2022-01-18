//
//  FoodController.swift
//  MealFul
//
//  Created by Trevor Walker on 1/16/22.
//

import Foundation

class FoodController {
    static let shared = FoodController()
    var foodList: [Food] = []
    
    func createFood(name: String) {
        let newFood = Food(name: name)
        foodList.append(newFood)
    }
    
    func deleteFood(_ food: Food) {
        guard let i = foodList.firstIndex(of: food) else {return}
//        guard let index = foodList.firstIndex(where: { $0 == food}) else { return }
        foodList.remove(at: i)
    }
}
