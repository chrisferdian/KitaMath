//
//  KMSumMultiply.swift
//  KitaMath
//
//  Created by AIA-Chris on 09/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import UIKit

internal class KMSumMultiply: KMBaseView {

    @IBOutlet weak var cardView:KMCardView!
    @IBOutlet weak var fieldOne:UITextField!
    @IBOutlet weak var fieldTwo:UITextField!
    @IBOutlet weak var buttonProceed:KMButton!
    @IBOutlet weak var labelResult:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonProceed.setDisable()
        cardView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismiss)))
        [fieldOne, fieldTwo].forEach{$0.addTarget(self, action: #selector(editingChanged), for: .editingChanged)}
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
            let p1 = fieldOne.text, !p1.isEmpty,
            let p2 = fieldTwo.text, !p2.isEmpty
        
            else {
                self.buttonProceed.setDisable()
                return
        }
        buttonProceed.setEnable()
    }
    
    @IBAction func didProccedTapped() {
        labelResult.text =
            getType() == .Multiply ?
            viewModel.multiply(p0: (fieldOne.text?.toInt())!, p1: (fieldTwo.text?.toInt())!).toString() :
            viewModel.sum(p0: (fieldOne.text?.toInt())!, p1: (fieldTwo.text?.toInt())!).toString()
    }
    
    @IBAction func closeTapped() {
        removeFromSuperview()
    }
    
}
