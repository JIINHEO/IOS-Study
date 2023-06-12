//
//  BeerListCell.swift
//  ios-brewery
//
//  Created by 허지인 on 2021/11/30.
//

import UIKit
import Kingfisher
import SnapKit

class BeerListCell: UITableViewCell {
    
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        
        [beerImageView, nameLabel, taglineLabel].forEach{
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        taglineLabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).inset(5)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
       
        beerImageView.kf.setImage(with: imageURL, placeholder:  #imageLiteral(resourceName: "beer_icon"))
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        
        accessoryType = .disclosureIndicator // 셀 우측에 > 모양
        selectionStyle = .none //셀을 클릭시 회색 음영이 발생하지 않음 
    }
}
