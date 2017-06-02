//
//  MainNavigatoinBarView.swift
//  Test_task
//
//  Created by Anton Voropaev on 01.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

class MainNavigatoinBarView: UIView {
    
    private var accountBalanceLable:UILabel!
    private var mainBalanceLable:UILabel!
    
    init(withNavBar navbar: UINavigationBar) {
        super.init(frame: CGRect(x:0, y: 30, width: UIScreen.main.bounds.width, height: navbar.bounds.height*2))
        self.backgroundColor = UIColor.white
        configureView()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    
    func configureView() {
        mainBalanceLable = UILabel()
        mainBalanceLable.textColor = UIColor.black
        mainBalanceLable.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 30)
        mainBalanceLable.text = "15.202,45 $"
        mainBalanceLable.textAlignment = .center
        mainBalanceLable.backgroundColor = UIColor.clear
        self.addSubview(mainBalanceLable)
        
        accountBalanceLable = UILabel()
        accountBalanceLable.textColor = UIColor.black
        accountBalanceLable.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        accountBalanceLable.text = "Account balance"
        accountBalanceLable.textAlignment = .center
        accountBalanceLable.backgroundColor = UIColor.clear
        self.addSubview(accountBalanceLable)
    }
    
    func configureLayout() {
       mainBalanceLable.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(30)
        make.right.equalToSuperview().offset(-30)
        make.top.equalToSuperview()
        make.bottom.equalTo(accountBalanceLable.snp.top)

        }
        
       accountBalanceLable.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(30)
        make.right.equalToSuperview().offset(-30)
        make.top.equalTo(mainBalanceLable.snp.bottom)
        make.bottom.equalToSuperview().offset(-30)
            
        }
        
    }
    


}
