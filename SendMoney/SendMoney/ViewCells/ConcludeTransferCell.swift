//
//  ConcludeTransferCell.swift
//  SendMoney
//
//  Created by Jeferson Nazario on 28/06/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class ConcludeTransferCell: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var txtAmountToSend: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(user: UserProfile) {
        ImageUtils.downloadImage(user.img, completion: { response in
            self.userAvatar.image = response
        })
        
        lblName.text = user.name
        lblUsername.text = user.username
        lblCurrency.text = Localize.Currency.rawValue.localized
        txtAmountToSend.tag = user.id
    }
    
    @IBAction func amountChanged(_ sender: UITextField) {
        if let amountString = sender.text?.currencyInputFormatting() {
            sender.text = amountString
        }
    }

}