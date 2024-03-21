//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 3/19/24.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame(from theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: Int.random(in: 2..<theme.numberOfPairs)) {
            theme.emojis.randomElement()!
        }
    }
    
    private var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init() {
        theme = Theme.builtin.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(from: theme)
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeColor: Color {
        switch theme.color {
        case "orange":
            Color.orange
        case "red":
            Color.red
        case "brown":
            Color.brown
        case "yellow":
            Color.yellow
        case "gray":
            Color.gray
        case "green":
            Color.green
        default:
            Color.accentColor
        }
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = Theme.builtin.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(from: theme)
    }
}
