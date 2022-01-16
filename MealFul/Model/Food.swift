//
//  Food.swift
//  MealFul
//
//  Created by Trevor Walker on 1/16/22.
//

import Foundation

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Food: Equatable {
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name
    }
}
