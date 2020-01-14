//
//  Game.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//

import SwiftUI

final class Game: ObservableObject {
    
    private var deck: [String] =  ["empty", "banana", "cherry", "orange", "bell", "seven", "grape", "lemon"]
    
    private var defaultCards: [String] =  ["banana", "cherry", "orange", "seven", "empty", "lemon", "empty", "bell", "empty", "grape", "empty", "cherry", "banana", "empty", "empty", "orange", "seven", "empty", "lemon", "bell", "grape", "cherry", "empty", "banana", "orange", "seven", "empty", "bell", "grape", "bell", "cherry"]
    
    private var down: Bool = true

    
    @Published private(set) var cards1: [String]
    
    @Published private(set) var cards2: [String]
    
    @Published private(set) var cards3: [String]
    
    @Published private(set) var bet = 25
    
    @Published private(set) var bank = 1000
    
    @Published private(set) var notDisabled: Bool = true
    
    init() {
        self.cards1 = defaultCards
        self.cards2 = defaultCards
        self.cards3 = defaultCards
    }
    
    func restartGame() {
        self.cards1 = defaultCards
        self.cards2 = defaultCards
        self.cards3 = defaultCards
        
        self.bet = 25
        self.bank = 1000
        self.notDisabled = true
        self.down = true
    }
        
    func spin(){
        
        self.bank = self.bank - self.bet
        cards1 = createNewStuck(oldCards: cards1)
        cards2 = createNewStuck(oldCards: cards2)
        cards3 = createNewStuck(oldCards: cards3)
        
        down = !down
        
    }
    
    func toggleCanSpin() {
        notDisabled = !notDisabled
    }
    
    func canSpin() -> Bool{
        return notDisabled && (self.bank - self.bet >= 0)
    }
    
    func addBet() {
        if ((self.bet + 25) <= self.bank) {
            self.bet += 25
        }
    }
    
    func deductBet() {
        if ((self.bet - 25) > 0) {
            self.bet -= 25
        }
    }
    
    private func createNewStuck(oldCards: [String]) -> [String]{
        var newCards = [String]()
        
        for _ in 0...30 {
            let newCardIndex = Int.random(in: 0..<8)
            newCards.append(deck[newCardIndex])
        }
        
        if(down){
            newCards[30] = oldCards[30]
            newCards[29] = oldCards[29]
            newCards[28] = oldCards[28]
        } else {
            newCards[0] = oldCards[0]
            newCards[1] = oldCards[1]
            newCards[2] = oldCards[2]
        }
        
        return newCards
    }
}

