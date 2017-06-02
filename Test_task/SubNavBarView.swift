//
//  SubNavBarView.swift
//  Test_task
//
//  Created by Anton Voropaev on 01.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

protocol PageButtonProtocol {
    
    func subNavBarView(_ subNavBar: SubNavBarView, didSelectButton: NSInteger)
}


class SubNavBarView: UIView {
    
    var delegate: PageButtonProtocol?
    
    //Buttons
    var leftButton: UIButton!
    var centerButton: UIButton!
    var rightButton: UIButton!
    
    var selectedButton = UIButton()
    
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
        centerButton.setTitle("Incoming", for: .normal)
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
            make.width.equalTo(35)
            make.height.equalTo(2)
            make.bottom.equalTo(self)
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(centerButton.snp.width)
           
        }
        
        centerButton.snp.makeConstraints { (make) in
                make.top.equalTo(self)
//                make.centerX.equalTo(self)
                make.left.equalTo(leftButton.snp.right).offset(5)
                make.right.equalTo(rightButton.snp.left)
                make.bottom.equalTo(self)
            make.width.equalTo(leftButton.snp.width)

        }
        
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(10)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(centerButton.snp.width)

        }
    }
    
//MARK: Actions
    func titleButtonPressed(sender: UIButton) {
        moveIndicatorTo(button:sender)
        self.delegate?.subNavBarView(self, didSelectButton: sender.tag)
    }

    
    func moveIndicatorTo(button: UIButton) {
        let newPoint = button.center.x
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.indicator.center.x = newPoint
        }, completion:{ finished  in
            
        })
        
    }
 //MARK: help func
    
    func creatingAnIndicator() {
        indicator = UIView()
        indicator.layer.cornerRadius = 1
        indicator.layer.masksToBounds = true
        indicator.backgroundColor = UIColor.black
        self.addSubview(indicator)
    }
    
    func highlightItem(at index: NSInteger) {
        
        for v in self.subviews {
            if v.isKind(of: UIButton.self) {
                let button = v as! UIButton
                    button.titleLabel?.font = UIFont(name: "Copperplate-Light", size: 16)
                if button.tag == index {
                    button.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 16)
                }
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}




