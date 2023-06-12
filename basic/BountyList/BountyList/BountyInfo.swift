//
//  BountyInfo.swift
//  BountyList
//
//  Created by 허지인 on 2021/05/03.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
