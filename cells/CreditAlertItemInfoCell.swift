//
//  CreditAlertItemInfoCell.swift
//  TUCI
//
//  Created by Anurag Sharma on 07/02/24.
//

import UIKit

class CreditAlertItemInfoCell: UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
       
       func configure(with productInfo: ProductItemInfo) {
           label1.text = productInfo.label1Text
           label2.text = productInfo.label2Text
           label3.text = productInfo.label3Text
           label4.text = productInfo.label4Text
       }
}
