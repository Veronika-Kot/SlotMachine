//
//  JackpotSign.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/20/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI

// Custom view for Jackpot sign, when user wins a jackpot, containes UI elements and animation
struct JackpotSign: View {
    
    //instance of game object, initiated in SceneDelegate, for showing/ hiding jackpot sign
    @EnvironmentObject var game: Game
    
    var body: some View {
        
        Text("JACKPOT  ")
            .fixedSize(horizontal: true, vertical: true)
            .font(Font.custom("Amilya", size: 90.0)).foregroundColor(Color("Red"))
            .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
            .shadow(color: Color("Silver"), radius: 3, x: 1, y: 1)
            .shadow(color: Color.black, radius: 15, x: 7, y: 7)
            .padding(.horizontal, 5)
            .opacity(self.game.winJackpot ? 100 : 0) // Changing the oppacity (since I can't have scale = 0)
            .scaleEffect(self.game.winJackpot ? 1.5 : 0.1) // changing scale value
            .animation(.easeInOut(duration: 1.5)) // transition animation for 1.5 sec for above effects
                                                  // animation will start when view is rendered on the screen
    }
}

struct JackpotSign_Previews: PreviewProvider {
    static var previews: some View {
        JackpotSign().previewLayout(.fixed(width: 896, height: 414))
    }
}
