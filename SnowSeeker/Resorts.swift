//
//  Resorts.swift
//  SnowSeeker
//
//  Created by slava bily on 17/7/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

class Resorts: ObservableObject {
    
    @Published var resorts: [Resort]
    
    init() {
        self.resorts = Bundle.main.decode("resorts.json")
    }
    
    func filteredByCountry(_ country: String) -> [Resort] {
        resorts.filter {
            $0.country == country
        }
    }
    
    func filteredBySize(_ stringSize: String) -> [Resort] {
        var numberSize = Int()
        
        switch stringSize {
        case "Small":
            numberSize = 1
        case "Average":
            numberSize = 2
        case "Large":
            numberSize = 3
        default:
            break
        }
        return resorts.filter {
            $0.size == numberSize
        }
    }
    
    func filteredByPrice(_ stringPrice: String) -> [Resort] {
        var numberPrice = Int()
        
        switch stringPrice {
        case "$":
            numberPrice = 1
        case "$$":
            numberPrice = 2
        case "$$$":
            numberPrice = 3
        default:
            break
        }
        return resorts.filter {
            $0.price == numberPrice
        }
    }
}
