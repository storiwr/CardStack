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
//    let amount: Int
}

class Cards: ObservableObject {
    @Published var items: [CardInfo] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([CardInfo].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var cards = Cards()
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

//struct DetailView: View {
//    @ObservedObject private var card = CardInfo()
//    var body: some View {
//        NavigationView {
//            List {
//                Text(card.cardBody)
//                Text(card.name)
//            }.navigationBarTitle(Text("Card Title"))
//            .navigationBarItems(trailing: EditButton())
//
//        }
//    }
//}
    
//    struct NewView: View {
//        @ObservedObject private var card = CardInfo()
//        @Environment(\.presentationMode) var presentationMode
//
//        var body: some View {
//            NavigationView {
//                List {
//                    TextField("Title", text: $card.name)
//                    TextField("Body", text: $card.cardBody)
//                }.navigationBarTitle(Text("NewCard"))
//                .navigationBarItems(trailing:
//                                        Button("Done") {
//                                            self.presentationMode.wrappedValue.dismiss()
//                                        }
//
//            )}
//        }
//    }

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

