//
//  Item.swift
//  Memorize
//
//  Created by Dev Keshwani on 10/06/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
