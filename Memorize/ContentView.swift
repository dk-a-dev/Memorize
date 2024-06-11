//
//  ContentView.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojies=["🥳","🥰","😘","🤩","😇"]
    @State var cardCount=4
    func checkCount(offset:Int) -> Array<Bool> {
        if(offset>0 && cardCount>=emojies.count){
            return [true,false]
        }
        if(offset<0 && cardCount<=1){
            return [false,true]
        }
        return [false,false]
    }
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<cardCount,id: \.self){ index in
                    CardView(content: emojies[index])
                }
            }.padding().foregroundColor(.red)
            HStack{
                Button(action: {
                    cardCount+=1
                }) {
                    Image(systemName: "rectangle.stack.fill.badge.plus").font(.largeTitle)
                }.disabled(checkCount(offset: +1)[0])
                Spacer()
                Button(action: {
                    cardCount-=1
                }) {
                    Image(systemName: "rectangle.stack.fill.badge.minus").font(.largeTitle)
                }.disabled(checkCount(offset: -1)[1])
            }
        }.padding()
    }
    
}

struct CardView:View {
    let content: String
    @State var isFaceUp = false
    var body: some View{
            ZStack{
                let base = RoundedRectangle(cornerRadius: 12)
                if isFaceUp{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 5)
                    Text(content).font(.largeTitle)
                }
                else{
                    base.fill()
                }
            }.onTapGesture{
                isFaceUp.toggle()
            }
    }
}

#Preview {
    ContentView()
}
