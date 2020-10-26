//
//  SearchResult.swift
//  iTunes Search
//
//  Created by FGT MAC on 10/23/20.
//

import Foundation

//This will allow us to use our own internal name for the props instead of using their names ex. we want to use "title" but JSON is using "trackName"
enum CodingKeys: String, CodingKey {
    case title = "trackName"
    case creator = "artistName"
}

//Second level
struct SearchResult: Codable {
    var title: String
    var creator: String
}

//First level in the JSON data coming from itunes API
struct SearchResults {
    let results:[SearchResult]
}
