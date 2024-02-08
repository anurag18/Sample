//
//  ViewController.swift
//  TUCI
//
//  Created by Anurag Sharma on 07/02/24.
//

import UIKit


class ProductsViewController: UIViewController {

    @IBOutlet weak var products_tableView: UITableView!
    var dataArray: [[ProductItemInfo]] = [
            [ProductItemInfo(label1Text: "Free Credit Report",
                             label2Text: "01/02/2023",
                             label3Text: "384 days remaining",
                             label4Text: "Most popular",
                             label5Text: nil,
                             iconImage: UIImage(systemName: "checkmark.circle.fill")),
             ProductItemInfo(label1Text: "Credit Report & Score",
                              label2Text: "In Cart",
                              label3Text: "Read More",
                             label4Text: "R50.00",
                             label5Text: nil,
                              iconImage:UIImage(systemName: "plus.rectangle.portrait")),
             ProductItemInfo(label1Text: "Business Credit Report",
                             label2Text: "In Cart",
                             label3Text: "Read More",
                             label4Text: "R50.00",
                             label5Text: nil,
                             iconImage:UIImage(systemName: "plus.rectangle.portrait")),
             ProductItemInfo(label1Text: "Car Value Report",
                             label2Text: "In Cart",
                             label3Text: "Read More",
                             label4Text: "R50.00",
                             label5Text: nil,
                             iconImage:UIImage(systemName: "plus.rectangle.portrait"))
                             ],
            [ProductItemInfo(label1Text: "Credit Alerts",
                             label2Text: "Number of critical changes to your profile",
                             label3Text: "Read More",
                             label4Text: "0",
                             label5Text: nil,
                             iconImage: UIImage(named: "yourImage")),
             ProductItemInfo(label1Text: "True Credit",
                              label2Text: "With Credit Alerts",
                              label3Text: "Score & Reports",
                             label4Text: "Read More",
                             label5Text: "Subscribe for \n R49.0/ Month \n Once off year for R499",
                              iconImage: UIImage(systemName: "plus.rectangle.portrait")),
             ProductItemInfo(label1Text: "True Identity",
                              label2Text: "Monitor, Restore & Recover your identity",
                              label3Text: "Recover your identity",
                             label4Text: "Read More", label5Text: "Subscribe for \n R49.0/ Month \n Once off year for R499",
                              iconImage:UIImage(systemName: "plus.rectangle.portrait"))
]
            // Add more data for other sections here
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductsTableView()
        // Do any additional setup after loading the view.
    }

    func setupProductsTableView() {
        products_tableView.delegate = self
        products_tableView.dataSource = self
        
        products_tableView.register(UINib(nibName: "ProductItemInfoCell", bundle: nil), forCellReuseIdentifier: "ProductItemInfoCell")
        products_tableView.register(UINib(nibName: "ProductItemCell", bundle: nil), forCellReuseIdentifier: "ProductItemCell")
        products_tableView.register(UINib(nibName: "CreditAlertItemInfoCell", bundle: nil), forCellReuseIdentifier: "CreditAlertItemInfoCell")
        products_tableView.register(UINib(nibName: "CreditAlertItemCell", bundle: nil), forCellReuseIdentifier: "CreditAlertItemCell")
        products_tableView.register(UINib(nibName: "CreditIdentityCell", bundle: nil), forCellReuseIdentifier: "CreditIdentityCell")

    }
    
    
    func handleIconTap(for productInfo: ProductItemInfo) {
        CartManager.shared.isProductInCart(productInfo) ? removeFromCart(productInfo) : addToCart(productInfo)
    }

    func addToCart(_ productInfo: ProductItemInfo) {
        // Add logic to add item to cart
        CartManager.shared.addProduct(productInfo)
    }

    func removeFromCart(_ productInfo: ProductItemInfo) {
        CartManager.shared.removeProduct(productInfo)
    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
            // Number of sections based on the array count
            return dataArray.count
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row > 0 {
            return 167
        }
        return 107 // Set your desired height here
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Number of rows in each section
            return dataArray[section].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let rowData = dataArray[indexPath.section][indexPath.row]
            
            // Configure cells based on indexPath and data
            if indexPath.section == 0 {
                // Once-off products section
                if indexPath.row == 0 {
                    // Type 1 cell
                    let productInfo = dataArray[0][0]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductItemInfoCell", for: indexPath) as! ProductItemInfoCell
                      
                      
                      cell.configure(with: productInfo)
                    // Configure cell with data
                    return cell
                } else {
                    // Type 2 cell
                    let productInfo = dataArray[0][indexPath.row]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductItemCell", for: indexPath) as! ProductItemCell
                    cell.configure(with: productInfo, isInCart: false)
                    cell.onIconTap = { [weak self] productInfo in
                            self?.handleIconTap(for: productInfo)
                        }
                    // Configure cell with data
                    return cell
                }
            } else {
                // Credit alert and identity protection section
                if indexPath.row == 0 {
                    // Type 1 cell
                    let productInfo = dataArray[1][0]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "CreditAlertItemInfoCell", for: indexPath) as! CreditAlertItemInfoCell
                    cell.configure(with: productInfo)
                    // Configure cell with data
                    return cell
                } else {
                    // Type 2 cell
                    let productInfo = dataArray[1][indexPath.row]
                    let cell = tableView.dequeueReusableCell(withIdentifier: "CreditAlertItemCell", for: indexPath) as! CreditAlertItemCell
                    cell.configure(with: productInfo)
                    cell.onIconTap = { [weak self] productInfo in
                            self?.handleIconTap(for: productInfo)
                        }
                    // Configure cell with data
                    return cell
                }
            }
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            // Return section names
            return section == 0 ? "Once-off products" : "Credit Alert & Identity Protection"
        }
    
}
