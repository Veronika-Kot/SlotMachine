//
//  WheelView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/10/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI

// Custom view for a single wheel/reel, containes UI elements and animation
struct WheelView: View {
    
    //Observable object - one for each insrance of wheel
    @ObservedObject var theWheel = Wheel()
    
    //Array of fruits names
    var theCards: [String]
    
    //Spring Animation
    var animation: Animation {
        Animation
            .interpolatingSpring(mass: 1.2, stiffness: 0.5, damping: 3.5, initialVelocity: 1)
            .speed(4.5).repeatCount(1, autoreverses: false)
    }
    
    init(aCards: [String], aWheel: Wheel){
        self.theCards = aCards
        self.theWheel = aWheel
    }
    
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("")}.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom).background(Color.white)
            
            VStack(spacing: 20) {
                ForEach(self.theCards, id: \.self) { card in
                    Image(card).resizable()
                        .frame(width: 60.0, height: 60.0)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .offset(y: self.theWheel.isSpinning ? 2240 : 0) // changing offset for each image
                                                                        // from 0 to 2240 and back
                        .animation(self.animation)    // calling animation
                }
            }.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom).background(Color.white)
            
            VStack(spacing: 0) {
                Spacer()
                Rectangle().stroke()
                    .frame(width: 90, height: 160)
                    .border(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple, Color.blue]), startPoint: .bottom, endPoint: .top), width: 6.0)
                    .padding(2)
                .shadow(color: Color("DarkSilver"), radius: 4, x: -3, y: -3)
                    .shadow(color: Color("DarkSilver"), radius: 4, x: 3, y: 3)
                    .padding(8)
                    .border(Color.black, width: 10.0)
                    .padding(.bottom, 24)
                    .offset(y: 160)
                
                VStack(spacing: 0){
                    Text("")
                        .frame(width: 90, height: 160)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"),                                     Color("Silver"), Color("Silver"), Color("Silver")]), startPoint: .top, endPoint: .bottom)).offset(y: 160)
                }.zIndex(2)
                
                
            }.frame(minHeight: 1, maxHeight: .infinity, alignment: .bottom)
        }
    }
}
