//
//  ThankYouView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/14/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct ThankYouView: View {
    
    @EnvironmentObject var game: Game
    @ObservedObject var modal: Modal
    var wheel: WheelGroup
    
    init(wheel: WheelGroup, modal: Modal) {
        self.wheel = wheel
        self.modal = modal
    }
    
    var body: some View {
        ZStack {
            Color("LightGold")
            
            VStack {
                Text("Thank you")
                    .font(Font.custom("Amilya", size: 80.0)).foregroundColor(Color("PrimaryBackground"))
                    .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color("DarkPurple"), radius: 3, x: 1, y: 1)
                    .padding(.horizontal, 50)
                
                Text("for playing")
                    .font(Font.custom("Amilya", size: 60.0)).foregroundColor(Color("PrimaryBackground"))
                    .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color("DarkPurple"), radius: 3, x: 1, y: 1)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 40)
                
                Button(action: {
                    self.wheel.wheelAnimFirst.stopAnimating()
                    self.wheel.wheelAnimSecond.stopAnimating()
                    self.wheel.wheelAnimThird.stopAnimating()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                          self.game.restartGame()
                          self.modal.toggleThankYouView()
                    }
                }){
                    Text("NEW GAME").modifier(SecondaryButton())
                        .background(Color.green)
                }.padding(.bottom, 40)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
