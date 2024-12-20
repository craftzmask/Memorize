//
//  ContentView.swift
//  Memorize
//
//  Created by Khanh Chung on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    let halloweenTheme = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    let animalTheme = ["🐶", "🐱", "🐭", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐷", "🐵", "🐔", "🐧"]
    let vehicleTheme = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚒", "🛻", "🚐", "🚚", "🚛", "🚜", "🚝", "🚞", "🚟", "🚠", "🚡", "🚢", "🚣", "🚤"]
    
    @State var emojis: [String] = []
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeChoosers
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    func themeChooser(title: String, symbol: String, theme: [String]) -> some View {
        Button {
            emojis = theme + theme
            emojis = emojis.shuffled()
        } label: {
            VStack {
                Image(systemName: symbol)
                    .imageScale(.large)
                    .font(.title3)
                Text(title)
                    .font(.caption2)
            }
        }
    }
    
    var themeChoosers: some View {
        HStack(alignment: .lastTextBaseline) {
            themeChooser(title: "Halloween", symbol: "flame", theme: halloweenTheme)
            Spacer()
            themeChooser(title: "Animals", symbol: "pawprint", theme: animalTheme)
            Spacer()
            themeChooser(title: "Vehicles", symbol: "car", theme: vehicleTheme)
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12).fill(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: 12).opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
