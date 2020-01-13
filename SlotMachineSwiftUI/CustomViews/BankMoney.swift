//
//  BankMoney.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct BankMoney: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("$").font(.title)
                .foregroundColor(Color.white)
                .padding(10)
                .background(Color.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("DarkBlue"), lineWidth: 2))
            .offset(x: 15)
                .zIndex(2)
                .shadow(color: Color("Gray"), radius: 2, x: 1, y: 1)
            Text("1000").font(.headline)
                .foregroundColor(Color.white)
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
