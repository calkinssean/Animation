//
//  ViewController.swift
//  animatedLoadingScreenPractice
//
//  Created by Sean Calkins on 11/16/17.
//  Copyright © 2017 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {

    var holderView = HolderView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHolderView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        view.addSubview(holderView)
        holderView.addHexagon()
        holderView.delegate = self
        
    }
    
    func animateLabel() {
        
        let labelSize: CGFloat = 200.0
        
        let label: UILabel = UILabel(frame: view.frame)
        label.frame = CGRect(x: view.bounds.width / 2 - labelSize / 2,
                             y: (view.bounds.height / 2 - labelSize / 2) + 35,
                             width: labelSize,
                             height: labelSize)
        label.textColor = UIColor.black
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 25.0)
        label.textAlignment = NSTextAlignment.center
        label.text = "CLOUDVEIL"
        label.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        view.addSubview(label)
        
        // 3
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [],
                       animations: ({
                        label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        
                       }), completion: { finished in
                        self.addButton()
        })
    }
    
    func addButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: view.bounds.height)
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        view.subviews.map({ $0.removeFromSuperview() })
        holderView = HolderView(frame: CGRect.zero)
        addHolderView()
    }


}

