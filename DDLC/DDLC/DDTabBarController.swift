//
//  DDTabBarController.swift
//  DDLC
//
//  Created by ... on 2019/3/25.
//  Copyright © 2019 .... All rights reserved.
//

import UIKit

private let DDTabBarHeight: CGFloat = 49
private let DDTabBarLabelTag: Int = 100
private let DDTabBarButtonTag: Int = 999

class DDTabBarController: UITabBarController {

    private let defaultIcons = ["tab_home", "tab_me"]
    private let selectIcons = ["tab_homeH", "tab_meH"]
    private let itemTitles = ["首页", "我的"]
    private let defaultItemColor: UIColor = UIColor.colorHexStr("999999")
    private let selectItemColor: UIColor = UIColor.colorHexStr("111111")
    
    private var itemButtons = [UIButton]()
    
    var homeVC: DDHomeViewController!
    var meVC: DDMeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tabBarView)
        self.tabBar.isHidden = true
        // items按钮配置
        configureItemButtons()
    }
    
    private lazy var tabBarView: UIView = {
        let tabBarView = UIView(frame: CGRect(x: -1, y: (self.view.frame.height - DDTabBarHeight), width: self.view.frame.width + 2, height: DDTabBarHeight + 1))
        tabBarView.layer.masksToBounds = true
        tabBarView.layer.shadowColor = UIColor.lightGray.cgColor
        tabBarView.layer.shadowRadius = 3
        tabBarView.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBarView.layer.shadowOpacity = 0.5
        tabBarView.backgroundColor = .white
        return tabBarView
    }()
    
    private func configureItemButtons() {
        // 控制器
        homeVC = DDHomeViewController()
        meVC = DDMeViewController()
        self.viewControllers = [homeVC, meVC]
        
        let buttonWidth = self.view.frame.width / CGFloat(itemTitles.count)
        for i in 0..<itemTitles.count {
            let defaultIcon = defaultIcons[i]
            let selectIcon = selectIcons[i]
            
            let itemButton = UIButton(type: .custom)
            let edgeInsets = (buttonWidth - 24) / 2;
            itemButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: edgeInsets, bottom: 20, right: edgeInsets)
            itemButton.tag = DDTabBarButtonTag + i
            itemButton.frame = CGRect(x: CGFloat(i) * buttonWidth, y: 0, width: buttonWidth, height: DDTabBarHeight)
            itemButton.setImage(UIImage(named: defaultIcon), for: .normal)
            itemButton.setImage(UIImage(named: selectIcon), for: .selected)
            itemButton.addTarget(self, action: #selector(itemButtonAction), for: .touchUpInside)
            
            let itemLabel = UILabel(frame: CGRect(x: 0, y: (DDTabBarHeight - 20), width: buttonWidth, height: 20))
            itemLabel.textAlignment = .center
            itemLabel.font = UIFont.systemFont(ofSize: 12.0)
            itemLabel.tag = DDTabBarLabelTag
            itemLabel.text = itemTitles[i]
            itemLabel.textColor = defaultItemColor
            
            itemButton.addSubview(itemLabel)
            tabBarView.addSubview(itemButton)
            if i == 0 {
                itemLabel.textColor = selectItemColor
                itemButton.isSelected = true
            }
            itemButtons.append(itemButton)
        }
    }
    
    // MARK: ButtonAction
    @objc private func itemButtonAction(_ itemButton: UIButton) {
        if itemButton.isSelected {
            return
        }
        let index: Int = itemButton.tag - DDTabBarButtonTag
        self.selectedIndex = index
        for item in itemButtons {
            let selectStatus = item === itemButton
            item.isSelected = selectStatus
            let itemLabel: UILabel = item.viewWithTag(DDTabBarLabelTag) as! UILabel
            itemLabel.textColor = selectStatus ? selectItemColor : defaultItemColor
        }
    }
    
    
    /// Select Controller
    ///
    /// - Parameter index: index
    func tabBarTurnController(index: Int) {
        guard index < itemButtons.count else {
            return
        }
        itemButtonAction(itemButtons[index])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
