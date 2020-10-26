//
//  SearchResultController.swift
//  iTunes Search
//
//  Created by FGT MAC on 10/26/20.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case post = "POST"
}

class SearchResultController {
    
    //MARK: - Properties
    var searchResults: [SearchResult] = []
    
    private let baseURL = URL(string: "https://itunes.apple.com/search")!
    
    
    //MARK: - Methods
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping () -> Void) {
        
        //1.Build URL
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let queryItem1 = URLQueryItem(name: "term", value: searchTerm)
        let queryItem2 = URLQueryItem(name: "media", value: resultType.rawValue)
        
        urlComponents?.queryItems = [queryItem1,queryItem2]
        
        guard let requestURL = urlComponents?.url else {
            completion()
            return
        }
        
        //2.Create request type
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error fetching data \(error)")
                completion()
                return
            }
            
            guard let data = data else {
                print("No data return from API")
                completion()
                return
            }
            
            
            let jsonDecoder = JSONDecoder()
            
            //clear curent data
            self.searchResults.removeAll()
            
            do{
                let returnData = try jsonDecoder.decode(SearchResults.self, from: data)
                self.searchResults.append(contentsOf: returnData.results)
                completion()
            }catch{
                print("Error decoding data: \(error)")
                completion()
            }
            
        }.resume()
        
    }
}
