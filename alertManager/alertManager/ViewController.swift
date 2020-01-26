//
//  ViewController.swift
//  alertManager
//
//  Created by Jay on 2020/1/26.
//  Copyright © 2020 Null. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alertManager = AlertManager()
    let cellTitleList = ["Two Button", "Three Button", "Picker Alert", "Text Field Alert"]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func cellActionFlow(mode:String) {
        switch mode {
        case "Two Button":
            alertManager.twoButtonAction(view: self)
        case "Three Button":
            alertManager.threeButtonAction(view: self)
        case "Picker Alert":
            alertManager.pickerButtonAction(view: self)
        case "Text Field Alert":
            alertManager.textFieldAlertAction(view:self)
        default:
            print("No this mode")
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = cellTitleList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellActionFlow(mode: cellTitleList[indexPath.row])
        print(cellTitleList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
