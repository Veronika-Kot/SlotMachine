//
//  SpinButtonGroup.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/10/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct SpinButtonGroup: View {
    
    @EnvironmentObject var game: Game
    
    var wheel: WheelGroup
    
    init(wheel: WheelGroup) {
        self.wheel = wheel
    }
    
    var body: some View {
        HStack {
            
            VStack {
                Text(String(self.game.gameMessage))
                    .fixedSize(horizontal: true, vertical: true)
                    .shadow(color: Color("Red"), radius: 1, x: 1, y: 1)
                    .shadow(color: Color("Red"), radius: 2, x: 1, y: 1)
                

                Text(self.game.win ? String(self.game.winnings) : "")
                    .fixedSize(horizontal: true, vertical: true)
                    .shadow(color: Color("Red"), radius: 1, x: 1, y: 1)
                    .shadow(color: Color("Red"), radius: 2, x: 1, y: 1)
                
            }
            .frame(width: 50.0, height: 40)
            .font(Font.custom("Calculator", size: 20.0))
            .padding(.vertical, 5.0)
            .padding(.horizontal, 5.0)
            .background(Color.black)
            .foregroundColor(Color.red)
            .padding(8.0)
            .background(Color("Gray"))
            .border(Color("DarkGray"), width: 8.0)
            .overlay(
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 15.0)
                
                ,alignment: .top)
                .overlay(
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .bottom, endPoint: .top))
                        .frame(height: 20.0)
                    ,alignment: .bottom)
                .cornerRadius(15)
            
            Button(action: {
                if self.game.notDisabled {
                    
                    print("SPIN")
                    self.game.toggleCanSpin()
                    self.game.spin()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.wheel.wheelAnimFirst.animate()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        self.wheel.wheelAnimSecond.animate()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.wheel.wheelAnimThird.animate()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        self.game.updateResults()
                        self.game.toggleCanSpin()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                        if self.game.winJackpot {
                            self.game.hideJackpotSign()
                        }
                    }
                }
            }){
                ZStack {
                    Text("SPIN").font(Font.custom("ff", size: 30.0)).foregroundColor(Color.white)
                        .shadow(color: Color("DarkRed"), radius: 2, x: 1, y: 1)
                        .shadow(color: Color("DarkRed"), radius: 3, x: 1, y: 1)
                    
                }
                .padding(.vertical, 16.0)
                .padding(.horizontal, 45.0)
                .overlay(
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .top, endPoint: .bottom))
                        .frame(height: 15.0)
                    
                    ,alignment: .top)
                    .overlay(
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .bottom, endPoint: .top))
                            .frame(height: 20.0)
                        ,alignment: .bottom)
                    
                    .background(Color("Red"))
                    .cornerRadius(30)
                    .shadow(color: Color("DarkGray"), radius: 1, x: 1, y: -1)
                    .shadow(color: Color("DarkRed"), radius: 2, x: -2, y: -3)
                
            }.disabled(!self.game.canSpin())
        }
        .frame(width: 275, height: 70.0)
        .padding(.top, 10.0)
        .padding(.leading, 5.0)
        .padding(.trailing, 10.0)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"),
                                                       Color("DarkSilver"),Color("Silver")]), startPoint: .top, endPoint: .bottom))
            .overlay(
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 15.0)
                
                ,alignment: .top)
            
            .cornerRadius(250, corners: [.topLeft])
    }
}

//struct SpinButtonGroup_Previews: PreviewProvider {
//    static var previews: some View {
//        SpinButtonGroup()
//    }
//}
