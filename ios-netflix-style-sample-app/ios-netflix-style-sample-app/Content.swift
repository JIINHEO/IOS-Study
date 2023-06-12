//
//  Content.swift
//  ios-netflix-style-sample-app
//
//  Created by 허지인 on 2021/11/25.
//

import UIKit

struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    enum SectionType: String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage() //찾는 이미지가 없을 경우 빈 이미지를 띄움
    }
}
