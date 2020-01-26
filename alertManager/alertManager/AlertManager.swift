//
//  AlertManager.swift
//  alertManager
//
//  Created by Jay on 2020/1/26.
//  Copyright © 2020 Null. All rights reserved.
//

import Foundation
import UIKit

class AlertManager{
    //picker
    //image
    //textfield
    func twoButtonAction(view:UIViewController){
        let alert = UIAlertController(title: "Two Button",
                                      message: "Basic",
                                      preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes",
                                      style: .default,
                                      handler: nil)
        let noAction = UIAlertAction(title: "no",
                                     style: .default,
                                     handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        view.present(alert, animated: true)
    }

    func threeButtonAction(view:UIViewController){
        let alert = UIAlertController(title: "Three Button",
                                      message: "Extra",
                                      preferredStyle: .alert)
        let oneAction = UIAlertAction(title: "one",
                                      style: .default,
                                      handler: nil)
        let twoAction = UIAlertAction(title: "two",
                                      style: .default,
                                      handler: nil)

        let threeAction = UIAlertAction(title: "three",
                                        style: .default,
                                        handler: nil)
        alert.addAction(oneAction)
        alert.addAction(twoAction)
        alert.addAction(threeAction)
        view.present(alert, animated: true)
    }

    func pickerButtonAction(view:UIViewController){
        let alert = UIAlertController(
            title: "Date",
            message: "\n\n\n\n\n\n\n\n\n",
            preferredStyle: .alert)
        let datePicker = UIDatePicker(frame:
        CGRect(x: 0, y: 50, width: 270, height: 162))
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        alert.view.addSubview(datePicker)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler:{ (UIAlertAction) in
            let date = datePicker.date
            let dformatter = DateFormatter()
            dformatter.dateFormat = "yyyy/MM/dd"
            print(dformatter.string(from: date))
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler:nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        view.present(alert,
                     animated: true,
                     completion: {
                        datePicker.frame.size.width = alert.view.frame.size.width
        })
    }

    func textFieldAlertAction(view:UIViewController){
        let alert = UIAlertController(title: "textField", message: "enter something", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (renameTextField) in
            renameTextField.placeholder = "Enter something"
        })
        let noAction = UIAlertAction(title: "no", style: .default, handler: nil)

        let yesAction = UIAlertAction(title: "yes", style: .default, handler: { (action) in
            let textField = (alert.textFields?.first)! as UITextField
            guard let text = textField.text else {return}
            print(text)
        })
        alert.addAction(yesAction)
        alert.addAction(noAction)
        view.present(alert,animated: true)
    }
}
