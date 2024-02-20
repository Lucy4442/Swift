//
//  TableViewCell.swift
//  customtable
//
//  Created by mac on 17/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var myimage: UIImageView!
    @IBOutlet var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func configure(with name : String , img : String)
    {
        lbl.text = name
        myimage.image = UIImage(systemName: img)
    }
    
}
