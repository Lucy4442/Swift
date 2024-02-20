//
//  ViewController.swift
//  headerfooter
//
//  Created by mac on 17/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table : UITableView!
    var data =
    [
        ["one","two","three"],
        ["4","5"],
        ["a","b","c","d"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        footer.backgroundColor = .gray
        header.backgroundColor = .green
        table.tableFooterView = footer
        table.tableHeaderView = header
    }


}


extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension ViewController : UITableViewDataSource{
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50.0
//    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section1"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    

}
