//
//  InstagramCell.swift
//  Instagram
//
//  Created by Zhipeng Mei on 1/21/16.
//  Copyright © 2016 Zhipeng Mei. All rights reserved.
//

import UIKit

class InstagramCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
