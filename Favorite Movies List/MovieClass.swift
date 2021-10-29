//
//  MovieClass.swift
//  Favorite Movies List
//
//  Created by DANIEL VEGA on 10/19/21.
//

import Foundation

public class Movie: Codable {
    var name: String
    var yearMade: Int
    
    init(n: String, yM: Int) {
        name = n
        yearMade = yM
    }
    
    
}


