//
//  AppDetailViewController.swift
//  ios-app-store-clone
//
//  Created by 허지인 on 2021/12/23.
//

import SnapKit
import UIKit

final class AppDetailViewController: UIViewController {
    private let today: Today
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .label
       
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
       
        return label
    }()
    
    private let dowunloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        
        return button
    }()
    
    init(today: Today) {
        self.today = today
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupViews()
        
        titleLabel.text = today.title
        subTitleLabel.text = today.subTitle
        
        if let imageURL = URL(string: today.imageURL){ //URL은 초기화 메서드 리턴값이 옵셔널이기 때문에 옵셔널 체이닝을 해야함
            appIconImageView.kf.setImage(with: imageURL) //옵셔널이 아니면
        }
    }
}

//MARK: Private
private extension AppDetailViewController {
    func setupViews() {
        [
            appIconImageView,
            titleLabel,
            subTitleLabel,
            dowunloadButton,
            shareButton
        ].forEach{ view.addSubview($0) }
        
        appIconImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.height.equalTo(100.0)
            $0.width.equalTo(appIconImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(appIconImageView.snp.top)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        dowunloadButton.snp.makeConstraints{
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.height.equalTo(24.0)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(60.0)
        }
        
        shareButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.height.equalTo(24.0)
            $0.width.equalTo(60.0)
        }
    }
    
    @objc func didTapShareButton() {
        let activityItems: [Any] = [today.title]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
}
