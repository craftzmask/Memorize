//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 3/19/24.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🕷️", "🕸️", "😈", "💀", "🎃", "🧙", "👹", "👺"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
