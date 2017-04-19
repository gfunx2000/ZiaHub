//
//  FirstViewController.swift
//  ZiaHub App
//
//  Created by Joseph Salmond on 4/16/17.
//  Copyright © 2017 Joseph Salmond. All rights reserved.
//

import UIKit

// Home page with option to go to post a job or find a job
class HomeVC: UIViewController {
    
    // Go to post a job screen
    @IBAction func postAJobPressed(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }

    // Go to find a job screen
    @IBAction func findAJobPressed(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

