//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Roberto Barros on 7/1/20.
//  Copyright © 2020 Roberto Barros. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame // Redraw everytime that ViewModel changes
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
            
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp  {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.orange)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
//    MARK - Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height ) * 0.75
    }
    
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
