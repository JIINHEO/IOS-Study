//
//  StationDetailCollectionViewCell.swift
//  ios-subway-station-study
//
//  Created by jiinheo on 2021/12/28.
//

import UIKit
import SnapKit

class StationDetailCollectionViewCell: UICollectionViewCell {
 
    private lazy var lineLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
       
        return label
    }()
    
    private lazy var remainTimaLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
       
        return label
    }()
    
    func setup(with realTimeArrival: StationArrivalDataResponseModel.RealTimeArrival) {
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 0.2
        
        backgroundColor = .systemBackground //쉐도우를 설정해도 기준값이 없기 때문에 잊지말고 설정해줘야함.
        [lineLable, remainTimaLable].forEach{addSubview($0)}
        
        lineLable.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }
        
        remainTimaLable.snp.makeConstraints{
            $0.leading.equalTo(lineLable)
            $0.top.equalTo(lineLable.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        lineLable.text = realTimeArrival.line
        remainTimaLable.text = realTimeArrival.remainTime
        
    }
    
}
