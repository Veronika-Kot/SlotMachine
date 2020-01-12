//
//  WheelView.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/10/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

struct WheelView: View {
    @State private var show = false
    @State private var offset = 0.0

    var animation: Animation {
        Animation.easeInOut(duration: 3.0)
            .speed(3.5).repeatCount(3, autoreverses: false)
    }
    

    var body: some View {
        
        VStack {
            
            Button(action: {
                self.show.toggle()
            }){
                Text("Animate")
            }
            
            VStack {
                Image("grape").resizable()
                    .frame(width: 60.0, height: 60.0)
                    .offset(y: show ? 1000 : 0)
                    .animation(animation)
//                    .offset(y: show ? 0 : 0)
//                    .animation(animation)
                    Image("seven").resizable()
                    .frame(width: 60.0, height: 60.0)
                    .offset(y: show ? 1000 : 0)
//                    .animation(animation)
//                    .offset(y: show ? 0 : 0)
                    .animation(animation)
                    Image("seven").resizable()
                    .frame(width: 60.0, height: 60.0)
                    .offset(y: show ? 1000 : 0)
                    .animation(animation)
//                    .offset(y: show ? 0 : 0)
//                    .animation(animation)
                
            }.frame(minHeight: 1, maxHeight: .infinity, alignment: .topLeading)
            
        }
    }
    
    
    func switchPokemon() {
        self.offset += 1.0
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
        //.previewLayout(.fixed(width: 896, height: 414))
    }
}
