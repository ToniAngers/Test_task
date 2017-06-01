//
//  SubNavBarView.swift
//  Test_task
//
//  Created by Anton Voropaev on 01.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

class SubNavBarView: UIView {
        
    //Buttons
    var leftButton: UIButton!
    var centerButton: UIButton!
    var rightButton: UIButton!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        self.backgroundColor = UIColor.white
        configureView()
        configureLayout()
    }
    
    func configureView() {
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
    
    func titleButtonPressed(sender: UIButton) {
        print("Button \(sender.tag)")
    }
    
    func configureLayout() {
        
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
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}




