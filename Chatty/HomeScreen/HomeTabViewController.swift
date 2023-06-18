//
//  HomeTabViewController.swift
//  Chatty
//
//  Created by Dheeraj Jha on 18/06/23.
//

import UIKit
import ESTabBarController

class HomeTabViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
        
        
    func setupTabs() {
        let tabBarController = ESTabBarController()
        let v1 = HomeViewController()
        let v2 = UIViewController()
        let v3 = UIViewController()
        let v4 = UIViewController()
        let v5 = UIViewController()
        v1.tabBarItem = ESTabBarItem.init(HomeBounceContentTabItem(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(HomeBounceContentTabItem(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(HomeBounceContentTabItem(), title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = ESTabBarItem.init(HomeBounceContentTabItem(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(HomeBounceContentTabItem(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        tabBarController.title = "Example"
        
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
    }
}
