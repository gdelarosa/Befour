//
//  Item.swift
//  Befour
//
//  Created by Gina De La Rosa on 1/6/19.
//  Copyright © 2019 Gina De La Rosa. All rights reserved.
//

import Foundation

class Item: NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
