//
//  BestSellerList.swift
//  NYTimesBestSellerList
//
//  Created by Bethany Wride on 10/2/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import Foundation

struct BestSellerList: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case bestSellersDate = "bestsellers_date"
        case rank
        case bookDetails = "book_details"
        case reviews
    }
    let listName: String
    let bestSellersDate: String
    let rank: Int
    let bookDetails: [BookDetail]
    let reviews: [Review]
}

struct BookDetail: Decodable {
    let title: String
    let author: String
}

struct Review: Decodable {
    private enum CodingKeys: String, CodingKey {
        case bookReviewLink = "book_review_link"
    }
    let bookReviewLink: String
}
 
//struct BestSellerListKeys {
//    let name: String
//    let key: String
//}
//
