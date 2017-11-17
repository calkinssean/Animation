//
//  CloudLayer.swift
//  animatedLoadingScreenPractice
//
//  Created by Sean Calkins on 11/16/17.
//  Copyright © 2017 Sean Calkins. All rights reserved.
//

import UIKit

class CloudLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = UIColor.white.cgColor
        lineWidth = 1
        path = circlePathSmall.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var circlePathSmall: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 65.0, width: 0.0, height: 0.0))
    }
    
    var circlePathFirst: UIBezierPath {
        let width = 45.0
        let height = 45.0
        return UIBezierPath(ovalIn: CGRect(x: 11 - width/2, y: 80.5 - height/2, width: width, height: height))
    }
    
    var circlePathSecond: UIBezierPath {
        let width = 45.0
        let height = 40.0
        return UIBezierPath(ovalIn: CGRect(x: 32.5 - width/2, y: 65.0 - height/2, width: width, height: height))
    }
    
    var circlePathThird: UIBezierPath {
        let width = 40.0
        let height = 35.0
        return UIBezierPath(ovalIn: CGRect(x: 37.5 - width/2, y: 85 - height/2, width: width, height: height))
    }
    
    var circlePathFourth: UIBezierPath {
        let width = 53.0
        let height = 44.0
        return UIBezierPath(ovalIn: CGRect(x: 72 - width/2, y: 79 - height/2, width: width, height: height))
    }
    
    var circlePathFifth: UIBezierPath {
        let width = 30.0
        let height = 25.0
        return UIBezierPath(ovalIn: CGRect(x: 100 - width/2, y: 86.5 - height/2, width: width, height: height))
    }
    
    var cloudPathFirst: UIBezierPath {
        return circlePathFirst
    }
    
    var cloudPathSecond: UIBezierPath {
        let cloudPath = UIBezierPath()
        cloudPath.append(cloudPathFirst)
        cloudPath.append(circlePathSecond)
        return cloudPath
    }
    
    var cloudPathThird: UIBezierPath {
        let cloudPath = UIBezierPath()
        cloudPath.append(cloudPathSecond)
        cloudPath.append(circlePathThird)
        return cloudPath
    }

    var cloudPathFull: UIBezierPath {
        let cloudPath = UIBezierPath()
        cloudPath.append(circlePathFirst)
        cloudPath.append(circlePathSecond)
        cloudPath.append(circlePathThird)
        cloudPath.append(circlePathFourth)
        cloudPath.append(circlePathFifth)
        return cloudPath
    }

    func animate() {
        
        let cloudAnimationFirst: CABasicAnimation = CABasicAnimation(keyPath: "path")
        cloudAnimationFirst.fromValue = circlePathSmall.cgPath
        cloudAnimationFirst.toValue = circlePathFirst.cgPath
        cloudAnimationFirst.beginTime = 0.0
        cloudAnimationFirst.duration = 0.15
        
        let cloudAnimationSecond: CABasicAnimation = CABasicAnimation(keyPath: "path")
        cloudAnimationSecond.fromValue = cloudPathFirst.cgPath
        cloudAnimationSecond.toValue = cloudPathSecond.cgPath
        cloudAnimationSecond.beginTime = cloudAnimationFirst.beginTime + cloudAnimationFirst.duration
        cloudAnimationSecond.duration = 0.15

        let cloudAnimationThird: CABasicAnimation = CABasicAnimation(keyPath: "path")
        cloudAnimationThird.fromValue = cloudPathSecond.cgPath
        cloudAnimationThird.toValue = cloudPathThird.cgPath
        cloudAnimationThird.beginTime = cloudAnimationSecond.beginTime + cloudAnimationSecond.duration
        cloudAnimationThird.duration = 0.15

        let cloudAnimationFourth: CABasicAnimation = CABasicAnimation(keyPath: "path")
        cloudAnimationFourth.fromValue = cloudPathThird.cgPath
        cloudAnimationFourth.toValue = cloudPathFull.cgPath
        cloudAnimationFourth.beginTime = cloudAnimationThird.beginTime + cloudAnimationThird.duration
        cloudAnimationFourth.duration = 0.15

        let cloudAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        cloudAnimationGroup.animations = [cloudAnimationFirst, cloudAnimationSecond, cloudAnimationThird, cloudAnimationFourth]
        cloudAnimationGroup.duration = cloudAnimationFourth.beginTime + cloudAnimationFourth.duration
        cloudAnimationGroup.fillMode = kCAFillModeForwards
        cloudAnimationGroup.isRemovedOnCompletion = false
        add(cloudAnimationGroup, forKey: nil)
        
    }

}
