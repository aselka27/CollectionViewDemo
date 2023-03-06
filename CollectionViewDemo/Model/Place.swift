//
//  Place.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 3.03.2023.
//

import Foundation


struct Place {
    let name: String
    let image: String
    let type: Categories.RawValue
    
    static var data: [Place] = [
        Place(name: "Ala-Archa", image: "alaarcha", type: Categories.Nature.rawValue),
        Place(name: "Son-Kol", image: "sonkol", type: Categories.Nature.rawValue),
        Place(name: "Belogorka", image: "belogorka", type: Categories.Nature.rawValue),
        Place(name: "Ala-Too Square", image: "alatoo", type: Categories.Sightseeing.rawValue),
        Place(name: "Tashrabat", image: "tashrabat", type: Categories.Sightseeing.rawValue),
        Place(name: "National Historical Museum",  image: "museum", type: Categories.Sightseeing.rawValue)
    ]
}


enum Categories: Int, CaseIterable {
    case Nature
    case Sightseeing
    case Blogs
    case Articles
    
    var name: String {
        switch self {
        case .Nature:
            return "Nature"
        case .Sightseeing:
            return "Sightseeing"
        case .Blogs:
            return "Blogs"
        case .Articles:
            return "Articles"
        }
    }
}
