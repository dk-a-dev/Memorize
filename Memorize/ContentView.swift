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
        CardView(isFaceUp: true)
        CardView()
        CardView()
    }
    
}

struct CardView:View {
    var isFaceUp:Bool=false
    var body: some View{
        ZStack(content:{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 5)
                Text("🫥").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 12)
            }
                
        }).padding()
    }
    
}

#Preview {
    ContentView()
}
