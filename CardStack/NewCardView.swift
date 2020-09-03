//
//  NewCardView.swift
//  CardStack
//
//  Created by Stephen on 9/3/20.
//

import SwiftUI

struct NewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cards: Cards
    @State private var name = ""
    @State private var cardBody = ""

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $name)
                TextField("Body", text: $cardBody)

                }
                .navigationBarTitle("New Card")
                .navigationBarItems(trailing: Button("Done") {

                let item = CardInfo(name: self.name, cardBody: self.cardBody)
                    self.cards.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
        })
    }
    }
}


struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView(cards: Cards())
    }
}
