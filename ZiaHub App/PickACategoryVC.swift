//
//  PickACategoryVC.swift
//  ZiaHub App
//
//  Created by Joseph Salmond on 4/16/17.
//  Copyright © 2017 Joseph Salmond. All rights reserved.
//

// Currently pulls all data from within the app. Needs to actually pull data from Firebase

// The users selects a category of jobs they want to looks at. Sorts all jobs so that it will only show the selected category in the next VC
import UIKit

var allTitles = [String]()
var allImages = [String]()
var allDescriptions = [String]()
var allContactInfo = [String]()
var allCategories = [Category]()

var categorySelected:Category = .other

class PickAJobCategoryVC: UIViewController {
    
    @IBOutlet weak var cleaningButton: UIButton!
    @IBOutlet weak var movingButton: UIButton!
    @IBOutlet weak var handyWorkButton: UIButton!
    @IBOutlet weak var otherJobsButton: UIButton!
    
    // Sort all jobs into related arrays based on the category the user is looking for
    @IBAction func cleaningSelected(_ sender: Any) {
        categorySelected = .cleaning
        sortJobsByCategory()
    }

    @IBAction func movingSelected(_ sender: Any) {
        categorySelected = .moving
        sortJobsByCategory()
    }
    
    @IBAction func handyWorkSelected(_ sender: Any) {
        categorySelected = .handyWork
        sortJobsByCategory()
    }
    
    @IBAction func otherSelected(_ sender: Any) {
        categorySelected = .other
        sortJobsByCategory()
    }
    
    // Goes back to home screem
    @IBAction func goBack(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    
    // Sorts all information from arrays into new arrays based on the category the user selects
    func sortJobsByCategory() {
        var x = 0
        
        for _ in 0...allCategories.count - 1 {
            if allCategories[x] == categorySelected {
                jobTitleArray.append(allTitles[x])
                jobImageArray.append(allImages[x])
                jobDescriptionArray.append(allDescriptions[x])
                contactInfoArray.append(allContactInfo[x])
                jobCategoryArray.append(allCategories[x])
            }
            x += 1
        }
    }
    
    override func viewDidLoad() {
        
        print(allTitles)
        print(allImages)
        print(allDescriptions)
        print(allContactInfo)
        print(allCategories)
        
        // Filler data to show that the app works. This should actually pull all the data from Firebase
        allTitles += ["Job 1", "Job 2", "Job 3", "Job 4", "Job 5", "Job 6", "Job 7", "Job 8"]
        allImages += ["kitchen.jpg", "moving.jpg", "cleaning.jpg", "kitchen.jpg", "moving.jpg", "cleaning.jpg", "kitchen.jpg", "moving.jpg"]
        allDescriptions += ["Description 1", "Description 2", "Description 3", "Description 4", "Description 5", "Description 6", "Description 7", "Description 8"]
        allContactInfo += ["505-123-1234", "123-123-1234", "987-987-9876", "567-567-5678", "505-123-1234", "123-123-1234", "987-987-9876", "567-567-5678"]
        allCategories += [.moving, .cleaning, .handyWork, .other, .other, .cleaning, .moving, .handyWork]
        
        print(allTitles)
        print(allImages)
        print(allDescriptions)
        print(allContactInfo)
        print(allCategories)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Resets all category-specific arrays to empty when the user returns to the VC to refill the arrays based on the new category
        jobTitleArray.removeAll()
        jobImageArray.removeAll()
        jobDescriptionArray.removeAll()
        contactInfoArray.removeAll()
        jobCategoryArray.removeAll()
    }
    
}
