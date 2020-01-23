//
//  Game.swift
//  SlotMachineSwiftUI
//
//  Created by Veronika Kotckovich on 1/13/20.
//  Copyright © 2020 centennial. All rights reserved.
//  Student ID: 301067511

import SwiftUI
import AVFoundation

// Observable and EnvironmentObject object, initiated in scene delegate and can be accessable from all
// SwiftUI view files
//
//Used to store variables accessible from UI and have game logic
final class Game: ObservableObject {
    
    private var deck: [String] =  ["empty", "banana", "cherry", "orange", "bell", "seven", "grape", "lemon"]
    
    private var defaultCards: [String] =  ["banana", "cherry", "orange", "seven", "empty", "lemon", "empty", "bell", "empty", "grape", "empty", "cherry", "banana", "empty", "empty", "orange", "seven", "empty", "lemon", "bell", "grape", "cherry", "empty", "banana", "orange", "seven", "empty", "bell", "bell", "Spin-to-Win", "grape"]
    
    private var down: Bool = true
    
    private var grapes = 0;
    private var bananas = 0;
    private var oranges = 0;
    private var cherries = 0;
    private var lemons = 0;
    private var bells = 0;
    private var sevens = 0;
    private var blanks = 0;
    
    private var m_gameMessage = ""
    private var m_winnings = 0
    
    private var player: AVAudioPlayer?
    
    //Vars readable from UI
    @Published private(set) var cards1: [String]
    
    @Published private(set) var cards2: [String]
    
    @Published private(set) var cards3: [String]
    
    @Published private(set) var bet = 25
    
    @Published private(set) var bank = 1000
    
    @Published private(set) var jackpot = 5000
    
    @Published private(set) var notDisabled: Bool = true
    
    @Published private(set) var gameMessage: String = "SPIN"
    
    @Published private(set) var winnings: String = ""
    
    @Published private(set) var win: Bool = false
    
    @Published private(set) var winJackpot: Bool = false
    
    
    init() {
        self.cards1 = defaultCards
        self.cards2 = defaultCards
        self.cards3 = defaultCards
    }
    
    /* Reseting game variables */
    func restartGame() {
        self.cards1 = defaultCards
        self.cards2 = defaultCards
        self.cards3 = defaultCards
        
        self.bet = 25
        self.bank = 1000
        self.notDisabled = true
        self.down = true
        self.gameMessage = "SPIN"
        self.win = false
        self.jackpot = 5000
    }
    
    /* Hides jackPot sign */
    func hideJackpotSign() {
        self.winJackpot = false
    }
    
