//
//  ContentView.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
@ObservedObject var Data = Viewmodel()
 var body: some View {
     TabView {
        Viewlist()
            .tabItem {
                Image(systemName: "photo")
                    .font(Font.system(size: 20, weight: .bold))
                Text("對戰紀錄")
        }
        Chart(Data: self.Data)
             .tabItem {
                 Image(systemName: "chart.pie.fill")
                    .font(Font.system(size: 20))
                 Text("路線選擇率")
         }
        Chart1(Data: self.Data)
            .tabItem {
                    Image(systemName: "chart.pie.fill")
                       .font(Font.system(size: 20))
                    Text("勝率")
            }
     }
 }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
