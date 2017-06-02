//
//  MainTableViewCell.swift
//  Test_task
//
//  Created by Anton Voropaev on 02.06.17.
//  Copyright © 2017 Anton Voropaev. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.backgroundColor = UIColor(red: 242/255, green: 246/255, blue: 247/255, alpha: 1.0)
        
         configureViewElements()
         configureLayouts()
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureViewElements() {
        mainView = UIView()
        mainView.layer.cornerRadius = 5;
        mainView.layer.masksToBounds = true;
        self.mainView.backgroundColor = UIColor.white
        self.contentView.backgroundColor = UIColor(red: 242/255, green: 246/255, blue: 247/255, alpha: 1.0)
        self.mainView.isUserInteractionEnabled = false
        self.mainView.layer.masksToBounds = false
        self.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.mainView.layer.shadowRadius = 1
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowColor = UIColor.black.cgColor
        
        self.addSubview(mainView)
    }
    
    
    func configureLayouts() {
        mainView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
