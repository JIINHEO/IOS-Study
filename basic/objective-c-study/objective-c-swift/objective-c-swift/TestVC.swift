//
//  TestVC.swift
//  objective-c-swift
//
//  Created by jiinheo on 2022/06/21.
//

import UIKit

class TestVC: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton();
        button.setTitle("next 옵젝씨 :)", for: .normal);
        button.setTitleColor(.black, for: .normal);
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel();
        label.text = "hi 난 swift야"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label;
    }()
    
    @objc private func buttonClick() {
        let vc = ObjectTestVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension TestVC {
    
    private func setupUI() {
        
        self.view.backgroundColor = .yellow;
    
        [button, label].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200)
        ])
    }
    
}
