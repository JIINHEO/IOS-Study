//
//  Friend.swift
//  MyFriends
//
//  Created by 허지인 on 2021/06/18.
//

import Foundation


struct Friend: Codable {
    
 
    struct Address: Codable {
        let country: String
        let city: String
    }

    let name: String
    let age: Int
    let addressinfo: Address
    
    var nameAndAge: String {
        return self.name + "(\(self.age)"

    }

    var fullAddress : String {
        return self.addressinfo.city + ", " + self.addressinfo.country

    }
    
    enum CodingKeys: String, CodingKey {
        case name, age
        case addressinfo = "address_info"
    }
}

