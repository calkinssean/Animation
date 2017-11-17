//
//  HolderView.swift
//  animatedLoadingScreenPractice
//
//  Created by Sean Calkins on 11/16/17.
//  Copyright © 2017 Sean Calkins. All rights reserved.
//

import UIKit

protocol HolderViewDelegate: class {
    func animateLabel()
}

class HolderView: UIView {
    
    var parentFrame: CGRect = CGRect.zero
    weak var delegate:HolderViewDelegate?
    
    let hexagonLayer = HexagonLayer()
    let cloudLayer = CloudLayer()
    let mountainLayer = MountainLayer()
    
    func addHexagon() {
        layer.addSublayer(hexagonLayer)
        hexagonLayer.animateStrokeWithColor(color: UIColor.black)
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(addMountainLayer), userInfo: nil, repeats: false)
    }
    
    @objc func addMountainLayer() {
        layer.addSublayer(mountainLayer)
        mountainLayer.grow()
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(addCloudLayer), userInfo: nil, repeats: false)
    }
    
    @objc func addCloudLayer() {
        layer.addSublayer(cloudLayer)
        cloudLayer.animate()
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(addLabel), userInfo: nil, repeats: false)
    }
    
    @objc func addLabel() {
        delegate?.animateLabel()
    }
   
}
