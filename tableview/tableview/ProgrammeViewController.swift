//
//  ProgrammeViewController.swift
//  tableview
//
//  Created by mac on 17/01/24.
//

import UIKit

class ProgrammeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let tableview : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.imageView?.image = UIImage(systemName: "house")
        cell.imageView?.tintColor = .gray
        return cell
    }
    

}
