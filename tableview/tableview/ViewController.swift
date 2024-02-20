//
//  ViewController.swift
//  tableview
//
//  Created by mac on 17/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    
    var name = ["a","b","c","d","e","f"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
    
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.lbl.text = name[indexPath.row]
        cell.iamge.backgroundColor = .red
        return cell
    }
}
