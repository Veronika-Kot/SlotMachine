//
//  WheelView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/10/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct WheelView: View {
    //    @State var show = false
    @State private var offset = 0.0
    
    @State private var cards = ["banana", "cherry", "orange", "seven", "empty", "lemon", "empty", "bell", "empty", "grape", "empty", "cherry", "banana", "empty", "empty", "orange", "seven", "empty", "lemon", "bell", "grape", "cherry", "empty", "banana", "orange", "seven", "empty", "bell", "grape", "bell", "cherry"]
    
    @ObservedObject var theWheel = Wheel()
    
    
    var animation: Animation {
        Animation
            .interpolatingSpring(mass: 1.0, stiffness: 0.5, damping: 5, initialVelocity: 1)
            //            .easeInOut(duration: 3.0)
            .speed(4.5).repeatCount(1, autoreverses: false)
    }
    
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Text("")}.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom).background(Color.white).background(Color.red)
            
            VStack(spacing: 20) {
                ForEach(cards, id: \.self) { card in
                    Image(card).resizable()
                        .frame(width: 60.0, height: 60.0)
                        .offset(y: self.theWheel.isSpinning ? 2240 : 0)
                        .animation(self.animation)
                        .padding(.horizontal, 10)
//                        .overlay(Rectangle()
//                        .fill(Color.white)
//                            .frame(width: 10.0)
//                        ,alignment: .leading)
                }
            }.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom).background(Color.white)
            
            VStack {
                Text("")
                    .frame(width: 90, height: 160)
                    .border(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple, Color.blue]), startPoint: .bottom, endPoint: .top), width: 6.0)
                    .padding(10)
                    .border(Color.black, width: 10.0)
                 .padding(.bottom, 24)
//                .overlay(Rectangle()
//                .fill(Color.purple)
//                    .frame(width: 10.0)
////                    ,alignment: .topTrailing)
                
                }.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom)
            
//            Button(action: {
//                if  !self.theWheel.isSpinning{
//                    self.theWheel.animate()
//                } else {
//                    self.theWheel.stopAnimating()
//                }
//            }){
//                Text("Animate")
//            }
            
        }
//        .background(Color.black)
    }
    
    func switchPokemon() {
        self.offset += 1.0
    }
}

struct WheelView_Previews: PreviewProvider {

    static var previews: some View {
        WheelView()
//        .previewLayout(.fixed(width: 896, height: 414))
    }
}
