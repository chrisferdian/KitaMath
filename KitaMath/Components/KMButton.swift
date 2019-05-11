//
//  KMButton.swift
//  KitaMath
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import UIKit

class KMButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 12
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 10
    @IBInspectable var shadowColor: UIColor? = UIColor(rgb: 0x989898)
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setEnable() {
        setImage(UIImage(named: "ic_go_enable"), for: .normal)
        isEnabled = true
        UIView.animate(withDuration: 0.3, animations: {
//            self.backgroundColor = UIColor(rgb: 0x4A81E1)
            self.setTitleColor(.white, for: .normal)
        })
    }
    
    
    public func setDisable() {
        setImage(UIImage(named: "ic_go_disable"), for: .normal)
        isEnabled = false
//        backgroundColor = UIColor(rgb: 0xDEDEDE)
        self.setTitleColor(.black, for: .normal)
    }
}
