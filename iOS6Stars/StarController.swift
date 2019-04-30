//
//  StarController.swift
//  iOS6Stars
//
//  Created by Paul Solt on 4/30/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

class StarController {
    
    // name, distance
    // addStar(named: "Sun", withDistance: 0.0)
    func addStar(named name: String, withDistance distance: Double) {
        
        // 1. Create a star
        // 2. Add the star to the list
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
    
    // Save to disk
    func saveToPerisitentStore() {
        
    }
    
    // Load from the disk
    func loadFromPersistentStore() {
        
    }
    
    // Encapsulation: protect our data from (external) modification
    // Sun, Alpha Centauri, etc. ...
    private(set) var stars: [Star] = []
}
