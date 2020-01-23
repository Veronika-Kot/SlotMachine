//
//  GameTitle.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI

// Custom view for Game sign on the top  of the screen
struct GameTitle: View {
    var body: some View {
        Text("Spin to Win").font(Font.custom("Amilya", size: 50.0)).foregroundColor(Color("Red"))
            .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
            .shadow(color: Color("Silver"), radius: 3, x: 1, y: 1)
            .padding(.horizontal, 20)
            .background(Color("PrimaryBackground"))
        .cornerRadius(40, corners: .bottomLeft)
        .cornerRadius(40, corners: .bottomRight)
        .cornerRadius(10, corners: .topLeft)
        .cornerRadius(10, corners: .topRight)
            
    }
}

struct GameTitle_Previews: PreviewProvider {
    static var previews: some View {
        GameTitle()
    }
}
