//
//  Article.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 06/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import Foundation

struct Article {
    var name: String
    var place: String
    var adress: String
    var ranking: String
    var projectProgress: String
    var projectBudget: String
    var startDate: String
    var completionDate: String
    var constructors: String
    var developers: String
    var fundingTarget: String
    var equityShare: String
    var closingDate: String
    var minInvestment: String
    var projectTerm: String
    var about: String
    var imageUrl: String
    
    init(dictionary: Dictionary<String, Any>) {
        name = dictionary["name"] as? String ?? ""
        place = dictionary["place"] as? String ?? ""
        adress = dictionary["adress"] as? String ?? ""
        ranking = dictionary["ranking"] as? String ?? ""
        projectProgress = dictionary["projectProgress"] as? String ?? ""
        projectBudget = dictionary["projectBudget"] as? String ?? ""
        startDate = dictionary["startDate"] as? String ?? ""
        completionDate = dictionary["completionDate"] as? String ?? ""
        constructors = dictionary["constructors"] as? String ?? ""
        developers = dictionary["developers"] as? String ?? ""
        fundingTarget = dictionary["fundingTarget"] as? String ?? ""
        equityShare = dictionary["equityShare"] as? String ?? ""
        closingDate = dictionary["closingDate"] as? String ?? ""
        minInvestment = dictionary["minInvestment"] as? String ?? ""
        projectTerm = dictionary["projectTerm"] as? String ?? ""
        about = dictionary["about"] as? String ?? ""
        imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}

