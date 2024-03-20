//
//  Theme.swift
//  Memorize
//
//  Created by Khanh Chung on 3/19/24.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: String
}

extension Theme {
    static let builtin = [
        Theme(
            name: "Halloween",
            emojis: ["👻", "🕷️", "🕸️", "😈", "💀", "🎃", "🧙", "👹", "👺"],
            numberOfPairs: 2,
            color: "orange"
        )
    ]
}
