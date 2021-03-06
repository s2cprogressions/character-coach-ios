//
//  GlobalNavigationBar.swift
//  CharacterCoach
//
//  Created by Matt Blessed on 11/5/16.
//  Copyright © 2016 Matt Blessed. All rights reserved.
//

import Foundation
import UIKit

// GlobalNavigationBar maintains the barTintColor when updated
class GlobalNavigationBar {
    static let shared = GlobalNavigationBar()
    
    // currently set to the default (blue) color, this will change
    // to the navigation bar color that's current when loaded
    var tintColor: UIColor = UIColor(colorLiteralRed: 97.0/255.0, green: 125.0/255.0, blue: 136.0/255.0, alpha: 1.0)
}
