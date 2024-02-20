//
//  ViewController.swift
//  multiplerowselect
//
//  Created by mac on 18/01/24.
//

import UIKit

class ViewController: UIViewController {

    let swiftTopics = ["Varibles","DataTypes","Conditional Statements", "Loops","Functions","Class & Structures","Clousures","Protocols & Delegate","Optionals","CollectionTypes","Varibles","DataTypes","Conditional Statements", "Loops","Functions","Class & Structures","Clousures","Protocols & Delegate","Optionals","CollectionTypes","Varibles","DataTypes","Conditional Statements", "Loops","Functions","Class & Structures","Clousures","Protocols & Delegate","Optionals","CollectionTypes"]
    
    
    var selectedCells:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = swiftTopics[indexPath.row]
        cell.accessoryType = self.selectedCells.contains(indexPath.row) ? .checkmark : .none
        cell.backgroundColor = self.selectedCells.contains(indexPath.row) ? .lightGray : .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftTopics.count
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.selectedCells.contains(indexPath.row){
            let index = selectedCells.firstIndex(of:indexPath.row)
            self.selectedCells.remove(at: index!)
        }
        else
        {
            self.selectedCells.append(indexPath.row)
        }
        print(selectedCells)
        tableView.reloadData()
    }
    
}
