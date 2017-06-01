//
//  ViewController.swift
//  Test_task
//
//  Created by Anton Voropaev on 01.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

let navBarHeight:CGFloat = 60;

class ViewController: UIViewController {
    
    var subNavigationView:SubNavBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        configureView()
    }
    
    
    func configureView() {
        let subView = SubNavBarView()
        subView.frame = CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 60)
        self.view.addSubview(subView)
        removeSeparateView()
        addViewToNavigationBar()
        
    }
    
    func addViewToNavigationBar () {
        let navBar = navigationController?.navigationBar
        let balanceView = MainNavigatoinBarView(withNavBar:navBar!)
        navigationItem.titleView = balanceView
        
    }
    
    func removeSeparateView() {
        
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.clipsToBounds = false
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + navBarHeight)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

