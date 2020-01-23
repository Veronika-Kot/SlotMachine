//
//  Modal.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/14/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI
import Combine

//Observable object to store a boolean variables, to show or hide modal overlays
//Thank you, restart and quit game overlays

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
