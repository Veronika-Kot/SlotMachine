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
    
    var body: some View {
        ZStack {
//            VStack {
//                Button(action: {
//                    self.wheelAnimFirst.animate()
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                        self.wheelAnimSecond.animate()
//                    }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//                        self.wheelAnimThird.animate()
//                    }
//                }){
//                    Text("Animate")
//                }
//            }.zIndex(1)
            
            HStack(spacing: 0) {
                WheelView(theWheel: wheelAnimFirst)
                WheelView(theWheel: wheelAnimSecond)
                WheelView(theWheel: wheelAnimThird)
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
