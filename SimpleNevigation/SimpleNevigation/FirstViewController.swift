//
//  FirstViewController.swift
//  SimpleNevigation
//
//  Created by mac on 09/01/24.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var Namelbl: UILabel!
    @IBOutlet var Agelbl: UILabel!
    var name = ""
    var age = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        Namelbl.text = "\(name)"
        Agelbl.text = "\(age)"
        // Do any additional setup after loading the view.
    }
    

}
