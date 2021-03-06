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
    
    private var mainView: UIView!
    private var numberLable: UILabel!
    private var nameLable: UILabel!
    private var balanceLable: UILabel!
    private var disclousureButton:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.backgroundColor = BG_COLOR
         self.selectionStyle = .none
         configureViewElements()
         configureLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewElements() {
        //setup coverView
        mainView = UIView()
        mainView.layer.cornerRadius = 5;
        mainView.layer.masksToBounds = true;
        self.mainView.backgroundColor = UIColor.white
        self.mainView.isUserInteractionEnabled = false
        //add shadow
        self.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.mainView.layer.shadowRadius = 1
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowColor = UIColor.black.cgColor
        
        //setup lables
        numberLable = UILabel()
        numberLable.textColor = UIColor.black
        numberLable.font = FONT_CELL_BOLD_13
        numberLable.contentMode = .bottomLeft
        numberLable.text = "#3042453"
        numberLable.backgroundColor = UIColor.clear
        
        nameLable = UILabel()
        nameLable.textColor = UIColor.black
        nameLable.font = FONT_CELL_LIGHT_13
        nameLable.contentMode = .bottomLeft
        nameLable.text = "Jeudan A/S"
        nameLable.backgroundColor = UIColor.clear
        
        balanceLable = UILabel()
        balanceLable.textColor = TEXT_GREEN_COLOR
        balanceLable.font = FONT_CELL_BOLD_13
        balanceLable.contentMode = .bottomLeft
        balanceLable.text = "+546$"
        balanceLable.backgroundColor = UIColor.clear
        
        disclousureButton = UIButton()
        let arrowImage = UIImage(named: "Arrow.png")
        disclousureButton.setImage(arrowImage, for: .normal)
        disclousureButton.addTarget(self, action: #selector(disclousureButtonPressed), for: .touchUpInside)
        
        self.addSubview(mainView)
        self.addSubview(numberLable)
        self.addSubview(nameLable)
        self.addSubview(balanceLable)
        self.addSubview(disclousureButton)
    }
    
    func configureLayouts() {
        
        mainView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-5)
        }
        numberLable.snp.makeConstraints { (make) in
            make.left.equalTo(mainView).offset(10)
            make.top.equalTo(mainView).offset(5)
            make.bottom.equalTo(nameLable.snp.top)
        }
        nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(mainView).offset(10)
            make.top.equalTo(numberLable.snp.bottom)
            make.bottom.equalTo(mainView).offset(-5)
        }
        balanceLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(numberLable.snp.centerY)
            make.right.equalTo(disclousureButton.snp.left).offset(-10)
      }
        
        disclousureButton.snp.makeConstraints { (make) in
            make.right.equalTo(mainView).offset(-15)
            make.centerY.equalTo(balanceLable.snp.centerY)
            make.height.equalTo(10)
            make.width.equalTo(5)
        }
    }
    
//MARK: Actions
    
    func disclousureButtonPressed() {
        print("Diclousure pressed!")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
