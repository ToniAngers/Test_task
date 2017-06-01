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

    
    init(withNavBar navbar: UINavigationBar) {
        super.init(frame: CGRect(x:0, y: 0, width: UIScreen.main.bounds.width, height: navbar.bounds.height))
        self.backgroundColor = UIColor.yellow
        configureView()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    
    func configureView() {
        
        
    }
    
    func configureLayout() {
       
        
    }
    


}
