//
//  ViewController.swift
//  MealFul
//
//  Created by Trevor Walker on 1/16/22.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
       createFood()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodController.shared.foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as UITableViewCell
        let food = FoodController.shared.foodList[indexPath.row]
        cell.textLabel?.text = food.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let food = FoodController.shared.foodList[indexPath.row]
            FoodController.shared.deleteFood(food)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func createFood() {
        guard let name = nameTextfield.text else { return }
        FoodController.shared.createFood(name: name)
        nameTextfield.text = ""
        tableView.reloadData()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        createFood()
        return true
    }
}
