//
//  Game.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

final class Game: ObservableObject {
    @Published private(set) var cards: [String] =  ["banana", "cherry", "orange", "seven", "empty", "lemon", "empty", "bell", "empty", "grape", "empty", "cherry", "banana", "empty", "empty", "orange", "seven", "empty", "lemon", "bell", "grape", "cherry", "empty", "banana", "orange", "seven", "empty", "bell", "grape", "bell", "cherry"]
   
}

