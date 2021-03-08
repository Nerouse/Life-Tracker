//
//  MainTabController.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//

import Foundation
import UIKit



class MainTabController : UITabBarController{
    @IBInspectable var defaultIndex: Int = 1
    var Message:String = ""
    var Author:String = ""
   

    
    override func viewDidLoad() {
        //getAPI()
        super.viewDidLoad()
        selectedIndex = defaultIndex
        //performSegue(withIdentifier: "Messageid", sender: (Any).self)

    }
    
}
