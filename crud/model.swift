//
//  model.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//
import Foundation

struct model: Identifiable {
    let id = UUID()
    var name: String
    var weight: Int
    var trueHeart: Bool
}
