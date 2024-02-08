//
//  CartManager.swift
//  TUCI
//
//  Created by Anurag Sharma on 08/02/24.
//

import UIKit

class CartManager {
    private var cart: [ProductItemInfo] = []
    static let shared = CartManager()
    private init() {}
    
    func addProduct(_ productInfo: ProductItemInfo) {
        if !cart.contains(productInfo) {
            cart.append(productInfo)
            print("\(productInfo.label1Text) added to cart.")
        } else {
            print("\(productInfo.label1Text) already exists in cart.")
        }
    }
    
    func removeProduct(_ productInfo: ProductItemInfo) {
        if let index = cart.firstIndex(of: productInfo) {
            let removedProduct = cart.remove(at: index)
            print("\(removedProduct.label1Text) removed from cart.")
        } else {
            print("\(productInfo.label1Text) not found in cart.")
        }
    }
    
    func isProductInCart(_ productInfo: ProductItemInfo) -> Bool {
           return cart.contains(productInfo)
       }
    
    func getCartItems() -> [ProductItemInfo] {
        return cart
    }
}


