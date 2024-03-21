//
//  MemoryGame.swift
//  Memorize
//
//  Created by Khanh Chung on 3/19/24.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: () -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory()
            if !cards.map({ $0.content }).contains(content) {
                cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
                cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
            }
        }
        shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
