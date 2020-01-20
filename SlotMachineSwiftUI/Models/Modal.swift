//
//  Modal.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/14/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI
import Combine

final class Modal: ObservableObject {
    @Published private(set) var isModalShown: Bool = false
    @Published private(set) var isQuitGame: Bool = false
    @Published private(set) var isThankYouModal: Bool = false

    func toggleThankYouView() {
        isThankYouModal = !isThankYouModal
    }
    
    func toggleQuitGame() {
        isQuitGame = !isQuitGame
    }
    
    func hideModal() {
        isModalShown = false
    }

    func showModal() {
        isModalShown = true
    }
}
