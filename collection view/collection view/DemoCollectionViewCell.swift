//
//  DemoCollectionViewCell.swift
//  collection view
//
//  Created by mac on 18/01/24.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
   public func configure(with image : UIImage)
    {
        img.image = image
    }
    
    static func nib () -> UINib{
        let nib = UINib(nibName: "DemoColletionViewCell", bundle: nil)
        return nib
    }
}
