//
//  WheelGroup.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/10/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct WheelGroup: View {
    
    @ObservedObject var wheelAnimFirst = Wheel()
    @ObservedObject var wheelAnimSecond = Wheel()
    @ObservedObject var wheelAnimThird = Wheel()
    
    @EnvironmentObject var game: Game
    
    var body: some View {
        ZStack {            
            HStack(spacing: 0) {
                WheelView(aCards: game.cards1, aWheel: wheelAnimFirst)
                WheelView(aCards: game.cards2, aWheel: wheelAnimSecond)
                WheelView(aCards: game.cards3, aWheel: wheelAnimThird)
            }.frame(minHeight: 1, maxHeight: 163, alignment: .bottom)
                .offset(y: 30)
                .padding(.horizontal, 40)
                .padding(.top, 58)
                .padding(.bottom, 30)
                .border(Color.black, width: 30)
                .overlay(Rectangle().fill(Color.black).frame(width: 40.0), alignment: .leading)
                .overlay(Rectangle().fill(Color.black).frame(width: 40.0), alignment: .trailing)
                .overlay(Image("background-line").resizable().frame(height: 20.0), alignment: .top)
                .overlay(Image("background-line").resizable().frame(height: 20.0), alignment: .bottom)
                .overlay(Image("background-line2").resizable().frame(width: 20.0), alignment: .leading)
                .overlay(Image("background-line2").resizable().frame(width: 20.0), alignment: .trailing)
            
        }
        }
    }
    
    struct WheelGroup_Previews: PreviewProvider {
        static var previews: some View {
            WheelGroup()
        }
}
