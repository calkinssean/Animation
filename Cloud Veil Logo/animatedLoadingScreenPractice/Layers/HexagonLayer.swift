//
//  HexagonLayer.swift
//  animatedLoadingScreenPractice
//
//  Created by Sean Calkins on 11/16/17.
//  Copyright © 2017 Sean Calkins. All rights reserved.
//

import UIKit

class HexagonLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.3
    
    override init() {
        super.init()
        fillColor = UIColor.clear.cgColor
        lineWidth = 5.0
        path = hexagonPathFull.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var hexagonPathFull: UIBezierPath {
        let hexagonPath = UIBezierPath()
        hexagonPath.move(to: CGPoint(x: 50.0, y: 130.0))
        hexagonPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
        hexagonPath.addLine(to: CGPoint(x: 0.0, y: 30.0))
        hexagonPath.addLine(to: CGPoint(x: 50.0, y: 0.0))
        hexagonPath.addLine(to: CGPoint(x: 100.0, y: 30.0))
        hexagonPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        hexagonPath.close()
        
        return hexagonPath
    }
 
    
    func animateStrokeWithColor(color: UIColor) {
        strokeColor = color.cgColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        add(strokeAnimation, forKey: nil)
    }
    
}
