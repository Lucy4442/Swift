//
//  SecondViewController.swift
//  collection view
//
//  Created by mac on 18/01/24.
//

import UIKit

class SecondViewController: UIViewController {

    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = ["pencil","house","gear","pencil","house","gear","pencil","house","gear"]
    }
    
}

extension SecondViewController : UICollectionViewDelegate{
    
}


extension SecondViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SecondCollectionViewCell
        cell.image.image = UIImage(systemName: arr[indexPath.row])
        return cell
    }
    
    
    
}


extension SecondViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
}
