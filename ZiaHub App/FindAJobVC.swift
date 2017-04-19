//
//  FindAJobVC.swift
//  ZiaHub App
//
//  Created by Joseph Salmond on 4/16/17.
//  Copyright © 2017 Joseph Salmond. All rights reserved.
//

// Need to add a function to remove job when it is done

// Shows the jobs available in the user selected category. User swipes through to see all available jobs.
import UIKit

class FindAJobVC: UIViewController {
    
    var x = Int()
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var jobImage: UIImageView!
    
    // Swipe back through jobs
    @IBAction func backJobs(_ sender: Any) {
        if x > 0 {
            x = x - 1
            reloadData()
        }
    }
    
    // Swipe forward through jobs
    @IBAction func forwardJobs(_ sender: Any) {
        if x < jobTitleArray.count - 1 {
            x += 1
            reloadData()
        }
    }
    
    // Reloads all of the data for job each time user swipes to next job
    func reloadData() {
        jobTitle.text = jobTitleArray[x]
        jobDescription.text = jobDescriptionArray[x]
        contactInfo.text = contactInfoArray[x]
        jobImage.image = UIImage(named: jobImageArray[x])
    }
    
    // Goes back to home screen
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title for page to user selected category
        switch categorySelected {
        case .cleaning:
            navigationBar.topItem?.title = "Cleaning Jobs"
        case .moving:
            navigationBar.topItem?.title = "Moving Jobs"
        case .handyWork:
            navigationBar.topItem?.title = "Handy Work Jobs"
        case .other:
            navigationBar.topItem?.title = "Other Jobs"
        }
        
        //Sets page to first job
        x = 0
        reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
    
}
