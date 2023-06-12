//
//  Feature.swift
//  ios-app-store-clone
//
//  Created by 허지인 on 2021/12/24.
//

import Foundation

struct Feature: Decodable {
    let type : String
    let appName: String
    let description: String
    let imageURL: String
}
