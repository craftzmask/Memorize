//
//  ContentView.swift
//  Memorize
//
//  Created by Khanh Chung on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    let halloween = ["👻", "🕷️", "🕸️", "😈", "💀", "🎃", "🧙", "👹", "👺"]
    let vehicle = ["🚗", "🚙", "🏎️", "🚕", "🚓", "🚋", "🚃", "🚠", "🚡"]
    let nature = ["🌲", "💐", "🌺", "🌷", "☘️", "🍄", "🍁", "🪴", "🪷"]
    @State var emojis: [String] = []
    
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var themeChoosers: some View {
        HStack {
            halloweenChooser
            Spacer()
            vehicleChooser
            Spacer()
            natureChooser
        }
    }
    
    func themeChooser(_ name: String, theme: [String]) -> some View {
        Button {
            emojis = theme
            emojis += emojis
            emojis = emojis.shuffled()
        } label: {
            Text(name)
        }
    }
    
    var halloweenChooser: some View {
        themeChooser("Halloween", theme: halloween)
    }
    
    var vehicleChooser: some View {
        themeChooser("Vehicle", theme: vehicle)
    }
    
    var natureChooser: some View {
        themeChooser("Nature", theme: nature)
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
