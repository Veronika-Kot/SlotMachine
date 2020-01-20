//
//  TopBar.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/14/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct TopBar: View {
    
    
    @EnvironmentObject var game: Game
    @ObservedObject var modal: Modal
    
    var wheel: WheelGroup
    
    init(wheel: WheelGroup, modal: Modal) {
        self.wheel = wheel
        self.modal = modal
    }
    
    var body: some View {
        HStack() {
            BankMoney()
                .offset(x: -15)
                .padding(.leading, 40)
            Spacer()
            
            HStack {
                GameTitle().zIndex(10).offset(x: -45, y: 7)
                    .shadow(color: Color("DarkGray"), radius: 4, x: 2, y: 3)
                    .shadow(color: Color("DarkGray"), radius: 4, x: -2, y: 3)
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    self.modal.showModal()
                }){
                    Image(systemName: "arrow.clockwise").modifier(SecondaryButton())
                }
                
                Button(action: {
                    self.modal.toggleQuitGame()
                    self.modal.showModal()
                }){
                    Image(systemName: "xmark").modifier(SecondaryButton())
                }
                
            }.offset(x: -45)
        }.frame(height: 45).background(
            LinearGradient(gradient: Gradient(colors: [Color("Silver"), Color("DarkSilver"), Color("DarkSilver"), Color("DarkSilver"), Color("Silver")]), startPoint: .bottom, endPoint: .top))
    }
}
//}

//struct TopBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TopBar()
//    }
//}
