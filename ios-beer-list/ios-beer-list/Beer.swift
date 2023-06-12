//
//  Beer.swift
//  ios-brewery
//
//  Created by 허지인 on 2021/11/30.
//

import Foundation

struct Beer: Codable {
    
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
//    let name, tagline, description, brewers_tips, image_url: String?
    let foodPairing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
        //#tag #good #hello
    }
    
    //   Codingkeys 대소문자 주의
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
}
