//
//  TableViewCell.swift
//  tableview
//
//  Created by mac on 17/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        var Ahmodel : Ahemdabad!{
            didSet{
                title.text = Ahmodel.title
                city.text = Ahmodel.city
                img.image = Ahmodel.img
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
