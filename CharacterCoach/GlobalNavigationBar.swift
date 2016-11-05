//
//  GlobalNavigationBar.swift
//  CharacterCoach
//
//  Created by Matt Blessed on 11/5/16.
//  Copyright © 2016 Matt Blessed. All rights reserved.
//

import Foundation
import UIKit

class GlobalNavigationBar {
    static let shared = GlobalNavigationBar()
    
    // currently set to the default (blue) color, this will change
    // to the navigation bar color that's current when loaded
    var tintColor: UIColor = UIColor(colorLiteralRed: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
}
