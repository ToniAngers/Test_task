//
//  IncomingViewController.swift
//  Test_task
//
//  Created by Anton Voropaev on 02.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

class IncomingViewController: UIViewController {
    
    var mainLable:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        
        configureView()
        setupLayout()

    }
    
    func configureView() {
        mainLable = UILabel()
        mainLable.textColor = UIColor.gray
        mainLable.font = FONT_VC_46
        mainLable.text = "Incoming VC"
        mainLable.textAlignment = .center
        mainLable.numberOfLines = 0
        mainLable.sizeToFit()
        mainLable.backgroundColor = UIColor.clear
        self.view.addSubview(mainLable)
    }

    func setupLayout() {
    
        mainLable.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
