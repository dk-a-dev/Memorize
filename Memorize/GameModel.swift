//
//  GameModel.swift
//  Memorize
//
//  Created by Dev Keshwani on 16/06/24.
//

import Foundation

struct GameModel<CardContent> {
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int)->CardContent){
        cards=[]
        
        for index in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(index)
            cards.append(Card(content: content))
        }
    }
    private(set) var cards: Array<Card>
    func chooseCard(_ card: Card){}
    
    struct Card {
        var isFaceUp:Bool=false
        var isMatched:Bool=false
        let content:CardContent
    }
}
