//
//  CreditCard.swift
//  ios-credit-card-list
//
//  Created by 허지인 on 2021/11/17.
//

import Foundation

struct CreditCard: Codable {
    let id: Int
    let rank: Int
    let name: String
    let cardImageURL: String
    let promotionDetail: PromotionDetail
    let isSelected: Bool?
    // 사용자가 선택하면 값을 가지고 그 전까지는 nil이기 때문에 optional
}

struct PromotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let condition: String
    let benefitCondition: String
    let benefitDetail: String
    let benefitDate: String
}
