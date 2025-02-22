//
//  ShopItem.swift
//  pia13swiftbyggapp
//
//  Created by Malmö Yrkehögskolan on 2025-01-15.
//

import Foundation
import SwiftData

@Model
final class ShopItem {
    var store : StoreItem?
    
    var name: String
    var amount: Int
    var done: Bool = false

    var favorite: Bool = false

    init(name: String, amount : Int) {
        self.name = name
        self.amount = amount
    }
}
