//
//  CardDataModel.swift
//  CardStack
//
//  Created by Stephen on 9/1/20.
//

import Foundation

struct CardData: Codable, Hashable, Identifiable {
    let name: String
    var id: String {name}
    let body: String

    static let sample1 = CardData(
        name: "Mantra",
        body: "I am enough and I have enought time."
    )
    static let sample2 = CardData(
        name: "HeartDrive",
        body: "Happy is voluntary. Don't live in the past"
    )
}


