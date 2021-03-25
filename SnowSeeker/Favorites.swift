//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Scott Obara on 24/3/21.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            print("ping 1")
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                print("\(decoded)")
                self.resorts = decoded
                return
            }
        }
        print("ping 3")
        // still here? Use an empty array
        self.resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
            print("ping 4")
        }
    }
}
