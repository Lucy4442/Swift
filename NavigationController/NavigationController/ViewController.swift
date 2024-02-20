//
//  ViewController.swift
//  NavigationController
//
//  Created by mac on 10/01/24.
//

import UIKit


class ViewController: UIViewController  {
    @IBOutlet var EmailTF: UITextField!
    @IBOutlet var PassTF: UITextField!
    @IBOutlet var SignInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func TapSignUp(_ sender: UIButton) {
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    @IBAction func LoginIntap(_ sender: Any) {
//        guard let email = EmailTF.text, let pass = PassTF.text, Details.firstIndex
    }
}

