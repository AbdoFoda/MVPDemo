//
//  TodoListViewCell.swift
//  Regisreationform
//
//  Created by Abdo on 10/6/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class TodoListViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
