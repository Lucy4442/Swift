//
//  CollectionViewCell.swift
//  todo with collection
//
//  Created by mac on 18/01/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let lbl = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(lbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
