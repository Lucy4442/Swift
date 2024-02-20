//
//  SignupViewController.swift
//  NavigationController
//
//  Created by mac on 10/01/24.
//

import UIKit

//struct Detail
//{
//    var Name : String
//    var Email : String
//    var Password : String
//}

class SignupViewController: UIViewController {

    @IBOutlet var NameTF: UITextField!
    @IBOutlet var EmailTF: UITextField!
    @IBOutlet var PassTF: UITextField!
    @IBOutlet var ConfirmPassTF: UITextField!
    @IBOutlet var SignUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpBtn.layer.cornerRadius = 20.0
        let SignIn = UIBarButtonItem()
        SignIn.title = "Sign In"
        SignIn.target = self
        SignIn.action = #selector(LoginTap)
        SignIn.tintColor = .purple
        self.navigationItem.leftBarButtonItem = SignIn
        
    }
    
    @IBAction func insertdata(_ sender: Any) {
        var data = Detail(Name: "", Email: "", Password: "")
        
        guard !NameTF.text!.trimmingCharacters(in: .whitespaces).isEmpty else{
            NameTF.becomeFirstResponder()
            print("it shoun't be empty")
            return
        }
        data.Name = NameTF.text!
        
        guard !EmailTF.text!.trimmingCharacters(in: .whitespaces).isEmpty else{
            EmailTF.becomeFirstResponder()
            print("it shoun't be empty")
            return
        }
        data.Email = EmailTF.text!
        
        guard !PassTF.text!.trimmingCharacters(in: .whitespaces).isEmpty else{
            PassTF.becomeFirstResponder()
            print("it shoun't be empty")
            return
        }
        guard !ConfirmPassTF.text!.trimmingCharacters(in: .whitespaces).isEmpty else{
            ConfirmPassTF.becomeFirstResponder()
            print("it shoun't be empty")
            return
        }
        guard (PassTF.text == ConfirmPassTF.text) else
        {
            ConfirmPassTF.becomeFirstResponder()
            print("Password is Not Matched")
            return
        }
        data.Password = PassTF.text!
        Details.append(data)
        print(Details)
    }
    
    @IBAction func LoginTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
