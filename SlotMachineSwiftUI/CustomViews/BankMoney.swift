//
//  BankMoney.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct BankMoney: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        HStack(spacing: 0) {
            Text("$").font(.title)
                .foregroundColor(Color.white)
                .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
                .padding(10)
                .background(Color.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("DarkBlue"), lineWidth: 2))
            .offset(x: 15)
                .zIndex(2)
                .shadow(color: Color("Gray"), radius: 2, x: 1, y: 1)
            Text(String(game.bank)).font(.headline)
                    .frame(minWidth: 60)
                .foregroundColor(Color.white)
                .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
                .padding(5)
                .padding(.horizontal, 7)
                .padding(.leading, 10)
                .background(Color.blue)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("DarkBlue"), lineWidth: 2))
            .shadow(color: Color("Gray"), radius: 2, x: 1, y: 1)
        }
    }
}

struct BankMoney_Previews: PreviewProvider {
    static var previews: some View {
        BankMoney()
    }
}
