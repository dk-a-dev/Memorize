//
//  ContentView.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojies=["🥳","🥰","😘","🤩","😇","🤓","😎","🎃","🙂","🤣","🤪"]
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
            ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                        ForEach(0..<cardCount,id: \.self){ index in
                            CardView(content: emojies[index]).aspectRatio(1,contentMode: .fit)
                        }
                    }.foregroundColor(.pink)
                }
            Spacer()
            HStack{
                Button(action: {
                    cardCount-=1
                }) {
                    Image(systemName: "rectangle.stack.fill.badge.minus").font(.largeTitle)
                }.disabled(checkCount(offset: -1)[1])
                Spacer()
                Button(action: {
                    cardCount+=1
                }) {
                    Image(systemName: "rectangle.stack.fill.badge.plus").font(.largeTitle)
                }.disabled(checkCount(offset: +1)[0])
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
                if(isFaceUp){
                    Group{
                        base.fill(.white)
                        base.strokeBorder(lineWidth: 5)
                        Text(content).font(.largeTitle)
                    }
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
