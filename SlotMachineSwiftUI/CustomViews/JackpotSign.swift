//
//  JackpotSign.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/20/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct JackpotSign: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        
        Text("JACKPOT  ")
            .fixedSize(horizontal: true, vertical: true)
            .font(Font.custom("Amilya", size: 90.0)).foregroundColor(Color("Red"))
            .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
            .shadow(color: Color("Silver"), radius: 3, x: 1, y: 1)
            .shadow(color: Color.black, radius: 15, x: 7, y: 7)
            .padding(.horizontal, 5)
            //                .rotationEffect(.degrees(show ? 360 : 0))
            .opacity(self.game.winJackpot ? 100 : 0)
            .scaleEffect(self.game.winJackpot ? 1.5 : 0.1)
            //                .transition(.moveAndFade)
                            .animation(.easeInOut(duration: 1.5))
//            .animation(.interpolatingSpring(mass: 1.2, stiffness: 0.5, damping: 1.5, initialVelocity: 2))
    }
}

extension AnyTransition {
    static var scaleOpacity: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor:.center),
            removal: .opacity)
    }
    
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct JackpotSign_Previews: PreviewProvider {
    static var previews: some View {
        JackpotSign().previewLayout(.fixed(width: 896, height: 414))
    }
}
