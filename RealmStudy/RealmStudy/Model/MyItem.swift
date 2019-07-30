//
//  MyItem.swift
//  RealmStudy
//
//  Created by Adakhanau on 30/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
    
    @objc dynamic var ID = 0
    @objc dynamic var textString = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
}
