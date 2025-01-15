//
//  ShopListView.swift
//  pia13swiftbyggapp
//
//  Created by Malmö Yrkehögskolan on 2025-01-15.
//

import SwiftUI
import SwiftData

struct ShopListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var shopitems: [ShopItem]
    var shopmodel : ShoppingModel
    @State var addshopName = ""
    @State var addshopAmount = ""
    var body: some View {
        VStack{
            HStack{
                TextField("Name", text: $addshopName)
                TextField("Amount", text: $addshopAmount)
                    .padding(.trailing)

                Button("Add"){
                    addShop()
                }
            }
            .padding(.horizontal)
            List{
                ForEach(shopitems) { shopitem in
                    ShopRowView(shopitems: shopitem)
                }
            }
        }//vsatck
    }//body
    func addShop() {
        let addAmountNumber = Int(addshopAmount)
        
        if addAmountNumber == nil {
            //Visa fel
            return
        }
        if addshopName == "" {
            //Visa fel
            return
        }
        
        let newItem = ShopItem( name: addshopName, amount: addAmountNumber!)
        modelContext.insert(newItem)
        addshopName = ""
        addshopAmount = ""
    }
}
#Preview {
    ShopListView(shopmodel: ShoppingModel())
        .modelContainer(for: ShopItem.self, inMemory: true)

}