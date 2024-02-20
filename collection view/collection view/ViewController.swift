//
//  ViewController.swift
//  collection view
//
//  Created by mac on 18/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collection: UICollectionView!
    
    var arr = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
//        arr = [UIImage(systemName: "gear"),UIImage(systemName: "house"),UIImage(systemName: "gear"),UIImage(systemName: "house"),UIImage(systemName: "gear"),UIImage(systemName: "house")]
    }


}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Tapped")
    }
}


extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.img.image = UIImage(named: "background")
        cell.img.contentMode = .scaleAspectFit
//        cell.img.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return cell
    }
    
    
}


extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.frame.width
        return CGSize(width: collectionwidth/4 - 2, height: collectionwidth/4 - 2)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
