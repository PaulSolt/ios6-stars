//
//  StarController.swift
//  iOS6Stars
//
//  Created by Paul Solt on 4/30/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    // name, distance
    // addStar(named: "Sun", withDistance: 0.0)
    func addStar(named name: String, withDistance distance: Double) {
        
        // 1. Create a star
        // 2. Add the star to the list
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPerisitentStore()
    }
    
    // Save to disk
    func saveToPerisitentStore() {
        guard let url = persistentURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars: \(error)")
        }
    }
    
    // Load from the disk
    func loadFromPersistentStore() {
        // Make sure file exists
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else {
            print("load failed to find file")
            return }
        
        // Load and decode
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("stars.plist")
    }
    
    // Encapsulation: protect our data from (external) modification
    // Sun, Alpha Centauri, etc. ...
    private(set) var stars: [Star] = []
}
