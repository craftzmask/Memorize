//
//  ContentView.swift
//  Memorize
//
//  Created by Khanh Chung on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    let halloween = ["👻", "🕷️", "🕸️", "😈", "💀", "🎃", "🧙", "👹", "👺"]
    let halloweenThemeColor = Color.orange
    
    let vehicle = ["🚗", "🚙", "🏎️", "🚕", "🚓", "🚋", "🚃", "🚠", "🚡"]
    let vehicleThemeColor = Color.red
    
    let nature = ["🌲", "💐", "🌺", "🌷", "☘️", "🍄", "🍁", "🪴", "🪷"]
    let natureThemeColor = Color.green
    
    @State var emojis: [String] = []
    @State var themeColor = Color.accentColor
    
    var cardWidth: Double {
        340 / Double(emojis.count * 2).squareRoot()
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            themeChoosers
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: cardWidth))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(themeColor)
    }
    
    var themeChoosers: some View {
        HStack(alignment: .lastTextBaseline) {
            halloweenChooser
            Spacer()
            vehicleChooser
            Spacer()
            natureChooser
        }
    }
    
    func themeChooser(_ name: String, symbol: String, theme: [String], color: Color) -> some View {
        Button {
            let numberOfPairs = Int.random(in: 3..<theme.count)
            emojis = Array(theme[2...numberOfPairs])
            emojis += emojis
            emojis = emojis.shuffled()
            themeColor = color
        } label: {
            VStack {
                Image(systemName: symbol)
                    .font(.title)
                    .imageScale(.large)
                Text(name)
                    .font(.subheadline)
            }
        }
    }
    
    var halloweenChooser: some View {
        themeChooser("Halloween", symbol: "flame", theme: halloween, color: halloweenThemeColor)
    }
    
    var vehicleChooser: some View {
        themeChooser("Vehicle", symbol: "car", theme: vehicle, color: vehicleThemeColor)
    }
    
    var natureChooser: some View {
        themeChooser("Nature", symbol: "tree", theme: nature, color: natureThemeColor)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
