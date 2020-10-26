//
//  SearchResult.swift
//  iTunes Search
//
//  Created by FGT MAC on 10/23/20.
//

import Foundation



//Second level
struct SearchResult: Codable {
    var title: String
    var creator: String
    
    //This will allow us to use our own internal name for the props instead of using their names ex. we want to use "title" but JSON is using "trackName"
    private enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
}

//First level in the JSON data coming from itunes API
struct SearchResults: Codable {
    let results: [SearchResult]
}
