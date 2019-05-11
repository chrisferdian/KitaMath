//
//  KMVCMain.swift
//  KitaMath
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import UIKit

class KMVCMain: UIViewController {

    @IBOutlet weak var tableContents:UITableView!
    let contents = Content.contents
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContents.accessibilityIdentifier = "tableContents"
        tableContents.delegate = self
        tableContents.dataSource = self
        self.tableContents.rowHeight = UITableView.automaticDimension
        self.tableContents.estimatedRowHeight = 164.0
        DispatchQueue.main.async {
            self.tableContents.reloadData()
        }
    }

    func showAlert(alert:UIView) {
        let windows = UIApplication.shared.windows
        let lastWindow = windows.last
        alert.frame = UIScreen.main.bounds
        lastWindow?.addSubview(alert)
    }
    
    func removeAlert(alert:UIView) {
        alert.removeFromSuperview()
    }
    
}

extension KMVCMain: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KMCellContent
        cell.accessibilityIdentifier = "myCell"
        cell.labelTitle.text = contents[indexPath.row].title
        cell.labelDescription.text = contents[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let sumDialog = showDialog(dialogName: "KMSumMultiply")
            sumDialog.setType(type: .Sum)
            self.showAlert(alert: sumDialog)
        case 1:
            let multiplyDialog = showDialog(dialogName: "KMSumMultiply")
            multiplyDialog.setType(type: .Multiply)
            self.showAlert(alert: multiplyDialog)
        case 2:
            let primeDialog = showDialog(dialogName: "KMPrime")
            self.showAlert(alert: primeDialog)
        case 3:
            let fibonacciDialog = showDialog(dialogName: "KMFibonacci")
            self.showAlert(alert: fibonacciDialog)
        default:
            print("nil")
        }
    }
    
    func showDialog(dialogName:String) -> KMBaseView {
        let alert = Bundle.main.loadNibNamed(dialogName, owner: self, options: nil)?.last as? KMBaseView
        return alert!
    }
    
}
