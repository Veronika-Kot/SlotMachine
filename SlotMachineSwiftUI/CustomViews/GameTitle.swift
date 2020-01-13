//
//  GameTitle.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct GameTitle: View {
    var body: some View {
        Text("Spin to Win").font(Font.custom("Amilya", size: 50.0)).foregroundColor(Color("Red"))
            .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
            .shadow(color: Color("Silver"), radius: 3, x: 1, y: 1)
//            .cornerRadius(10, corners: .bottomLeft)
//            .cornerRadius(10, corners: .bottomRight)
            .padding(.horizontal, 20)
//            .padding(.bottom, 5)
            .background(Color("PrimaryBackground"))
        .cornerRadius(40, corners: .bottomLeft)
        .cornerRadius(40, corners: .bottomRight)
            
    }
}

struct GameTitle_Previews: PreviewProvider {
    static var previews: some View {
        GameTitle()
    }
}
