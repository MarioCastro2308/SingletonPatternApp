//
//  GradientBackground.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 14/08/23.
//

import UIKit

class GradientBackground: UIView {

    var topColor : UIColor = #colorLiteral(red: 0.3058823529, green: 0.3294117647, blue: 0.7843137255, alpha: 1) // #56ab2f
    var bottomColor : UIColor = #colorLiteral(red: 0.5607843137, green: 0.5803921569, blue: 0.9843137255, alpha: 1) // #a8e063
    
    var startPointX : CGFloat = 0
    var startPointY : CGFloat = 0
    
    var endPointX : CGFloat = 1
    var endPointY : CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
