//
//  ViewController.swift
//  iOS6Stars
//
//  Created by Paul Solt on 4/30/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // starController.stars = [Star(name: "Sun", distance: 0.0)]
        listStars()
    }

    @IBAction func addStarButtonPressed(_ sender: Any) {
        // name (String), distance (Double)
        // Text Field text is always a String
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else {
                print("Invalid input!")
                return
        }
        // We only get down here when name is not nil, or we have a valid number
        //print("name: \(name) distance: \(distance)")
        starController.addStar(named: name, withDistance: distance)
        listStars()
        clearTextFields()
    }
    
    private func clearTextFields() {
        nameTextField.text = ""
        distanceTextField.text = ""
    }
    
    // list all of the stars we're tracking
    
    func listStars() {
        // 1. Create a string
        // 2. Append text about each star
        // 3. Display it in the textview
        
        var output = ""
        
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away.\n"
        }
        textView.text = output
    }
    
    
    let starController = StarController()
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var textView: UITextView!
}

