//
//  CurrentBet.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/9/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI

// View group which containes UI elements for left bottom bar:
// current bet buttons and sign, containes generic UI elements and
// custome views (Primary buttons)
struct CurrentBet: View {
    
    //instance of game object, initiated in SceneDelegate, for updating bet value
    @EnvironmentObject var game: Game
    
    var body: some View {
        HStack {
            ZStack {
                Text(String(self.game.bet)) // Total bet text and UI rools
                    .font(Font.custom("Calculator", size: 36.0))
                    .shadow(color: Color("Red"), radius: 1, x: 1, y: 1)
                    .shadow(color: Color("Red"), radius: 2, x: 1, y: 1)
                    .frame(width: 110.0)
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
               
                HStack { //Horizontal stack for 2 button, for increasing / decreasing bet
                    Button(action: {
                        print("minus bet")
                        self.game.deductBet()
                    }){
                        Image(systemName: "minus")
                            .modifier(PrimaryButton()) //using my custom modifier, it containes all UI rools
                    }
                    
                    Text("").frame(width: 90.0)
                    
                    Button(action: {
                        print("add bet")
                        self.game.addBet()
                    }){
                        Image(systemName: "plus")
                            .modifier(PrimaryButton()) //using my custom modifier, it containes all UI rools
                    }
                }
            }
            
            // Total bet label
            VStack {
                Text("TOTAL").font(Font.custom("TejaratchiCaps", size: 24.0))
                Text("Bet").font(Font.custom("TejaratchiCaps", size: 24.0))
            }
        } // UI for left side bottom bar
        .frame(width: 275, height: 70.0)
        .padding(.top, 10.0)
        .padding(.leading, 20.0)
        .padding(.trailing, 10.0)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"),Color("DarkSilver"), Color("Silver")]), startPoint: .top, endPoint: .bottom))
            .overlay(
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 15.0)
                
                ,alignment: .top)
            
            .cornerRadius(250, corners: [.topRight])
        
    }
}

struct CurrentBet_Previews: PreviewProvider {
    static var previews: some View {
        CurrentBet().previewLayout(.fixed(width: 896, height: 414))
    }
}
