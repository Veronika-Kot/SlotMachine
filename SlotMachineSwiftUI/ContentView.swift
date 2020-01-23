//
//  ContentView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/9/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI

//Main view which renders all UI elemenst
struct ContentView: View {
    
    //Observable object which containes variables to show/hide modals
    @ObservedObject var modal = Modal()
    
    //instance of game object, initiated in SceneDelegate, for showing/ hiding jackpot sign
    @EnvironmentObject var game: Game
    
    var wheel = WheelGroup() // Creating a wheel group
        
    var body: some View {
        ZStack {
            //Background gradient
            LinearGradient(gradient: Gradient(colors: [Color("Silver"), Color("Silver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"),  Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver"), Color("Silver")]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            

            JackpotSign().zIndex(50) // Jackpot sign - originaly hidden

            if self.modal.isModalShown {
                RefreshGameModal(wheel: self.wheel, modal: self.modal).zIndex(100) // Refresh/Quit game modal - originaly hidden
            }
            
            if self.modal.isThankYouModal {
                ThankYouView(wheel: self.wheel, modal: self.modal).zIndex(1000) // Thank you screen modal - originaly hidden
            }
            
            VStack(spacing: -35) {
                
                // Top bar view Group
                TopBar(wheel: self.wheel, modal: self.modal)
                    .zIndex(2)
                    .edgesIgnoringSafeArea(.all)
                    .shadow(color: Color("DarkGray"), radius: 3, x: 1, y: 2)
                
                HStack(){
                    Text("") // Empty text for extra space
                        .frame(minWidth: 0,  maxWidth: 30, minHeight: 45,
                               maxHeight: .infinity)
                        .background(Color("PrimaryBackground"))
                        .padding()
                        .overlay(Rectangle().fill(Color("PrimaryBackground")).frame( width: 10), alignment: .trailing)
                    
                    Spacer()
                    // Wheels - central part
                    HStack() {
                        self.wheel.background(Color.white)
                    }.padding(45)
                        .overlay(Rectangle().stroke(Color("LightGold"), lineWidth: 45))
                        .border(Color("LightGold"), width: 50)
                    Spacer()
                    Text("") // Empty text for extra space
                        .frame(minWidth: 30,  maxWidth: 30, minHeight: 45,
                               maxHeight: .infinity, alignment: .trailing)
                        .background(Color("PrimaryBackground")).padding()
                        .overlay(Rectangle().fill(Color("PrimaryBackground")).frame( width: 10), alignment: .leading)
                }.offset(y: -10).zIndex(1)
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                    .background(Color("LightGold"))
                
                Spacer()
                Text("") // Empty text for extra space
                    .frame(minWidth: 0, idealWidth: .infinity, maxWidth: 45, minHeight: 45)
                    .background(Color("PrimaryBackground"))
                    .zIndex(2)
                
                // Bottom bar
                HStack(spacing: 0) {
                    CurrentBet() // - current bet view
                    
                    // Middle part of bottom bar
                    VStack(){
                        Text(String(self.game.jackpot))
                            .fixedSize(horizontal: true, vertical: true)
                            .font(Font.custom("Calculator", size: 50.0))
                            .foregroundColor(Color.yellow)
                            .shadow(color: Color.yellow, radius: 2, x: 1, y: 1)
                            .offset(y: -10)
                        
                        Text("JACKPOT")
                            .font(Font.custom("Calculator", size: 22.0))
                            .foregroundColor(Color.yellow)
                            .shadow(color: Color.yellow, radius: 2, x: 1, y: 1)
                            .offset(y: -10)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 87)
                        .background(Color("PrimaryBackground"))
                        .overlay(
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.35), Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.01)]), startPoint: .bottom, endPoint: .top))
                                .frame(height: 55.0)
                            ,alignment: .bottom).cornerRadius(200, corners: [.bottomRight, .bottomLeft])

                    // Right part of bottom bar
                    SpinButtonGroup(wheel: self.wheel) // passing the instance of wheel group, to know when start animation
                }
                .zIndex(3)
                .edgesIgnoringSafeArea(.all)

            }
        }
    }
}


// Preview will not work, bc of enviroment object which is created in SceneDelegate

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            //            ContentView()
//            //            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//
//            ContentView()
//                .previewLayout(.fixed(width: 896, height: 414))
//        }
//    }
//}
