//
//  ProductItemCell.swift
//  TUCI
//
//  Created by Anurag Sharma on 07/02/24.
//

import UIKit


class ProductItemCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var productInfo: ProductItemInfo?
    var onIconTap: ((ProductItemInfo) -> Void)?
    var isInCart: Bool {
        return CartManager.shared.isProductInCart(self.productInfo!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
    }
    
    func configure(with productInfo: ProductItemInfo, isInCart: Bool) {
        self.productInfo = productInfo
        label1.text = productInfo.label1Text
        label2.text = productInfo.label2Text
        label3.text = productInfo.label3Text
        label4.text = productInfo.label4Text
        icon.image = isInCart ? UIImage(systemName: "checkmark") : UIImage(systemName: "plus")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        icon.isUserInteractionEnabled = true
        icon.addGestureRecognizer(tapGesture)
    }
    
    @objc func iconTapped() {
        guard let productInfo = productInfo else { return }
        
        if let onTap = onIconTap {
            onTap(productInfo)
            icon.image = isInCart ? UIImage(systemName: "checkmark") : UIImage(systemName: "plus")
        }
    }
}
