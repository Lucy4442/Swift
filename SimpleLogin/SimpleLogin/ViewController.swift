//
//  ViewController.swift
//  SimpleLogin
//
//  Created by mac on 10/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var signUpSegment: UIView!
    @IBOutlet var loginSegment: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //change segment control text value
        self.view.bringSubviewToFront(loginSegment)
        loginSegment.alpha = 0
        signUpSegment.alpha = 1
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0 :
            view.bringSubviewToFront(signUpSegment)
            loginSegment.alpha = 0
            signUpSegment.alpha = 1
        case 1 :
            view.bringSubviewToFront(loginSegment)
            loginSegment.alpha = 1
            signUpSegment.alpha = 0
        default :
            print("invalid")
            break
        }
    }
    
}

