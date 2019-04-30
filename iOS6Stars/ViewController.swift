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
        // Do any additional setup after loading the view.
    }

    @IBAction func addStarButtonPressed(_ sender: Any) {
        print("add star")
    }
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var textView: UITextView!
}