    /* Plays a passed sound effect */
    func playSound(sound: String) {
        let path = Bundle.main.path(forResource: sound, ofType:nil)!
        
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    /* Executed when user press SPIN button */
    func spin(){
        
        playSound(sound: "348503__robinhood76__06708-slot-machine-coin-inserting.wav")
        

        self.bank = self.bank - self.bet
        self.gameMessage = ""
        self.winnings = ""
        
        let betLine: [String] = Reels()
        
        // Assign cards to wheels
        cards1 = createNewStuck(oldCards: cards1, winCard: betLine[0])
        cards2 = createNewStuck(oldCards: cards2, winCard: betLine[1])
        cards3 = createNewStuck(oldCards: cards3, winCard: betLine[2])
        
        //Change direction
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
    
    /* Creates a random arrays of cards, assignes wincard to correct place */
    private func createNewStuck(oldCards: [String], winCard: String) -> [String]{
        var newCards = [String]()
        
        for _ in 0...30 {
            let newCardIndex = Int.random(in: 0..<8)
            newCards.append(deck[newCardIndex])
        }
        
        if(down){
            newCards[30] = oldCards[30]
            newCards[29] = oldCards[29]
            newCards[28] = oldCards[28]
            
            newCards[1] = winCard
        } else {
            newCards[0] = oldCards[0]
            newCards[1] = oldCards[1]
            newCards[2] = oldCards[2]
            
            newCards[29] = winCard
        }
        
        return newCards
    }
    
    /* Updates the bank money and displayed message */
    func updateResults() {
        
        //Update Winnings
        self.determineWinnings()
        
        if win {
            playSound(sound: "69682__lukaso__coinwin.wav")
            checkJackPot()
        }
        
        self.gameMessage = self.m_gameMessage
        self.winnings = String(m_winnings)
        
        print ("OLD bank \(self.bank)")
        self.bank += m_winnings
        print ("NEW bank \(self.bank)")
        
        print ("Show jackpot \(self.winJackpot)")
        
        // Reset results
        resetFruitTally()
    }
    
    /* When this function is called it determines the betLine results.
     e.g. Bar - Orange - Banana */
    func Reels() -> [String] {
        var betLine = [" ", " ", " "]
        var outCome = [0, 0, 0]
        
        for wheel in 0...2 {
            outCome[wheel] = Int(floor(Float.random(in: 0 ..< 1) * 65) + 1)
            switch outCome[wheel] {
            case checkRange(outCome[wheel], 1, 27):
                betLine[wheel] = "empty"
                self.blanks += 1
                break;
            case checkRange(outCome[wheel], 28, 37):
                betLine[wheel] = "grape"
                self.grapes += 1
                break;
            case checkRange(outCome[wheel], 38, 46):
                betLine[wheel] = "banana"
                self.bananas += 1
                break;
            case checkRange(outCome[wheel], 47, 54):
                betLine[wheel] = "orange"
                self.oranges += 1
                break;
            case checkRange(outCome[wheel], 55, 59):
                betLine[wheel] = "cherry"
                self.cherries += 1
                break;
            case checkRange(outCome[wheel], 60, 62):
                betLine[wheel] = "lemon"
                self.lemons += 1
                break;
            case checkRange(outCome[wheel], 63, 64):
                betLine[wheel] = "bell"
                self.lemons += 1
                break;
            case checkRange(outCome[wheel], 65, 65):
                betLine[wheel] = "seven"
                self.sevens += 1
                break;
            default: break
            }
        }
        print (betLine)
        return betLine
    }
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings()
    {
        if (blanks == 0)
        {
            if (grapes == 3) {
                self.m_winnings = bet * 10;
            }
            else if(bananas == 3) {
                self.m_winnings = bet * 20;
            }
            else if (oranges == 3) {
                self.m_winnings = bet * 30;
            }
            else if (cherries == 3) {
                self.m_winnings = bet * 40;
            }
            else if (lemons == 3) {
                self.m_winnings = bet * 50;
            }
            else if (bells == 3) {
                self.m_winnings = bet * 75;
            }
            else if (sevens == 3) {
                self.m_winnings = bet * 100;
            }
            else if (grapes == 2) {
                self.m_winnings = bet * 2;
            }
            else if (bananas == 2) {
                self.m_winnings = bet * 2;
            }
            else if (oranges == 2) {
                self.m_winnings = bet * 3;
            }
            else if (cherries == 2) {
                self.m_winnings = bet * 4;
            }
            else if (lemons == 2) {
                self.m_winnings = bet * 5;
            }
            else if (bells == 2) {
                self.m_winnings = bet * 10;
            }
            else if (sevens == 2) {
                self.m_winnings = bet * 20;
            }
            else if (sevens == 1) {
                self.m_winnings = bet * 5;
            }
            else {
                self.m_winnings = bet * 1;
            }
            
            self.m_gameMessage = "WON"
            self.win = true
            
            print("**** WON ***** \(self.m_winnings)")
        }
        else
        {
            self.m_gameMessage = "LOST"
            self.win = false
            
             print("**** LOST ***** \(self.m_winnings)")
        }
        
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(_ value: Int, _ lowerBounds: Int, _ upperBounds: Int) -> Int {
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value;
        }
        else {
            return -100;
        }
    }
    
    /* Utility function to reset all fruit tallies */
    func resetFruitTally() {
        m_winnings = 0
        
        grapes = 0;
        bananas = 0;
        oranges = 0;
        cherries = 0;
        lemons = 0;
        bells = 0;
        sevens = 0;
        blanks = 0;
    }
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        /* compare two random values */
        let jackPotTry = Int(floor(Float.random(in: 0 ..< 1) * 51) + 1)
        let jackPotWin = Int(floor(Float.random(in: 0 ..< 1) * 51) + 1)
        
//        if true { //to test jackpot
        if (jackPotTry == jackPotWin) {
            print("You Won the $ \(jackpot) Jackpot!!");
            self.winJackpot = true
            self.bank += self.jackpot;
            self.jackpot = 1000;
        }
    }
}

