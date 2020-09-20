//
//  CardStack.swift
//  CardStack
//
//  Created by Stephen on 9/20/20.
//

import Foundation

class CardStack: ObservableObject {
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
