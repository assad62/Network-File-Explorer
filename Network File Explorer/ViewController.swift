//
//  ViewController.swift
//  Network File Explorer
//
//  Created by Mohammad Assad on 26/9/2019.
//  Copyright © 2019 Mohammad Assad. All rights reserved.
//

import UIKit
import SwiftEventBus

class ViewController: UIViewController{
    
    
     
   
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftEventBus.onMainThread(self, name: "masterCellClicked") {
            result in
           
            let type : PathType = result?.object as! PathType
            
            self.descLabel.text = type.pathType;
            // UI thread
        }

        // Do any additional setup after loading the view.
    }


}

