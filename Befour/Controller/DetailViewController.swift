//
//  DetailListViewController.swift
//  Befour
//
//  Created by Gina De La Rosa on 1/6/19.
//  Copyright © 2019 Gina De La Rosa. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
        func itemDetailViewControllerDidCancel(_ controller: DetailViewController)
        func itemDetailViewController(_ controller: DetailViewController, didFinishAdding item: Item)
        func itemDetailViewController(_ controller: DetailViewController, didFinishEditing item: Item)
    }
    
class DetailViewController: UITableViewController {
        
        weak var delegate: DetailViewControllerDelegate?
        weak var todoList: List?
        weak var itemToEdit: Item?
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var todoText: UITextField!
    
    
    @IBAction func cancelAction(_ sender: Any) {
            delegate?.itemDetailViewControllerDidCancel(self)
        }
        
    @IBAction func done(_ sender: Any) {
            if let item = itemToEdit, let text = todoText.text {
                item.text = text
                delegate?.itemDetailViewController(self, didFinishEditing: item)
            } else {
                if let item = todoList?.newTodo() {
                    if let textFieldText = todoText.text {
                        item.text = textFieldText
                    }
                    item.checked = false
                    delegate?.itemDetailViewController(self, didFinishAdding: item)
                }
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let item = itemToEdit {
                title = "Edit Item"
                todoText.text = item.text
                addButton.isEnabled = true
            }
            navigationItem.largeTitleDisplayMode = .never
        }
        
        override func viewWillAppear(_ animated: Bool) {
            todoText.becomeFirstResponder()
        }
        override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
    }

extension DetailViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            todoText.resignFirstResponder()
            return false
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            guard let oldText = todoText.text,
                let stringRange = Range(range, in: oldText) else {
                    return false
            }
            
            let newText = oldText.replacingCharacters(in: stringRange, with: string)
            
            if newText.isEmpty {
                addButton.isEnabled = false
            } else {
                addButton.isEnabled = true
            }
            return true
        }
}
