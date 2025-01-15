//
//  ContentView.swift
//  pia13swiftbyggapp
//
//  Created by Malmö Yrkehögskolan on 2025-01-13.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var shopmodel = ShoppingModel()
    
    @State var showList = true
    @State var showFav = false
    @State var showShopDetail = false
    @State var showShopSelect = true

    var body: some View {
        VStack{
            HStack{
                Button(showList ? "MAP" : "LIST"){
                    showList.toggle()
                }
                .padding(.leading)
                
                Spacer()
                
                Text("AFFÄR X")
                Button("O"){
                    showShopSelect.toggle()
                }
                
                Spacer()
                
                Button("FAV"){
                    showFav.toggle()
                }
                
                .padding(.horizontal)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            
            ZStack{
                VStack{
                    if showList{
                        ShopListView(shopmodel
                                     : shopmodel)
                    }else{
                        ShopMapView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if showShopSelect{
                VStack{
                    HStack{
                        Spacer()
                        Button("+"){
                            showShopDetail.toggle()
                        }
                    }
                    .padding(.trailing)
                    
                    Button("Affär A"){
                        showShopDetail.toggle()
                    }
                    Button("Affär B"){
                        showShopDetail.toggle()
                    }
                }
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Color.black)
            }//VStack
          }//ZStack
        }//vstack
        .fullScreenCover(isPresented: $showFav){
            FavoriteView()
        }
        .fullScreenCover(isPresented: $showShopDetail){
            ShopDetailView()
        }
        
    }//body
}

#Preview {
    ContentView()
        .modelContainer(for: ShopItem.self, inMemory: true)
}

/*
 struct ContentView: View {
 @Environment(\.modelContext) private var modelContext
 @Query private var items: [Item]
 
 var body: some View {
 NavigationSplitView {
 List {
 ForEach(items) { item in
 NavigationLink {
 Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
 } label: {
 Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
 }
 }
 .onDelete(perform: deleteItems)
 }
 .toolbar {
 ToolbarItem(placement: .navigationBarTrailing) {
 EditButton()
 }
 ToolbarItem {
 Button(action: addItem) {
 Label("Add Item", systemImage: "plus")
 }
 }
 }
 } detail: {
 Text("Select an item")
 }
 }
 
 private func addItem() {
 withAnimation {
 let newItem = Item(timestamp: Date())
 modelContext.insert(newItem)
 }
 }
 
 private func deleteItems(offsets: IndexSet) {
 withAnimation {
 for index in offsets {
 modelContext.delete(items[index])
 }
 }
 }
 }
 
 
 
 
 */
