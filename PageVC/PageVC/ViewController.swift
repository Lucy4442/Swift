//
//  ViewController.swift
//  PageVC
//
//  Created by mac on 20/02/24.
//

import UIKit

class ViewController: UIViewController {

    var imgStr : String?
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgName = imgStr{
            imgView.image = UIImage(imageLiteralResourceName: imgName)
        }
       
    }
}

