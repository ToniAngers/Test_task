//
//  HeaderView.swift
//  Test_task
//
//  Created by Anton Voropaev on 02.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    var headerLeftText: String!
    var headerRightText: String!
    
    var headerLeftLable:UILabel!
    var headerRightLable:UILabel!
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        self.backgroundColor = UIColor(red: 242/255, green: 246/255, blue: 247/255, alpha: 1.0)
        configureView()
        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        headerLeftLable = UILabel()
        headerLeftLable.textColor = UIColor.gray
        headerLeftLable.font = UIFont(name: "OriyaSangamMN-Bold", size: 15)
        headerLeftLable.contentMode = .bottomLeft
        headerLeftLable.text = "Today"
        headerLeftLable.backgroundColor = UIColor.clear
        self.addSubview(headerLeftLable)
        
        headerRightLable = UILabel()
        headerRightLable.textColor = UIColor.gray
        headerRightLable.font = UIFont(name: "OriyaSangamMN-Bold", size: 15)
        headerRightLable.contentMode = .bottomLeft
        headerRightLable.text = "+ 123.56"
        headerRightLable.backgroundColor = UIColor.clear
        self.addSubview(headerRightLable)
        
        
    }
    
    func setupLayout() {
        headerLeftLable.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(5)
        }
        
        headerRightLable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(5)
        }
    }
}
