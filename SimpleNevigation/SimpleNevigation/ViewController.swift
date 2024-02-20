//
//  ViewController.swift
//  SimpleNevigation
//
//  Created by mac on 09/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Namefield: UITextField!
    @IBOutlet var Agefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapped(_ sender: Any) {
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        storyboard.name = Namefield.text!
        storyboard.age = Agefield.text!
        self.navigationController?.pushViewController(storyboard, animated: true)
        
        
    }
    
}

