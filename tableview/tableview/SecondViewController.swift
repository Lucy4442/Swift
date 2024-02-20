

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource{

    let tableview : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Grouped"
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.imageView?.image = UIImage(systemName: "gear")
        cell.imageView?.tintColor = .green
        return cell
    }
    
}
