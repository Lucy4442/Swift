//
//  ViewController.swift
//  to do list
//
//  Created by mac on 19/01/24.
//

import UIKit

class ViewController: UIViewController {

    var items = [String]()
    let tableview : UITableView = {
         let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor.systemGray6 // Set background color
               table.separatorStyle = .none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        configureNavigationBar()
        configureTableView()
      
//        tableview.delegate = self
//        tableview.dataSource = self
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didtap))
//        view.addSubview(tableview)
    }
    private func configureNavigationBar() {
         // Add a custom font to the navigation bar title
         navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
         
         // Customize the appearance of the "Add" button
         let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didtap))
         addButton.tintColor = UIColor.systemBlue
         navigationItem.rightBarButtonItem = addButton
     }
    
    private func configureTableView() {
           tableView.delegate = self
           tableView.dataSource = self
           view.addSubview(tableView)
       }
    
    @objc private func didTap() {
          let alert = UIAlertController(title: "New Item", message: "Enter New Task", preferredStyle: .alert)
          alert.addTextField { field in
              field.placeholder = "Enter Item..."
              field.autocapitalizationType = .sentences // Capitalize sentences
          }

          alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          alert.addAction(UIAlertAction(title: "Done", style: .default) { [weak self] _ in
              if let field = alert.textFields?.first, let text = field.text, !text.isEmpty {
                  DispatchQueue.main.async {
                      self?.items.append(text)
                      self?.tableView.reloadData()
                  }
              }
          })

          present(alert, animated: true)
      }

      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          tableView.frame = view.bounds
      }
  }

  extension ViewController: UITableViewDelegate {
      // Add UITableViewDelegate methods if needed
  }

  extension ViewController: UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          cell.textLabel?.text = items[indexPath.row]
          cell.textLabel?.font = UIFont.systemFont(ofSize: 18) // Set font size
          cell.backgroundColor = UIColor.white // Set cell background color
          cell.selectionStyle = .none // Disable cell selection highlighting
          return cell
      }
  }

//    @objc func didtap(){
//        let alert = UIAlertController(title: "New Item", message: "Enter New Task", preferredStyle: .alert)
//        alert.addTextField(configurationHandler: {field in
//            field.placeholder = "Enter Item..."
//        })
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {[weak self](_) in
//            if let field = alert.textFields?.first{
//                if let text = field.text , !text.isEmpty{
//                    DispatchQueue.main.async
//                    {
//                        self?.items.append(text)
//                    self?.tableview.reloadData()
//                    }
//                }
//            }
//        }))
//        present(alert, animated: true)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableview.frame = view.bounds
//    }
//
//
//}

//extension ViewController : UITableViewDelegate
//{
//
//}
//
//
//extension ViewController : UITableViewDataSource
//{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
//        cell.textLabel?.text = items[indexPath.row]
//        return cell
//    }
//
//
//}
