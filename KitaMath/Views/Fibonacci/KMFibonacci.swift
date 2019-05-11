//
//  KMFibonacci.swift
//  KitaMath
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import UIKit

internal class KMFibonacci: KMBaseView, UITextFieldDelegate {

    @IBOutlet weak var fieldNValue:UITextField!
    @IBOutlet weak var labelResult:UILabel!
    @IBOutlet weak var buttonProceed:KMButton!
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var cardView:KMCardView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.contentSize = frame.size
        fieldNValue.delegate = self
        buttonProceed.setDisable()
        fieldNValue.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        cardView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismiss)))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        didProcessTapped()
        return true
    }
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text!.count >= 1 && textField.text != "0" && textField.text != "1"{
            if textField.text!.toInt() == 0 || textField.text!.toInt() == 0 {
                textField.text = ""
                buttonProceed.setDisable()
                return
            }
        }
        guard
            let value = fieldNValue.text, !value.isEmpty
            else {
                buttonProceed.setDisable()
                fieldNValue.enablesReturnKeyAutomatically = false
                return
        }
        buttonProceed.setEnable()
        fieldNValue.enablesReturnKeyAutomatically = true
    }
    
    @IBAction func didProcessTapped() {
        self.endEditing(true)
        if fieldNValue.text!.toInt() > 1 {
            let n = Int(fieldNValue.text!)
            labelResult.text = "\(viewModel.findFibonacci(n: n!))"
        } else {
            labelResult.text = "Value not available"
        }
    }
    
    @IBAction func closeTapped() {
        self.removeFromSuperview()
    }
}
