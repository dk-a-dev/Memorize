//
//  ContentView.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let emojies=["🥳","🥰","😘","🤩"]
    var body: some View {
        HStack{
            ForEach(0..<emojies.count,id: \.self){ index in
                CardView(content: emojies[index])
            }
        }.padding().foregroundColor(.red)
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
