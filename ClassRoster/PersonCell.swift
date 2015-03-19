//
//  PersonCell.swift
//  ClassRoster
//
//  Created by Reeve Vogel on 3/10/15.
//  Copyright (c) 2015 RVCF. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
