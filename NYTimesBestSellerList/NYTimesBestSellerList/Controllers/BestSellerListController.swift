//
//  BestSellerListController.swift
//  NYTimesBestSellerList
//
//  Created by Bethany Wride on 10/2/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import Foundation

class BestSellerListController {
    // MARK: - Global Variables
    // Does this need to be private or static?
    private static let baseURL = URL(string: "https://api.nytimes.com/svc/books/v3/lists.json")
    
//    let arrayOfBestSellerLists: [BestSellerListKeys] = [
//        BestSellerList(name: , key: )
//        ]
//    
    // Singleton
//    static let sharedInstance = BestSellerListController()
    // MARK: - Functions
    // Only takes in a parameter if we are using the data instead of just pulling it
    // when using the array: for listKey: String,
    static func fetchBestSellerList(completion: @escaping ([Result]) -> Void) {
        guard let unwrappedURL = baseURL else {
        fatalError("URL is nil")
        }
        // change hardcover fiction to be listKey
        let urlParameters = ["api-key": "Ed1qf7SznejhX0nTJ2vKFGVPo3amJfAA", "list": "hardcover-fiction"]
        let queryItems = urlParameters.compactMap( { URLQueryItem(name: $0.key, value: $0.value) } )
        var urlComponents = URLComponents(url: unwrappedURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems
        guard let finalURL = urlComponents?.url else { return }
        print(finalURL)

        // DataTask
        URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return
            }
            guard let data = data else {
                print("No data")
                completion([])
                return
            }
            do {
                let decodedList = try JSONDecoder().decode(BestSellerList.self, from: data)
                completion(decodedList.results)
            } catch {
                 print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
//            guard let bestSellerDictionary = try? JSONDecoder().decode(BestSellerList.self, from: data) else {
//                print("Error decoding data")
//                completion()
//                return
//            }
        }.resume()
    } // End of function
} // End of class
