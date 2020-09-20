//
//  CardDataModel.swift
//  CardStack
//
//  Created by Stephen on 9/1/20.
//

import Foundation

struct CardInfo: Codable, Identifiable {
    var id = UUID()
    var name: String
    var cardBody: String
}


