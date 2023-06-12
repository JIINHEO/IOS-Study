//
//  AddAlertViewController.swift
//  ios-alarm
//
//  Created by 허지인 on 2021/11/23.
//

import UIKit

class AddAlertViewController: UIViewController {
    var pickedDate: ((_ date: Date)-> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    

    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
