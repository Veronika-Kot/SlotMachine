//
//  ContentView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/9/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Silver"), Color("Silver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"),  Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver")]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: -35) {
                HStack(){
                    BankMoney()
                        .offset(x: -15)
                        .padding(.leading, 40)
                    Spacer()
                    
                    HStack {
                        GameTitle().zIndex(10).offset(x: -15, y: 7)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Hello")
                    }){
                        Image(systemName: "arrow.clockwise").modifier(SecondaryButton())
                    }
                    
                    Button(action: {
                        print("Hello")
                    }){
                        Image(systemName: "xmark").modifier(SecondaryButton())
                    }.padding(.trailing, 40)
                    
                    
                }.frame(height: 45).background(
                    LinearGradient(gradient: Gradient(colors: [Color("Silver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("Silver")]), startPoint: .bottom, endPoint: .top))
                    .zIndex(2)
                    .edgesIgnoringSafeArea(.all)
                
                HStack(){
                    Text("")
                        .frame(minWidth: 0,  maxWidth: 30, minHeight: 45,
                               maxHeight: .infinity)
                        .background(Color("PrimaryBackground"))
                        .padding()
                        .overlay(Rectangle().fill(Color("PrimaryBackground")).frame( width: 10), alignment: .trailing)
                    
                    Spacer()
                    HStack() {
                        WheelGroup().background(Color.white)
                    }.padding(45)
                        .overlay(Rectangle().stroke(Color("LightGold"), lineWidth: 45))
                        .border(Color("LightGold"), width: 50)
                    Spacer()
                    Text("")
                        .frame(minWidth: 30,  maxWidth: 30, minHeight: 45,
                               maxHeight: .infinity, alignment: .trailing)
                        .background(Color("PrimaryBackground")).padding()
                        .overlay(Rectangle().fill(Color("PrimaryBackground")).frame( width: 10), alignment: .leading)
                    
                    
                }.offset(y: -10).zIndex(1)
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                    .background(Color("LightGold"))
                
                
                
                Spacer()
                Text("")
                    .frame(minWidth: 0, idealWidth: .infinity, maxWidth: 45, minHeight: 45)
                    .background(Color("PrimaryBackground"))
                    
                    .zIndex(2)
                
                HStack(spacing: 0) {
                    CurrentBet()
                    //===
                    VStack(){
                        
                        Text("5000")
                            .font(Font.custom("Calculator", size: 50.0))
                            .foregroundColor(Color.yellow)
                            .offset(y: -10)
                        
                        Text("JACKPOT")
                            .font(Font.custom("Calculator", size: 22.0))
                            .foregroundColor(Color.yellow)
                            .offset(y: -10)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 87)
                        .background(Color("PrimaryBackground"))
                        .overlay(
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.35), Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.01)]), startPoint: .bottom, endPoint: .top))
                                .frame(height: 55.0)
                            ,alignment: .bottom).cornerRadius(200, corners: [.bottomRight, .bottomLeft])
                    
                    //===
                    SpinButtonGroup()
                }
                .zIndex(3)
                .edgesIgnoringSafeArea(.all)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //            ContentView()
            //            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            
            ContentView()
                .previewLayout(.fixed(width: 896, height: 414))
        }
    }
}


//RadialGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.35), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1)]), center: .center, startRadius: 2, endRadius: 40)

//.overlay(
//    RoundedRectangle(cornerRadius: 40)
//        .fill(RadialGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.35), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1)]), center: .center, startRadius: 2, endRadius: 40))
//)

//Rectangle()
//                   .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.55), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), startPoint: .bottom, endPoint: .top))
//               .frame(height: 20.0)
