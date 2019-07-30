//
//  DBManager.swift
//  RealmStudy
//
//  Created by Adakhanau on 29/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {
    
    private var database: Realm
    static let sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<Item> {
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    func addData(object: Item)   {
        try! database.write {
            database.add(object)
            print("Added new object")
        }
    }
    
    func deleteFromDb(object: Item)   {
        try!   database.write {
            database.delete(object)
        }
    }
    
    // delete all objects from DB
//    func deleteAllFromDatabase()  {
//        try!   database.write {
//            database.deleteAll()
//        }
//    }
    
}
