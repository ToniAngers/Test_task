//
//  SubNavBarView.swift
//  Test_task
//
//  Created by Anton Voropaev on 01.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit


enum indicatorPosition {
    case first
    case center
    case right
}

class SubNavBarView: UIView {
        
    //Buttons
    var leftButton: UIButton!
    var centerButton: UIButton!
    var rightButton: UIButton!
    
    var indicator:UIView!
    
    var indicatorPositionX: Constraint?
    var lastContentOffset: CGFloat = 0
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        self.backgroundColor = UIColor.white
        configureView()
        configureLayout()
    }
    
    func configureView() {
        
        creatingAnIndicator()
        
        leftButton = UIButton()
        leftButton.setTitle("Net cash flow", for: .normal)
        leftButton.setTitleColor(UIColor.black, for: .normal)
        leftButton.titleLabel!.font =  UIFont(name: "Copperplate-Light", size: 16)
        leftButton.tag = 0
        leftButton.addTarget(self, action: #selector(titleButtonPressed(sender:)), for: .touchUpInside)
        
        
        centerButton = UIButton()
        centerButton.setTitle("   Incoming", for: .normal)
        centerButton.setTitleColor(UIColor.black, for: .normal)
        centerButton.titleLabel?.textAlignment = .center
        centerButton.titleLabel!.font =  UIFont(name: "Copperplate-Light", size: 16)
        centerButton.tag = 1
        centerButton.addTarget(self, action: #selector(titleButtonPressed(sender:)), for: .touchUpInside)


        
        rightButton = UIButton()
        rightButton.setTitle("Outgoing", for: .normal)
        rightButton.setTitleColor(UIColor.black, for: .normal)
        rightButton.titleLabel!.font =  UIFont(name: "Copperplate-Light", size: 16)
        rightButton.tag = 2
        rightButton.addTarget(self, action: #selector(titleButtonPressed(sender:)), for: .touchUpInside)


        self.addSubview(leftButton)
        self.addSubview(centerButton)
        self.addSubview(rightButton)
    }
    
    
    
    
    func configureLayout() {
        
        indicator.snp.makeConstraints { (make) in
            indicatorPositionX = make.centerX.equalTo(leftButton.snp.centerX).constraint
            make.width.equalTo(50)
            make.height.equalTo(2)
            make.bottom.equalTo(self).offset(1)
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(5)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
           
        }
        
        centerButton.snp.makeConstraints { (make) in
                make.top.equalTo(self)
                make.centerX.equalTo(self)
                make.left.equalTo(leftButton.snp.right)
                make.right.equalTo(rightButton.snp.left)
                make.bottom.equalTo(self)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-5)
            make.top.equalTo(self)
            make.bottom.equalTo(self)

        }
    
    }
    
//MARK: Actions
    func titleButtonPressed(sender: UIButton) {
        print("Button \(sender.tag)")
        
        switch sender.tag {
        case 0:
            highlightText(sender: sender)
            moveIndicatorTo(button:sender)
        case 1:
            highlightText(sender: sender)
            moveIndicatorTo(button:sender)
        case 2:
            highlightText(sender: sender)
            moveIndicatorTo(button:sender)
            
        default:
            break
        }
    }
 //MARK: help func
    
    func creatingAnIndicator() {
        indicator = UIView()
        indicator.layer.cornerRadius = 1
        indicator.layer.masksToBounds = true
        indicator.backgroundColor = UIColor.black
        self.addSubview(indicator)
    }
    
    func highlightText(sender: UIButton) {
        for button in self.subviews {
            if button.isKind(of: UIButton.self) {
                let b = button as! UIButton
                b.titleLabel?.font = UIFont(name: "Copperplate-Light", size: 16)
            }
        }
        sender.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 16)
    }
    
    func moveIndicatorTo(button: UIButton) {
        let newPoint = button.center.x
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
           self.indicator.center.x = newPoint
            
        }, completion:{ finished  in
            print("df")
            
        })
        
       
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}




