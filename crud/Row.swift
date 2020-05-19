//
//  Row.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct Row: View {
    var model: MoDel

    var body: some View {
        HStack {
            Text(model.name)
            Text("k/d/a \(model.kill)/\(model.death)/\(model.assist)")
            Image(model.name)
            Text(model.position)
            Spacer()
            Image(model.win ? "勾勾" : "叉叉")
            
        }

    }
}

