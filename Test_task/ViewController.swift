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

class ViewController:   UIViewController,
                        UICollectionViewDelegateFlowLayout,
                        UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        PageButtonProtocol { //handling button pressed under navBar
    
    lazy var collection: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height-120)
        
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
    
    var controllersStack : [UIViewController]? //Content Controllers
    var subNavigationView:SubNavBarView!
    
    
//MARK: VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainTableViewController()
        let incomingVC = IncomingViewController()
        let outgoingVC = OutgoingViewController()
        
        controllersStack = [mainVC, incomingVC, outgoingVC]
        
        self.view.backgroundColor = UIColor.gray
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        
        configureView()
        collection.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + navBarHeight)
    }

//MARK: Base setup
    
    func configureView() {
        
        subNavigationView = SubNavBarView()
        subNavigationView.delegate = self
        subNavigationView.frame = CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 40)
        self.view.addSubview(subNavigationView)
        
        removeSeparateView()
        addViewToNavigationBar()
    }
    
    func addViewToNavigationBar () {
        
        let navBar = navigationController?.navigationBar
        let balanceView = MainNavigatoinBarView(withNavBar:navBar!)
        navBar?.addSubview(balanceView)
    }
    
    func removeSeparateView() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.clipsToBounds = false
    }

    
//MARK: Collection delegate&datasource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.controllersStack == nil {
            return 0
        }
        return self.controllersStack!.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let subArray = cell.subviews
        
        for item in subArray {
            item.removeFromSuperview()
        }
        
        let VC = self.controllersStack![indexPath.row]
        let currentView = VC.view
        addChildViewController(VC)
        cell.addSubview(currentView!)
        
        currentView?.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(cell)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let offsetX = collectionView.contentOffset.x
        let width = collectionView.bounds.width
        let page = Int(offsetX/width)

        print("FINISHED!!! page \(page)")
        self.subNavigationView.highlightItem(at: page)
    }
    

    
//MARK: PageButtonProtocol
    
    func subNavBarView(_ subNavBar: SubNavBarView, didSelectButton: NSInteger) {
        
        let path = NSIndexPath(item: didSelectButton, section: 0)
        collection.scrollToItem(at: path as IndexPath, at: .centeredHorizontally, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

