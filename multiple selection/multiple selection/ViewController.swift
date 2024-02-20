//
//  ViewController.swift
//  multiple selection
//
//  Created by mac on 18/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.getData()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        self.table.isEditing = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(deleteRow))
        
//        table.setEditing(true, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func deleteRow(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancle))
        self.table.isEditing = true
    }
    @objc func cancle(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(deleteRow))
        self.table.isEditing = false
    }
    func getData()
    {
        arr = ["Hello1","Hello2","Hello3","Hello4","Hello4","Hello5","Hello6","Hello7","Hello8","Hello9","Hello10"]
    }


}



extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("df")
        table.reloadData()
       
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }

       // Implement the editingStyleForRowAt method to specify the editing style (e.g., delete)
       func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
           return  .delete
       }

       // Implement the commit editingStyle method to handle the deletion
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               // Perform your deletion logic here
               arr.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .left)
           }
       }
    
    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    
}
