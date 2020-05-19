//
//  MoDel.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//


import Foundation

struct MoDel: Identifiable, Codable{
    let id = UUID()
    var name: String
    var kill: Int
    var death: Int
    var assist: Int
    var win: Bool
    var position: String
    
    

}

