//
//  CurrentBet.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/9/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct CurrentBet: View {
    var body: some View {
        HStack {
            ZStack {
                Text("2525")
                    .font(Font.custom("Calculator", size: 36.0))
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
                HStack {
                    Button(action: {
                        print("Hello")
                    }){
                        Image(systemName: "minus")
                            .modifier(PrimaryButton())
                    }
                    
                    Text("").frame(width: 90.0)
                    
                    Button(action: {
                        print("Hello")
                    }){
                        Image(systemName: "plus")
                            .modifier(PrimaryButton())
                    }
                }
            }
            
            VStack {
                Text("TOTAL").font(Font.custom("TejaratchiCaps", size: 24.0))
                Text("Bet").font(Font.custom("TejaratchiCaps", size: 24.0))
            }
        }
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
