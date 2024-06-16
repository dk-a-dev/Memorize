//
//  ContentView.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @State var emojies:Array<String>=[]
    var halloween=["👻","🎃","💀","��","👺","☠️"]
    var vechiles=["🚗","🚙","🚋","🚎","🚝","🚁","🚲","🛩️","🏍️","🚒"]
    var countries=["🇬🇧","🇦🇷","🇧🇩","🇮🇳","🇦🇺"]

    func getThemedCards(id:Int){
        emojies.removeAll()
        switch id {
        case 1:
            emojies = halloween.shuffled() + emojies
        case 2:
            emojies = countries.shuffled() + emojies
        case 3:
            emojies = vechiles.shuffled() + emojies
        default:
            emojies = []
        }
    }
    var body: some View {
        Text("Memorize!").padding().fontWeight(.bold).font(.largeTitle)
        VStack{
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]){
                    ForEach(0..<emojies.count,id: \.self){ index in
                        CardView(content: emojies[index]).aspectRatio(2/3,contentMode: .fit)
                    }
                }.foregroundColor(.pink)
            Spacer()
        }.padding()
        Spacer()
        HStack(content: {
            Button {
                getThemedCards(id: 1)
                    } label: {
                        ButtonView(icon: "figure.fall.circle", title: "halloween")
                    }
            Spacer()
            Button {
                getThemedCards(id: 2)
                    } label: {
                        ButtonView(icon: "globe", title: "countries")
                    }
            Spacer()
            Button {
                getThemedCards(id: 3)
                    } label: {
                        ButtonView(icon: "car", title: "vechiles")
                    }
        }).padding(.horizontal)
    }
}

struct ButtonView:View {
    let icon:String
    let title:String
    var body: some View{
        VStack(content: {
            Image(systemName: icon).font(.largeTitle)
            Text(title).font(.headline)
        })
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
