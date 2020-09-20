//
//  ListCellView.swift
//  CardStack
//
//  Created by Stephen on 9/4/20.
//

import SwiftUI

struct ListCellView: View {
    var card: CardInfo
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.name)
            Text(card.cardBody)
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(card: CardInfo(name:"Title", cardBody: "Testing 123"))
    }
}
