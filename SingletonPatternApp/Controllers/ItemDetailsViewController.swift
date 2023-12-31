//
//  ItemDetailsViewController.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 17/08/23.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    
    @IBOutlet weak var txtFieldTitle: UITextField!
    
    @IBOutlet weak var txtAreaDescription: UITextView!
    
    //    var items = Items.shared
    var items : Items!
    var itemIndex : Int!
    var item : Item!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        item = items.itemsList![itemIndex]
        txtFieldTitle.text = item.title
        txtAreaDescription.text = item.description
        txtAreaDescription.layer.cornerRadius = 10
        txtAreaDescription.layer.borderWidth = 1
        txtAreaDescription.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    }

    @IBAction func btnUpdateItemAction(_ sender: UIButton) {
        if let txtTitle = txtFieldTitle.text, !txtTitle.isEmpty,
           let txtDescription = txtAreaDescription.text, !txtDescription.isEmpty {
            item.title = txtTitle
            item.description = txtDescription
            items.itemsList![itemIndex] = item
                      
            navigationController?.popViewController(animated: true)
        } else if txtFieldTitle.text!.isEmpty && txtAreaDescription.text.isEmpty {
            items.itemsList?.remove(at: itemIndex)
            navigationController?.popViewController(animated: true)
        } else{
            showAlert()
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Sorry!", message: "you need to complete the information on the form", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
