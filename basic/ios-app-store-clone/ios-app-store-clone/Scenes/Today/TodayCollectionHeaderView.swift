//
//  TodayCollectionHeaderView.swift
//  ios-app-store-clone
//
//  Created by 허지인 on 2021/12/23.
//

import SnapKit
import UIKit
import SwiftUI

final class TodayCollectionHeaderView:UICollectionReusableView {
    //헤더, 푸터를 상속하기 위해서는 reusableView를 상속해야한다.
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = today()
        label.font =  .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font =  .systemFont(ofSize: 36.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private func today() -> String {
         let now = Date()
         let date = DateFormatter()
         date.locale = Locale(identifier: "ko_kr")
         date.dateFormat = "MM월 dd일 EEEE"
         let kr = date.string(from: now)
         return kr
     }
    
    func setupViews() {
        [dateLabel, titleLabel].forEach {addSubview($0)}

        dateLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32.0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
        
    }
    
}
