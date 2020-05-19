//
//  Viewmodel.swift
//  crud
//
//  Created by User02 on 2020/5/18.
//  Copyright © 2020 sun. All rights reserved.
//

import Combine
import Foundation

class Viewmodel: ObservableObject {
    var cancellable: AnyCancellable?
    @Published var models = [MoDel]()
    
         init() {
             if let data = UserDefaults.standard.data(forKey: "models") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([MoDel].self, from: data) {
                    models = decodedData
                }
            }
            
            cancellable = $models
                .sink(receiveValue: { (value) in
                    let encoder = JSONEncoder()
                    do {
                        let data = try encoder.encode(value)
                        UserDefaults.standard.set(data, forKey:"models")}
                    catch {
                        }
                    })
            }
    
    
    
}
