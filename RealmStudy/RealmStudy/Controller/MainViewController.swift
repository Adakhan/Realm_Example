//
//  ViewController.swift
//  RealmStudy
//
//  Created by Adakhanau on 29/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }

    
    @IBAction func addButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        vc.currentItem = nil
        self.present(vc, animated: false, completion: nil)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let item = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item // [4]
        cell.textLabel!.text = item.textString 
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        let item = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item
        
        vc.currentItem = item
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
