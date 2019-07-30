//
//  SecondViewController.swift
//  RealmStudy
//
//  Created by Adakhanau on 29/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {

    
    @IBOutlet weak var textNote: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var currentItem: Item?
    var database: Realm?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = currentItem {
            deleteButton.setTitle("Delete", for: .normal)
            textNote.text = item.textString
            textNote.resignFirstResponder()
        } else {
            deleteButton.setTitle("Cancel", for: .normal)
            textNote.becomeFirstResponder()
        }
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let item = Item()
        id = UserDefaults.standard.integer(forKey: "id")
        
        if (currentItem == nil) {
            item.ID = id + 1
            UserDefaults.standard.set(item.ID, forKey: "id")
            item.textString = textNote.text!
            DBManager.sharedInstance.addData(object: item)
        }
         else {
            if let database = try? Realm(),
                let id = currentItem?.ID,
                let task = database.object(ofType: Item.self, forPrimaryKey: id)
            {
                try! database.write {
                    task.textString = textNote.text!
                }
            }
        }
        self.dismiss(animated: true) { }
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any)
    {
        if (currentItem != nil) {
            let item = currentItem!
            DBManager.sharedInstance.deleteFromDb(object: item)
        }
        self.dismiss(animated: true) { }
    }

}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textNote.resignFirstResponder()
        return true
    }
    
}
