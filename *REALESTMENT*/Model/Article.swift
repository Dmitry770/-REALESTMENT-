//
//  Article.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 06/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import Foundation

/* "name" : "Omni Boston Seaport Hotel",
    "place" : "Boston, MA USA",
    "adress" : "370-430 Summer Street, Seaport District",
    "ranking" : "88",
    "projectProgress" : "Under construction",
    "projectBudget" : "$550 000 000",
    "startDate" : "30 Sep. 2018",
    "completionDate" : "31 Mar. 2021",
    "constructors" : "Janey Construction Management & Consulting and John Moriarty & Associates",
    "developers" : "New Boston Hospitality, Omni Hotels & Resorts, and The Davis Companies",
    "fundingTarget" : "$11 000 000",
    "equityShare" : "2%",
    "closingDate" : "1 Dec. 2019",
    "minInvestment" : "$1 000",
    "projectTerm" : "30 months",
    "about" : "Upcoming 1,055-room Omni Hotel located on a 2.1-acre parcel across from the Boston Convention and Exhibition Center (BCEC). The new 788,500-square-foot hotel will feature two new 21-story towers connected by a three-story grou",
    "imageUrl" : "https://s3.amazonaws.com/bldup/project_images/avatars/000/003/579/original/Omni-Hotel-Seaport-District-Boston-Development-The-Davis-Companies-Massport-Summer-Street-Boston-Convention-Exhibition-Center.jpg?1504473919"


 */

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

