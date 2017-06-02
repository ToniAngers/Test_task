//
//  OutgoingViewController.swift
//  Test_task
//
//  Created by Anton Voropaev on 02.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit

class OutgoingViewController: UIViewController {

    var mainLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setupLayout()
        
    }
    
    
    
    func configureView() {
        
        self.view.backgroundColor = UIColor.orange
        mainLable = UILabel()
        mainLable.textColor = UIColor.gray
        mainLable.font = FONT_VC_46
        mainLable.text = "Outgoing VC"
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
        // Dispose of any resources that can be recreated.
    }
}
