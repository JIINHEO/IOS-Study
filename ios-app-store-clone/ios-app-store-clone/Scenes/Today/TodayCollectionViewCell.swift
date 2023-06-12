//
//  TodayCollectionViewCell.swift
//  ios-app-store-clone
//
//  Created by 허지인 on 2021/12/22.
//
import SnapKit
import UIKit
import Kingfisher


final class TodayCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(today: Today) {
        setupSubViews()
        
        //이미지가 아닌 셀에
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10
        
        subTitleLabel.text = today.subTitle
        titleLabel.text = today.title
        descriptionLabel.text = today.description
        
        if let imageURL = URL(string: today.imageURL){ //URL은 초기화 메서드 리턴값이 옵셔널이기 때문에 옵셔널 체이닝을 해야함
            imageView.kf.setImage(with: imageURL) //옵셔널이 아니면
        }
    }
}

private extension TodayCollectionViewCell {
    func setupSubViews() {
        [imageView, titleLabel, subTitleLabel, descriptionLabel]
            .forEach{addSubview($0) }
        
        subTitleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(subTitleLabel)
            $0.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview().inset(24.0)
        }
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
