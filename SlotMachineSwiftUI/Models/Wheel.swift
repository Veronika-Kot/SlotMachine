//
//  Wheel.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/12/20.
//  Student ID: 301067511
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI
import Combine

//Observable object to store a boolean variable, to start or stop wheel/reel animation
final class Wheel: ObservableObject {
    @Published private(set) var isSpinning: Bool = false

    func animate() {
        isSpinning = !isSpinning
    }

    func stopAnimating() {
        isSpinning = false
    }
}
