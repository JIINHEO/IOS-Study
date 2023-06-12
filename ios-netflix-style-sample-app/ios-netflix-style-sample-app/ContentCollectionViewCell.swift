//
//  ContentCollectionViewCell.swift
//  ios-netflix-style-sample-app
//
//  Created by 허지인 on 2021/11/25.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView) //addSubview : 스토리보드의 + 역할
        
        imageView.snp.makeConstraints{ //snapkit
            $0.edges.equalToSuperview() //superView에 edges를 딱 맞게
        }
    }
    
}
