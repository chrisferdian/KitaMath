//
//  KMBaseView.swift
//  KitaMath
//
//  Created by AIA-Chris on 11/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import Foundation
import UIKit

enum Type {
    case Sum
    case Multiply
}

internal class KMBaseView: UIView {

    var isKeyboardAppear:Bool = false
    fileprivate var type:Type?
    let viewModel = KMViewModelMain()

    public func setType(type:Type) {
        self.type = type
    }
    
    public func getType() -> Type {
        return type!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismiss)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    @objc func dismiss() {
        if isKeyboardAppear {
            endEditing(true)
        }
    }
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        NotificationCenter.default.removeObserver(self)
    }
    @objc func keyboardWillAppear() {isKeyboardAppear = true}
    @objc func keyboardWillDisappear() {isKeyboardAppear = false}
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        removeFromSuperview()
//    }

}
