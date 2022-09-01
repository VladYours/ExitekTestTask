//
//  Movie.swift
//  testExitek
//
//  Created by Vlad Rakovich on 31.08.2022.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let year: Int
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
            return
                lhs.title == rhs.title
        }
    
}
