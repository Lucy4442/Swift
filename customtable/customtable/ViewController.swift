//
//  ViewController.swift
//  customtable
//
//  Created by mac on 17/01/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "TableViewCell")
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 2
        {
            let customcell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            customcell.configure(with: "Dear", img: "gear")
            return customcell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let Switch = UISwitch()
        Switch.addTarget(self, action: #selector(tapped(_ :)), for: .valueChanged)
        cell.textLabel?.text = "Hello World"
        cell.accessoryView = Switch
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    @objc func tapped(_ sender : UISwitch){
        if sender.isOn{
            print("Switch is on")
        }
    }
}

