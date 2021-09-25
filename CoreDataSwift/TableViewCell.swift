//
//  TableViewCell.swift
//  CoreDataSwift
//
//  Created by Raj on 15/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    var studentDeclared:Student! {
        didSet{
            lblName.text = studentDeclared.name
            lblAddress.text = studentDeclared.address
            lblCity.text = studentDeclared.city
            lblMobile.text = studentDeclared.mobile
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
