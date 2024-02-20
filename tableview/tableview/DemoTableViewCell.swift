//
//  DemoTableViewCell.swift
//  tableview
//
//  Created by mac on 17/01/24.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet var iamge: UIImageView!
    @IBOutlet var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
