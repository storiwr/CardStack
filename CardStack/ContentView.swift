//  ContentView.swift
//  CardStack
//
//  Created by Stephen on 8/30/20.
//

import SwiftUI

class CardData: ObservableObject {
    @Published var name = "Hello Card"
    @Published var cardBody = "I'm so happy to be here!"
}

struct ContentView: View {
    @ObservedObject private var card = CardData()
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            List {
                Text(card.name)
                Text(card.cardBody)
                
            }.navigationBarTitle("Cards")
                .navigationBarItems(trailing:
                                        Button("New"){
                                            self.showingSheet.toggle()
                                        } .sheet(isPresented: $showingSheet, content: {
                                            NewView()
                                        }))
        }
}


struct DetailView: View {
    @ObservedObject private var card = CardData()
    var body: some View {
        NavigationView {
            List {
                Text(card.cardBody)
                Text(card.name)
            }.navigationBarTitle(Text("Card Title"))
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}
    
    struct NewView: View {
        @ObservedObject private var card = CardData()
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            NavigationView {
                List {
                    TextField("Title", text: $card.name)
                    TextField("Body", text: $card.cardBody)
                }.navigationBarTitle(Text("NewCard"))
                .navigationBarItems(trailing:
                                        Button("Done") {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                
            )}
        }
    }

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
