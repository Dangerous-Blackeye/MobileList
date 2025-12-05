//
//  DevicesListTableViewCell.swift
//  Sahil-5thDec25
//
//  Created by Pallavi on 05/12/25.
//

import UIKit

class DevicesListTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deleteDevice: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
