//
//  Favorites.swift
//  SnowSeeker
//
//  Created by slava bily on 14/7/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    
    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    init() {
        // load our saved data
        
        // still here? Use an empty array
        self.resorts = []
    }
    
    // returns true if our set containes this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds resort to our set, updates all views and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the rsort from our set, updates all views and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        //write our data
    }
}
