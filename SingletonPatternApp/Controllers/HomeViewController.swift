//
//  HomeViewController.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 12/08/23.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewItems: UITableView!

    var items = Items.shared
    var selectedItem : String?
    var selectedItemIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableViewItems.dataSource = self
        tableViewItems.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if items.itemsList != nil, !items.itemsList!.isEmpty {
            tableViewItems.reloadData()
        } else if items.itemsList != nil, items.itemsList!.isEmpty {
            items.itemsList = nil
            tableViewItems.reloadData()
        }
    }
    
    @IBAction func btnAddItemAction(_ sender: UIButton) {
        var txtFieldTitle = UITextField()
        var txtFieldDescription = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "Please, entered a new item:", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default) { action in
            
            if let txtTitle = txtFieldTitle.text, !txtTitle.isEmpty, let txtDesc = txtFieldDescription.text, !txtDesc.isEmpty  {
                if self.items.itemsList == nil {
                    self.items.itemsList = [Item]()
                }
                
                let newItem = Item(title: txtTitle, description: txtDesc)
                
                self.items.itemsList?.append(newItem)
                self.tableViewItems.reloadData()
            }
        }
    
        alert.addAction(alertAction)
        alert.addTextField { txtFieldAlert in
            txtFieldAlert.placeholder = "Create new item"
            txtFieldTitle = txtFieldAlert
        }
        
        alert.addTextField { txtFieldAlert in
            txtFieldAlert.placeholder = "Add description"
            txtFieldDescription = txtFieldAlert
        }
        
        present(alert, animated: true)
    }
    
    
    @IBAction func btnLogoutAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sign out", message: "Do you want to sign out?", preferredStyle: .alert)

        let logoutAction = UIAlertAction(title: "Log out", style: .default) { action in

            let firebaseAuth = Auth.auth()

            do {
                try firebaseAuth.signOut()
                self.navigationController?.popToRootViewController(animated: true)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(cancelAction)
        alert.addAction(logoutAction)

        present(alert, animated: true)
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource Methods
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.itemsList != nil {
            return items.itemsList!.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        
        if items.itemsList != nil, !items.itemsList!.isEmpty {
            content.text = items.itemsList![indexPath.row].title
        } else {
            content.text = "No items added yet"
            cell.backgroundColor = .lightGray
        }
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if items.itemsList != nil, !items.itemsList!.isEmpty {
            selectedItem = items.itemsList![indexPath.row].title
            selectedItemIndex = indexPath.row
            performSegue(withIdentifier: "goToDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ItemDetailsViewController else { return }
    
        vc.items = items
        vc.itemIndex = selectedItemIndex
    }
}

