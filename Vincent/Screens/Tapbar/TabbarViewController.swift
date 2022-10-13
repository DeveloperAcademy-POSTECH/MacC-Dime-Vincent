//
//  TabbarViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    private let sellViewController = UINavigationController(rootViewController: SellViewController())
    private let messageViewController = UINavigationController(rootViewController: MessageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController.tabBarItem.image = ImageLiteral.btnHome
        homeViewController.tabBarItem.title = "홈"
        
        sellViewController.tabBarItem.image = ImageLiteral.btnEnroll
        sellViewController.tabBarItem.title = "등록"
        
        messageViewController.tabBarItem.image = ImageLiteral.btnProfile
        messageViewController.tabBarItem.title = "메세지"
        
        tabBar.tintColor = .mainYellow
        tabBar.backgroundColor = .white
        setViewControllers([homeViewController, sellViewController, messageViewController], animated: true)
    }
}
