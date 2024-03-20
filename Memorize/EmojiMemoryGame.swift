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
        MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    private var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init() {
        theme = Theme.builtin[0]
        model = EmojiMemoryGame.createMemoryGame(from: theme)
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeColor: Color {
        switch theme.color {
        case "orange":
            Color.orange
        default:
            Color.accentColor
        }
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(from: theme)
    }
}
