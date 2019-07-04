//
//  TableViewCell.swift
//  DataCore
//
//  Created by Alivelu Ravula on 4/26/18.
//  Copyright © 2018 brn. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var savePoliPartyTF: UILabel!
    @IBOutlet weak var savePoliStateTF: UILabel!
    @IBOutlet weak var savePoliNamTF: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
