//
//  DummyNavigationController.swift
//  CharacterCoach
//
//  Created by Matt Blessed on 11/6/16.
//  Copyright © 2016 Matt Blessed. All rights reserved.
//

import Foundation
import UIKit

class DummyNavigationController: UINavigationController {
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
