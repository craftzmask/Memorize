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
            numberOfPairs: 10,
            color: "orange"
        ),
        Theme(
            name: "Vehicle",
            emojis: ["🚗", "🚙", "🏎️", "🚕", "🚓", "🚋", "🚃", "🚠", "🚡"],
            numberOfPairs: 10,
            color: "red"
        ),
        Theme(
            name: "Nature",
            emojis: ["🌲", "💐", "🌺", "🌷", "☘️", "🍄", "🍁", "🪴", "🪷"],
            numberOfPairs: 10,
            color: "green"
        ),
        Theme(
            name: "Animal",
            emojis: ["🐶","🐭", "🐹", "🐰", "🐱", "🦊", "🐷", "🐼", "🐻‍❄️", "🐮"],
            numberOfPairs: 10,
            color: "brown"
        ),
        Theme(
            name: "Building",
            emojis: ["🏢", "🏫", "💒", "🏛️", "🏭", "🏦", "🏣", "🏫", "🕍"],
            numberOfPairs: 10,
            color: "gray"
        ),
        Theme(
            name: "Food",
            emojis: ["🍖", "🍗", "🌭", "🌮", "🍜", "🥓", "🥨", "🥩", "🍣"],
            numberOfPairs: 10,
            color: "yellow"
        )
    ]
}
