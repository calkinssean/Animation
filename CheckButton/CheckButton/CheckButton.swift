//
//  CheckButton.swift
//  CheckButton
//
//  Created by Sean Calkins on 2/1/18.
//  Copyright © 2018 Sean Calkins. All rights reserved.
//

import UIKit

class CheckButton: UIButton {
 
    private var parentRect = CGRect.zero
    private var checkLayer: CAShapeLayer?
    private var xLayer: CAShapeLayer?
    private var frameWidth = CGFloat()
    private var frameHeight = CGFloat()
    private var lineWidth = CGFloat()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = frame.width / 2
        frameWidth = frame.width
        frameHeight = frame.height
        lineWidth = min(frameHeight, frameHeight) / 10
        tintColor = .clear
        addXLayer()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                addCheckLayer()
            } else {
                addXLayer()
            }
        }
    }
    
    private func addCheckLayer() {
        if xLayer != nil {
            xLayer!.removeFromSuperlayer()
            xLayer = nil
        }
        let newLayer = createCheckLayer()
        checkLayer = newLayer
        layer.addSublayer(newLayer)
        animateStroke(layer: newLayer)
    }
    
    private func addXLayer() {
        if checkLayer != nil {
            checkLayer!.removeFromSuperlayer()
            checkLayer = nil
        }
        let newLayer = createXLayer()
        xLayer = newLayer
        layer.addSublayer(newLayer)
        animateStroke(layer: newLayer)
    }
    
    private func checkPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frameWidth * 0.15, y: frameHeight * 0.55))
        path.addLine(to: CGPoint(x: frameWidth * 0.4, y: frameHeight * 0.8))
        path.addLine(to: CGPoint(x: frameWidth * 0.75, y: frameHeight * 0.25))
        return path
    }
    
    private func xPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frameWidth * 0.25, y: frameHeight * 0.25))
        path.addLine(to: CGPoint(x: frameWidth - (frameWidth * 0.25), y: frameHeight - frameHeight * 0.25))
        path.move(to: CGPoint(x: frameWidth - (frameWidth * 0.25), y: frameHeight * 0.25))
        path.addLine(to: CGPoint(x: frameWidth * 0.25, y: frameHeight - (frameHeight * 0.25)))
        return path
    }
    
    private func createCheckLayer() -> CAShapeLayer {
        let checkLayer = CAShapeLayer()
        checkLayer.fillColor = UIColor.clear.cgColor
        checkLayer.strokeColor = UIColor.green.cgColor
        checkLayer.path = checkPath().cgPath
        checkLayer.lineWidth = lineWidth
        checkLayer.lineCap = kCALineCapRound
        checkLayer.lineJoin = kCALineJoinRound
        checkLayer.frame = (CGRect(x: 0.0, y: 0.0, width: frameWidth, height: frameHeight))
        return checkLayer
        // set frame
    }
    
    private func createXLayer() -> CAShapeLayer {
        let xLayer = CAShapeLayer()
        xLayer.fillColor = UIColor.clear.cgColor
        xLayer.strokeColor = UIColor.red.cgColor
        xLayer.path = xPath().cgPath
        xLayer.lineWidth = lineWidth
        xLayer.lineCap = kCALineCapRound
        xLayer.lineJoin = kCALineJoinRound
        return xLayer
        // set frame
    }
    
    private func animateStroke(layer: CAShapeLayer) {
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.3
        layer.add(strokeAnimation, forKey: nil)
    }
    
}
