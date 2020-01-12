//
//  Wheel.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/12/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI
import Combine

final class Wheel: ObservableObject {
    @Published private(set) var isSpinning: Bool = false

    func animate() {
    
        isSpinning = !isSpinning
    }

    func stopAnimating() {
        isSpinning = false
    }
}

//struct Wheel: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Wheel_Previews: PreviewProvider {
//    static var previews: some View {
//        Wheel()
//    }
//}
