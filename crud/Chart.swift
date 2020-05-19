//
//  Chart.swift
//  crud
//
//  Created by User02 on 2020/5/19.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct Chart: View {
    @State private var trimEnd: CGFloat = 0
    @ObservedObject var Data = Viewmodel()

    
    
    var index:CGFloat = 0
    var ratio:[CGFloat] = [0, 0, 0, 0, 0]
    var countPostion:[CGFloat] = [0, 0, 0, 0, 0]
    
    
    init(Data: Viewmodel) {
    for data in Data.models {
        index += 1;
        if data.position == "上路" {
            countPostion[0] += 1;
        } else if data.position == "打野" {
            countPostion[1] += 1;
        } else if data.position == "中路" {
            countPostion[2] += 1;
        } else if data.position == "下路" {
            countPostion[3] += 1;
        } else {
            countPostion[4] += 1;
        }
    }
        ratio[0] = countPostion[0] / index
        ratio[1] = countPostion[1] / index
        ratio[2] = countPostion[2] / index
        ratio[3] = countPostion[3] / index
        ratio[4] = countPostion[4] / index
    }

    
    var body: some View {
    NavigationView {
        ZStack{
            Circle()
                
                .trim(from: 0, to:  ratio[0])
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 30,
                                                       lineCap: .round))
                .frame(width: 300, height: 300)
                .animation(.linear(duration: 0.75))
                .onAppear {
                    self.trimEnd = self.ratio[0]
                }
            Circle()
                
                .trim(from: ratio[0], to:ratio[0]+ratio[1])
                .stroke(Color.red, style: StrokeStyle(lineWidth: 30,
                                                       lineCap: .round))
                .frame(width: 300, height: 300)
                .animation(.linear(duration: 0.75))
                .onAppear {
                    self.trimEnd = self.ratio[1]
                }
            Circle()
                
                .trim(from: ratio[0]+ratio[1], to:ratio[0]+ratio[1]+ratio[2])
            .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30,
                                                   lineCap: .round))
            .frame(width: 300, height: 300)
            .animation(.linear(duration: 0.75))
            .onAppear {
                self.trimEnd = self.ratio[2]
            }
            
            Circle()
                .trim(from: ratio[0]+ratio[1]+ratio[2], to:ratio[0]+ratio[1]+ratio[2]+ratio[3])
            .stroke(Color.green, style: StrokeStyle(lineWidth: 30,
                                                   lineCap: .round))
            .frame(width: 300, height: 300)
            .animation(.linear(duration: 0.75))
            .onAppear {
                self.trimEnd = self.ratio[3]
            }
            
            Circle()
                .trim(from: ratio[0]+ratio[1]+ratio[2]+ratio[3], to:ratio[0]+ratio[1]+ratio[2]+ratio[3]+ratio[4])
            .stroke(Color.purple, style: StrokeStyle(lineWidth: 30,
                                                   lineCap: .round))
            .frame(width: 300, height: 300)
            .animation(.linear(duration: 0.75))
            .onAppear {
                self.trimEnd = self.ratio[4]
            }
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
            }.navigationBarTitle("路線選擇率")
        }
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(Data: Viewmodel())
    }
}
