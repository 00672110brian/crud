//
//  Editor.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct Editor: View {
    @Environment(\.presentationMode) var presentationMode
    var Data: Viewmodel
    
    @State private var assist = 0
    @State private var death = 0
    @State private var theDay = Date()
    @State private var name = "非歐拉"
    @State private var position = "上路"
    @State private var kill = 0
    @State private var win = true
    var roles = ["非歐拉", "阿姆姆","雷歐娜","路西恩","阿狸","珊娜"]
    var positions = ["上路", "打野","中路","下路","輔助"]
    var editor: MoDel?
    
    
    var body: some View {
      
        Form {
            Picker(selection: $name, label: Text("選擇角色")) {
               ForEach(roles, id: \.self) { (role) in
                  Text(role)
               }
            }.frame(width: 300, height: 150)
              .clipped()
            .pickerStyle(WheelPickerStyle())
            
            Picker("位置", selection: $position) {
                ForEach(positions, id: \.self) { (position)in
                    Text(position)
                }
            }

            Stepper("擊殺 \(kill)", value: $kill, in:0...99)
            Stepper("擊殺 \(death)", value: $death, in:0...99)
            Stepper("擊殺 \(assist)", value: $assist, in:0...99)
            Toggle("勝利？", isOn: $win)
            

        }
        .navigationBarTitle(editor == nil ? "Add new model" : "Edit model")
            .navigationBarItems(trailing: Button("Save") {
                let model = MoDel(name: self.name, kill: self.kill, death: self.death, assist:self.assist,win: self.win,
                                  position: self.position)
                if let editor = self.editor {
                    let index = self.Data.models.firstIndex {
                        $0.id == editor.id
                    }!
                    self.Data.models[index] = model
                }else{
                    self.Data.models.insert(model,at:0)
                }
                self.presentationMode.wrappedValue.dismiss()
            })
                .onAppear {
                
                if let editor = self.editor {                  
                    self.name = editor.name
                    self.kill = editor.kill
                    self.death = editor.death
                    self.assist = editor.assist
                    self.win = editor.win
                    self.position = editor.position
                }
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        Editor(Data: Viewmodel())
    }
}
