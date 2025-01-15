//
//  ShopRowView.swift
//  pia13swiftbyggapp
//
//  Created by Malmö Yrkehögskolan on 2025-01-15.
//

import SwiftUI

struct ShopRowView: View {
    var shopitems : ShopItem
    var body: some View {
        HStack{
            
            Text(shopitems.name)
            Spacer()
            Text("\(shopitems.amount)")
        }
    }
}

#Preview {
    ShopRowView(shopitems:
                    ShopItem(name: "Test", amount: 123))
}
