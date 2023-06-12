//
//  ViewController.swift
//  LEDBoard
//
//  Created by 허지인 on 2021/10/28.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contensLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contensLabel.textColor = .yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contensLabel.text
            settingViewController.textColor = self.contensLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contensLabel.text = text
        }
        self.contensLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}

