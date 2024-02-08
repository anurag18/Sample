//
//  ProductItemInfoCell.swift
//  TUCI
//
//  Created by Anurag Sharma on 07/02/24.
//

import UIKit

struct ProductItemInfo: Equatable {
    let label1Text: String
    let label2Text: String
    let label3Text: String
    let label4Text: String
    let label5Text: String?
    let iconImage: UIImage?
    static func == (lhs: ProductItemInfo, rhs: ProductItemInfo) -> Bool {
         return lhs.label1Text == rhs.label1Text &&
                lhs.label2Text == rhs.label2Text &&
                lhs.label3Text == rhs.label3Text &&
                lhs.label4Text == rhs.label4Text &&
                lhs.label5Text == rhs.label5Text &&
                lhs.iconImage == rhs.iconImage
     }
}

class ProductItemInfoCell: UITableViewCell {
    
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
           icon.image = productInfo.iconImage
       }
       
}
