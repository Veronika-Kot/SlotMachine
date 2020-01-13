//
//  SecondaryButton.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct SecondaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Silver"), radius: 2, x: 1, y: 1)
            .padding(10)
            .background(Color("Gray"))
 .foregroundColor(Color.white)
        .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color("Silver"), lineWidth: 2)
            )
            .shadow(color: Color.black, radius: 2, x: 1, y: 1)
            .shadow(color: Color.black, radius: 2, x: -1, y: -1)
        .padding(2)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("DarkGray"), lineWidth: 2)
        )
    }
}

private struct PrevPrevSecondaryButton: View {
    var body: some View {
        Button(action: {
            print("Hello")
        }){
             Image(systemName: "xmark")
                .modifier(SecondaryButton())
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrevPrevSecondaryButton()
    }
}
