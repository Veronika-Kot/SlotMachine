//
//  RefreshGameModal.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/14/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct RefreshGameModal: View {
    
    @EnvironmentObject var game: Game
    @ObservedObject var modal: Modal
    
    var wheel: WheelGroup
    
    init(wheel: WheelGroup, modal: Modal) {
        self.wheel = wheel
        self.modal = modal
    }
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.8)
            
            VStack {
                Text(self.modal.isQuitGame ? "Quit the game?" : "Restart the game?")
                    .fixedSize(horizontal: true, vertical: true)
                    .font(Font.custom("Amilya", size: 40.0)).foregroundColor(Color("LightGold"))
                    .shadow(color: Color("DarkGray"), radius: 2, x: 1, y: 1)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color("Silver"), radius: 3, x: 1, y: 1)
                    .padding(.horizontal, 55)
                    .padding(.bottom, 40)
                    .padding(.top, 60)
                
                HStack {
                    
                    Button(action: {
                        if (self.modal.isQuitGame) {
                            print("Quit Game")
                            self.modal.toggleQuitGame()
                            self.modal.toggleThankYouView()
                                                        
                        } else {
                            print("Restart Game")
                            self.wheel.wheelAnimFirst.stopAnimating()
                            self.wheel.wheelAnimSecond.stopAnimating()
                            self.wheel.wheelAnimThird.stopAnimating()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.game.restartGame()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            self.modal.hideModal()
                        }
                    }){
                        Text(self.modal.isQuitGame ? "QUIT" : "RESTART").modifier(SecondaryButton())
                            .background(Color.green)
                    }
                    
                    Button(action: {
                        self.modal.hideModal()
                        
                        if (self.modal.isQuitGame) {
                            print("NO Quit Game")
                            self.modal.toggleQuitGame()
                        }
                    }){
                        Text("RESUME").modifier(SecondaryButton())
                            .background(Color.pink)
                    }
                    
                }.padding(.bottom, 40)
                
            }
            .padding(.horizontal, 50)
            .background(Color("PrimaryBackground"))
            .overlay(Image("background-line").resizable().frame(height: 20.0), alignment: .top)
            .overlay(Image("background-line").resizable().frame(height: 20.0), alignment: .bottom)
            .overlay(Image("background-line2").resizable().frame(width: 20.0), alignment: .leading)
            .overlay(Image("background-line2").resizable().frame(width: 20.0), alignment: .trailing)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct RefreshGameModal_Previews: PreviewProvider {
//    static var previews: some View {
//        RefreshGameModal()
//    }
//}
