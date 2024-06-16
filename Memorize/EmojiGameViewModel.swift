//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Dev Keshwani on 16/06/24.
//
import SwiftUI

class EmojiGameViewModel{
    private static let emojies=["🚗","🚙","🚋","🚎","🚝","🚁","🚲","🛩️","🏍️","🚒"]
    
    private static func createMemoryGame()->GameModel<String>{
        return GameModel(numberOfPairsOfCards:4){pairIndex in
            return emojies[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<GameModel<String>.Card>{
        return model.cards
    }
    
    func chooseCard(_ card:GameModel<String>.Card){
        model.chooseCard(card)
    }
}
