//
//  ViewController.swift
//  ImagePicker
//
//  Created by mac on 09/01/24.
//

import UIKit

class ViewController: UIViewController{

    
    
    @IBOutlet var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.contentMode = .scaleToFill
       
    }
    
    @IBAction func didTap(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
   
}

extension ViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let img = info[.originalImage] as? UIImage{
            imageview.image = img
            }
        picker.dismiss(animated: true, completion: nil)
    }
            
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
}

