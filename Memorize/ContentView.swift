//
//  ContentView.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }.padding().foregroundColor(.red)
    }
    
}

struct CardView:View {
    @State var isFaceUp = false
    var body: some View{
        ZStack{
            var base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🥳").font(.largeTitle)
            }
            else{
                base.fill()
            }
        }.onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
    
}

#Preview {
    ContentView()
}
