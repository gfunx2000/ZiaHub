//
//  Job_Data.swift
//  ZiaHub App
//
//  Created by Joseph Salmond on 4/16/17.
//  Copyright © 2017 Joseph Salmond. All rights reserved.
//

import Foundation
import UIKit


// Options for job categories
enum Category {
    case cleaning
    case moving
    case handyWork
    case other
}


// Sets up a Job class
class Job {
    var jobTitle = String()
    var jobImage = String()
    var jobDescription = String()
    var contactInfo = String()
    var category:Category = .other

    // Initialializer for Job Object
    init(job_title: String, job_image:String, job_description:String, contact_info:String, category: Category) {
        self.jobTitle = job_title
        self.jobImage = job_image
        self.jobDescription = job_description
        self.contactInfo = contact_info
        self.category = category
    }
}


// Arrays that store all job informations. Gets sorted in PickACateogryVC
var jobTitleArray = [String]()
var jobImageArray = [String]()
var jobDescriptionArray = [String]()
var contactInfoArray = [String]()
var jobCategoryArray = [Category]()



