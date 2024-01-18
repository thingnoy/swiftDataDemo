//
//  User.swift
//  Gusto
//
//  Created by supasai haplakhon on 18/1/24.
//

import SwiftData
import Foundation

@Model
class Restaurant {
    @Attribute(.unique)
    var Name: String
    var PriceRaing: Int
    var QtyRating: Int
    var SpeedRating: Int

    init(Name: String, PriceRaing: Int, QtyRating: Int, SpeedRating: Int) {
        self.Name = Name
        self.PriceRaing = PriceRaing
        self.QtyRating = QtyRating
        self.SpeedRating = SpeedRating
    }
}
