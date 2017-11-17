//
//  MountainsLayer.swift
//  animatedLoadingScreenPractice
//
//  Created by Sean Calkins on 11/16/17.
//  Copyright © 2017 Sean Calkins. All rights reserved.
//

import UIKit

class MountainLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = UIColor.black.cgColor
        lineWidth = 5
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = mountainPathPre.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    var mountainPathPre: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50.0, y: 130.0))
        path.addLine(to: CGPoint(x: 49.0, y: 129.0))
        path.addLine(to: CGPoint(x: 51.0, y: 129.0))
        return path
    }
    
    var mountainPathStart: UIBezierPath {
        let startingPath = UIBezierPath()
       
        
        startingPath.close()
        return startingPath
    }
    
    var peakOne: UIBezierPath {
        let peakPath = UIBezierPath()
        
        
        peakPath.addLine(to: CGPoint(x: 0.0, y: 120.0))
        peakPath.addLine(to: CGPoint(x: 10.0, y: 25.0))
        peakPath.addLine(to: CGPoint(x: 50, y: 65.0))
        peakPath.close()
        return peakPath
    }
    
    var mountainPathFull: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100.0, y: 100.0))
        path.addLine(to: CGPoint(x: 50.0, y: 130.0))
        path.addLine(to: CGPoint(x: 0.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: 60.0))
        // peak 1
        path.addLine(to: CGPoint(x: 15.0, y: 37.5))
        
        path.addLine(to: CGPoint(x: 18.0, y: 42.0))
        
        // peak 2
        path.addLine(to: CGPoint(x: 27.0, y: 20.0))
        
        path.addLine(to: CGPoint(x: 39.0, y: 43.3))
        
        // peak 3
        path.addLine(to: CGPoint(x: 70.0, y: -20.0))
        
        path.addLine(to: CGPoint(x: 85.0, y: 58.0))
        path.addLine(to: CGPoint(x: 100.0, y: 45.0))
       
        return path
    }
    
    func grow() {

        let mountainGrowAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        mountainGrowAnimation.fromValue = mountainPathPre.cgPath
        mountainGrowAnimation.toValue = mountainPathFull.cgPath
        mountainGrowAnimation.beginTime = 0.0
        mountainGrowAnimation.duration = 1.0
        mountainGrowAnimation.fillMode = kCAFillModeForwards
        mountainGrowAnimation.isRemovedOnCompletion = false
        add(mountainGrowAnimation, forKey: nil)
   
    }
    
}
