//
//  SecondViewController.swift
//  ZiaHub App
//
//  Created by Joseph Salmond on 4/16/17.
//  Copyright © 2017 Joseph Salmond. All rights reserved.
//

import UIKit

// Need to connect textView and textFields to store the data the user enters into variable
// Needs to allow user to access photos and camera

// Currently all data will be stores within the app. Needs to actually store to Firebase

// Allows user to post a job the app
class PostAJobVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var newTitle = String()
    var newImage = String()
    var newDescription = String()
    var newContact = String()
    var newCategory:Category = .other
    
    var titleEntered = false
    var photoEntered = true //false
    var descriptionEntered = true //false
    var contactEntered = false
    var categorySelected = false
    
    @IBOutlet weak var takeButton: UIButton!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var cleaningButton: UIButton!
    @IBOutlet weak var movingButton: UIButton!
    @IBOutlet weak var handyWorkButton: UIButton!
    @IBOutlet weak var otherJobButton: UIButton!
    
    @IBOutlet weak var enterJobDescriptionTextView: UITextView!
    
    
    // Goes back to home screen
    @IBAction func goBack(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    
    // Assign textField to new variables
    
    @IBAction func titleEditingChanged(_ textField: UITextField) {
        if let title = textField.text {
            newTitle = title
            titleEntered = true
        }
    }
    
    @IBAction func contactEditingChanged(_ textField2: UITextField) {
        if let contact = textField2.text {
            newContact = contact
            contactEntered = true
        }
    }
    
//    @IBAction func descriptionEditingChanged(_ textView: UITextView) {
//        c
//    }
    
    
    
    
    
    // Select category for job
    @IBAction func cleaningSelected(_ sender: Any) {
        newCategory = .cleaning
        cleaningButton.alpha = 1.0
        movingButton.alpha = 0.25
        handyWorkButton.alpha = 0.25
        otherJobButton.alpha = 0.25
        categorySelected = true
    }
    
    @IBAction func movingSelected(_ sender: Any) {
        newCategory = .moving
        cleaningButton.alpha = 0.25
        movingButton.alpha = 1.0
        handyWorkButton.alpha = 0.25
        otherJobButton.alpha = 0.25
        categorySelected = true
    }

    @IBAction func handyWorkSelected(_ sender: Any) {
        newCategory = .handyWork
        cleaningButton.alpha = 0.25
        movingButton.alpha = 0.25
        handyWorkButton.alpha = 1.0
        otherJobButton.alpha = 0.25
        categorySelected = true
    }

    @IBAction func otherJobsSelected(_ sender: Any) {
        newCategory = .other
        cleaningButton.alpha = 0.25
        movingButton.alpha = 0.25
        handyWorkButton.alpha = 0.25
        otherJobButton.alpha = 1.0
        categorySelected = true
    }
    
    
    
    // Dismiss keyboard on textField when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    //Dismiss all keybords when tapping outside of keyboard
    func tap(gesture: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
        textView.resignFirstResponder()
        if let description = textView.text {
            newDescription = description
        }
        print(newDescription)
    }
    
    // Store information about job when user submits
    @IBAction func submitJob(_ sender: Any) {
        // Check all categories are filled
        if (titleEntered == true) && (photoEntered == true) && (descriptionEntered == true) && (contactEntered == true) && (categorySelected == true) {
            
            allTitles.append(self.newTitle)
            allImages.append("kitchen.jpg")    //)(self.newImage)
            allDescriptions.append(self.newDescription)
            allContactInfo.append(self.newContact)
            allCategories.append(self.newCategory)
            
            print(allTitles)
            print(allImages)
            print(allDescriptions)
            print(allContactInfo)
            print(allCategories)
            
            // Should probably actually segue to a DONE page, but haven't made one yet
            tabBarController?.selectedIndex = 0
        } else {
           //  DISPLAY ERROR
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newCategory = .moving
        cleaningButton.alpha = 1.0
        movingButton.alpha = 1.0
        handyWorkButton.alpha = 1.0
        otherJobButton.alpha = 1.0
        
        // Set up gestureRecognizer to dismiss keyboards
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        
        // Center text in buttons
        takeButton.titleLabel?.textAlignment = NSTextAlignment.center
        chooseButton.titleLabel?.textAlignment = NSTextAlignment.center
        cleaningButton.titleLabel?.textAlignment = NSTextAlignment.center
        movingButton.titleLabel?.textAlignment = NSTextAlignment.center
        handyWorkButton.titleLabel?.textAlignment = NSTextAlignment.center
        otherJobButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        // Put bos around textView to look same as textField
        self.enterJobDescriptionTextView.layer.cornerRadius = 8.0
        self.enterJobDescriptionTextView.layer.borderWidth = 0.1
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

