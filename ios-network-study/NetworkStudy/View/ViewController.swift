//
//  ViewController.swift
//  NetworkStudy
//
//  Created by jiinheo on 2023/02/12.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.text = "...통신하기 전 화면..."
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    lazy var networkButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("networkButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        return button
    }()
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }

}

// MARK: - Layout
extension ViewController {
    
    func setView() {
        [textView, networkButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textView.heightAnchor.constraint(equalToConstant: 500),
            textView.widthAnchor.constraint(equalToConstant: 300),
            
            networkButton.topAnchor.constraint(equalTo: self.textView.bottomAnchor, constant: 50),
            networkButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            networkButton.heightAnchor.constraint(equalToConstant: 44),
            networkButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }


}

`
