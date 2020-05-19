//
//  Viewlist.swift
//  crud
//
//  Created by User02 on 2020/5/19.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

import SwiftUI

struct Viewlist: View {
    @ObservedObject var Data = Viewmodel()
    @State private var showEditor = false
    var body: some View {
        NavigationView {
         List {
            ForEach(Data.models) { (model) in
                NavigationLink(destination: Editor(Data:self.Data, editor: model)){
                    Row(model: model)
                }
            }
            .onDelete { (indexSet) in
                        self.Data.models.remove(atOffsets: indexSet) }
         }
         .navigationBarTitle("列表")
         .navigationBarItems(leading: EditButton().colorInvert(),trailing:
            Button(action: {
                self.showEditor = true}
                , label: {
                    Image(systemName: "plus.circle.fill").colorInvert()
                }))
         .sheet(isPresented: $showEditor) {
            NavigationView {
                Editor(Data: self.Data)
                }
            }
        }
    }
}

struct Viewlist_Previews: PreviewProvider {
    static var previews: some View {
        Viewlist()
    }
}
