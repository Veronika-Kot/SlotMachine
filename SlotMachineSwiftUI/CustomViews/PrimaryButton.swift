//
//  PrimaryButton.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/9/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct PrimaryButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("Silver"), radius: 1, x: 1, y: 1)
        .shadow(color: Color("Silver"), radius: 1, x: -1, y: -1)
        .padding(.vertical, 17.0)
        .padding(.horizontal, 10.0)
        .overlay(
            Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.75), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), center: .top, startRadius: 0.1, endRadius: 25))
            .frame(height: 35.0)
            
            ,alignment: .top)
        .overlay(
        Rectangle()
            .fill(RadialGradient(gradient: Gradient(colors: [Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.75), Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01)]), center: .bottom, startRadius: 0.1, endRadius: 25))
        .frame(height: 35.0)
        ,alignment: .bottom)
            
            .font(.headline)
        .background(RadialGradient(gradient: Gradient(colors: [Color("LightGold"), Color("Gold")]), center: .center, startRadius: 5, endRadius: 25))
        .foregroundColor(Color("DarkGold"))
        .cornerRadius(35)
    }
}

struct PrevPrev: View {
var body: some View {
    Button(action: {
        print("Hello")
    }){
        Image(systemName: "minus")
            .modifier(PrimaryButton())
    }
    }
}

struct PrevPrev_Previews: PreviewProvider {
    static var previews: some View {
        PrevPrev().previewLayout(.fixed(width: 896, height: 414))
    }
}
