//
//  PrimaryButton.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 14/08/23.
//

import UIKit

class PrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8, blue: 0.8901960784, alpha: 1)
        titleLabel!.font = titleLabel?.font.withSize(25)
        tintColor = UIColor.black
        layer.cornerRadius = 25
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

}
