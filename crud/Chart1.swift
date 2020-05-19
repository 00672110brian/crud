//
//  Chart1.swift
//  crud
//
//  Created by User02 on 2020/5/19.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct Chart1: View {
    @ObservedObject var Data = Viewmodel()

       
       
       var index:Double = 0
       var ratio:[Double] = [0, 0, 0, 0, 0]
       var countPostion:[Double] = [0, 0, 0, 0, 0]
       
       
       init(Data: Viewmodel) {
       for data in Data.models {
        if data.position == "上路" {
            if data.win == true{
               countPostion[0] += 1;
                index += 1;
            }
           } else if data.position == "打野" {
            if data.win == true{
               countPostion[1] += 1;
                index += 1;
            }
           } else if data.position == "中路" {
            if data.win == true{
               countPostion[2] += 1;
                index += 1;
            }
           } else if data.position == "下路" {
            if data.win == true{
               countPostion[3] += 1;
                index += 1;
            }
           } else {
            if data.win == true{
               countPostion[4] += 1;
                index += 1;
            }
           }
       }
           ratio[0] = countPostion[0] / index
           ratio[1] = countPostion[1] / index
           ratio[2] = (countPostion[2]) / index
           ratio[3] = (countPostion[3]) / index
           ratio[4] = (countPostion[4]) / index
       }

    var body: some View {
        NavigationView{
        ZStack{
            Path { (path) in
                           path.move(to: CGPoint(x: 200, y: 300))
                           path.addArc(center: CGPoint(x: 200, y: 300), radius:
                               150, startAngle:.zero, endAngle:.degrees(ratio[0]*360), clockwise: false)
                        }
                        .fill(Color.blue)
            
            Path { (path) in
                           path.move(to: CGPoint(x: 200, y: 300))
                           path.addArc(center: CGPoint(x: 200, y: 300), radius:
                               150, startAngle: .degrees(ratio[0]*360), endAngle:.degrees((ratio[0]+ratio[1])*360), clockwise: false)
                           }
                         .fill(Color.red)
            
            Path { (path) in
              path.move(to: CGPoint(x: 200, y: 300))
              path.addArc(center: CGPoint(x: 200, y: 300), radius:
                  150, startAngle: .degrees((ratio[0]+ratio[1])*360), endAngle:.degrees((ratio[0]+ratio[1]+ratio[2])*360), clockwise: false)
              }
                .fill(Color.yellow)
            
            Path { (path) in
            path.move(to: CGPoint(x: 200, y: 300))
            path.addArc(center: CGPoint(x: 200, y: 300), radius:
                150, startAngle: .degrees((ratio[0]+ratio[1]+ratio[2])*360), endAngle:.degrees((ratio[0]+ratio[1]+ratio[2]+ratio[3])*360), clockwise: false)
            }
              .fill(Color.green)
            
            Path { (path) in
            path.move(to: CGPoint(x: 200, y: 300))
            path.addArc(center: CGPoint(x: 200, y: 300), radius:
                150, startAngle: .degrees((ratio[0]+ratio[1]+ratio[2]+ratio[3])*360), endAngle:.degrees((ratio[0]+ratio[1]+ratio[2]+ratio[3]+ratio[4])*360), clockwise: false)
            }
              .fill(Color.purple)
            ZStack{
                                  Image(systemName: "square.fill")
                                   .foregroundColor(.blue)
                                   .offset(x:-50,y:220)
                                   Text("上路" + String(format: "%.1f", ratio[0] * 100) + "%")
                                   .offset(x:20,y:220)
                                   Image(systemName: "square.fill")
                                   .foregroundColor(.red)
                                   .offset(x:-50,y:240)
                                   Text("打野" + String(format: "%.1f", ratio[1] * 100) + "%")
                                   .offset(x:20,y:240)
                                   
                                   Image(systemName: "square.fill")
                                   .foregroundColor(.yellow)
                                   .offset(x:-50,y:260)
                                   Text("中路" + String(format: "%.1f", ratio[2] * 100) + "%")
                                   .offset(x:20,y:260)
                       
                                   Image(systemName: "square.fill")
                                   .foregroundColor(.green)
                                   .offset(x:-50,y:280)
                                   Text("下路" + String(format: "%.1f", ratio[3] * 100) + "%")
                                   .offset(x:20,y:280)
                       
                                   Image(systemName: "square.fill")
                                   .foregroundColor(.purple)
                                   .offset(x:-50,y:300)
                                   Text("輔助" + String(format: "%.1f", ratio[4] * 100) + "%")
                                   .offset(x:20,y:300)
                }
            }.navigationBarTitle("勝率")
        }
    }
}

struct Chart1_Previews: PreviewProvider {
    static var previews: some View {
        Chart1(Data: Viewmodel())
    }
}
