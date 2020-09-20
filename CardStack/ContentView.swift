//  ContentView.swift
//  CardStack
//
//  Created by Stephen on 8/30/20.
//

import SwiftUI

struct CardInfo: Codable, Identifiable {
    let id = UUID()
    let name: String
    let cardBody: String
}


struct ContentView: View {
    @ObservedObject var cards = CardStack()
    @State private var showingNewCardView = false
    var body: some View {
        
        NavigationView {
            List {
                ForEach(cards.items) { card in
                    VStack {
                        Text(card.name)
                        Text(card.cardBody)
                    }
                    
                }.onDelete(perform: removeItems)
                
            }.navigationBarTitle("Cards")
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.showingNewCardView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    )
                    .sheet(isPresented: $showingNewCardView) {
                        NewCardView(cards: self.cards)
                    }
                }
            }
    func removeItems(at offsets: IndexSet) {
        cards.items.remove(atOffsets: offsets)
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: CardStack())
    }
}

