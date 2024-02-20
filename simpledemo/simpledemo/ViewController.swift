//
//  ViewController.swift
//  simpledemo
//
//  Created by mac on 17/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    var part: Int?
   
    var EmpData = [
        data(Section: "A", names: ["A","B","C","D"]),
        data(Section: "B" ,names: ["E","F"]),
        data(Section: "C",names:["G","H","I","J","K"]),
        data(Section: "D", names: [])
    ]
    
    @IBOutlet weak var tablee: UITableView!
    var showindex : Bool = false
    var datePickerContainerView = UIView()
      var datePicker = UIDatePicker()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let height: CGFloat = 200 //whatever height you want to add to the existing height
//        let bounds = self.navigationController?.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds!.width, height: bounds!.height + height)
//        self.navigationController?.navigationBar.frame = CGRect(x: , y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        tablee.backgroundColor = .black
//                tablee.separatorColor = .gray
//                tablee.indicatorStyle = .white
//        view.backgroundColor = .black
        let customView = UILabel()
        customView.text = "To Do List"
        customView.textColor = .brown
        customView.frame = CGRect(x: 0, y: 0, width: 131, height: 34.26)
        customView.font = customView.font.withSize(29)
        navigationItem.leftBarButtonItems = [
            
            UIBarButtonItem(image: UIImage(imageLiteralResourceName: "Image"), style: .done, target: self, action: nil),
            UIBarButtonItem(customView: customView)
            
        ]
        navigationController?.navigationBar.tintColor = .black

 
        
        datePickerContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
              datePickerContainerView.backgroundColor = .white
              datePickerContainerView.addSubview(datePicker)
              datePickerContainerView.backgroundColor = .darkGray
              datePicker.backgroundColor = .darkGray
              datePicker.translatesAutoresizingMaskIntoConstraints = false
              datePicker.centerXAnchor.constraint(equalTo: datePickerContainerView.centerXAnchor).isActive = true
              datePicker.centerYAnchor.constraint(equalTo: datePickerContainerView.centerYAnchor).isActive = true
              datePicker.datePickerMode = .date

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let tablee = tablee else{
            print("not found table")
            return
        }
        tablee.backgroundColor = .black
        tablee.separatorColor = .gray
        tablee.indicatorStyle = .white
        super.viewDidAppear(animated)
        let height: CGFloat = 200 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
    
    
    @objc func showAlert() {
          let alertController = UIAlertController(title: "Your Alert", message: "Enter some text", preferredStyle: .alert)

          alertController.addTextField { textField in
              textField.placeholder = "Section"
              textField.backgroundColor = .darkGray
              textField.borderStyle = .roundedRect
              textField.textColor = .white
          }

          alertController.addTextField { textField in
              textField.placeholder = "Task"
              textField.backgroundColor = .darkGray
              textField.borderStyle = .roundedRect
              textField.textColor = .white
          }

          alertController.addTextField { textField in
              textField.placeholder = "Select Date"
              textField.inputView = self.datePickerContainerView
              textField.backgroundColor = .darkGray
              textField.borderStyle = .roundedRect
              textField.textColor = .white

              // Dismiss the date picker when the user selects a date
              self.datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
          }

          let okAction = UIAlertAction(title: "Add", style: .default) { _ in
              if let textFields = alertController.textFields,
                  let sectionText = textFields[0].text, !sectionText.isEmpty,
                  let taskText = textFields[1].text, !taskText.isEmpty {

                  let selectedDate = self.datePicker.date
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "yyyy-MM-dd"
                  let dateText = dateFormatter.string(from: selectedDate)

                  // Check if the section already exists
                  if let existingSectionIndex = self.EmpData.firstIndex(where: { $0.Section == sectionText }) {
                      // Add the task to the existing section
                      let newTask = "\(dateText) - \(taskText)"
                      self.EmpData[existingSectionIndex].names.append(newTask)
                      let indexPath = IndexPath(row: self.EmpData[existingSectionIndex].names.count - 1, section: existingSectionIndex)
                      self.tablee.insertRows(at: [indexPath], with: .automatic)
                  } else {
                      // Create a new section and add the task
                      let newSection = data(Section: sectionText, names: ["\(dateText) - \(taskText)"])
                      self.EmpData.append(newSection)
                      let sectionIndex = self.EmpData.count - 1
                      let indexPath = IndexPath(row: 0, section: sectionIndex)
                      self.tablee.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
                      self.tablee.insertRows(at: [indexPath], with: .automatic)
                  }
              }
          }

          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

          alertController.addAction(okAction)
          alertController.addAction(cancelAction)

          present(alertController, animated: true, completion: nil)
      }

      @objc func datePickerValueChanged(_ sender: UIDatePicker) {
          let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = dateFormatter.string(from: sender.date)
                
                // Display the selected date in the text field
                if let textField = self.datePickerContainerView.subviews.first as? UITextField {
                    textField.text = dateString
                }
                
                // Dismiss the date picker
                view.endEditing(true)
      }
}

extension ViewController : UITableViewDelegate{
    
}


extension ViewController : UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !EmpData[section].isExpandable{
            return 0
        }
        else
        {
            return EmpData[section].names.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = EmpData[indexPath.section].names[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = "\(name)"
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return EmpData.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
             let headerView = UIView()
        headerView.backgroundColor = .darkGray
//        headerView.layer.cornerRadius = 10

             let lbl = UIButton()
             lbl.setTitle(EmpData[section].Section, for: .normal)
             lbl.setTitleColor(.white, for: .normal)
             lbl.titleLabel?.textAlignment = .left
             lbl.addTarget(self, action: #selector(handleclose(sender:)), for: .touchUpInside)
             lbl.tag = section

             let btn = UIButton(type: .system)
             btn.setTitle("Edit", for: .normal)
             btn.setTitleColor(.white, for: .normal)
             btn.titleLabel?.textAlignment = .left
             btn.addTarget(self, action: #selector(editing), for: .touchUpInside)
             btn.tag = section

             headerView.addSubview(lbl)
             lbl.translatesAutoresizingMaskIntoConstraints = false
             lbl.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
             lbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true

             headerView.addSubview(btn)
             btn.translatesAutoresizingMaskIntoConstraints = false
             btn.leadingAnchor.constraint(equalTo: lbl.trailingAnchor, constant: 8).isActive = true
             btn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16).isActive = true
             btn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true

             return headerView
    }
    
    
    
    @objc func handleclose(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        for row in EmpData[section].names.indices
        {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isexpanded = EmpData[section].isExpandable
        EmpData[section].isExpandable = !isexpanded
        

        if isexpanded
        {
            tablee.deleteRows(at: indexPaths, with: .fade)
        }
        else
        {
            tablee.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    @objc func editing(sender : UIButton){
        part = sender.tag
        tablee.isEditing = !tablee.isEditing
        if tablee.isEditing{
            sender.setTitle("Save", for: .normal)
        }
        else
        {
        sender.setTitle("Edit", for: .normal)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        45
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let section = part else {
            return false
        }
        return indexPath.section == section
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            EmpData[indexPath.section].names.remove(at: indexPath.row)
            tablee.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 35
       }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          return 20
      }
}


extension UINavigationBar{
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 118)
    }
}
