//
//  TabControl.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class TabControl: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        
            self.setAllTheData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
 
    }
    func setAllTheData()
    {
        let homevc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! Home
        let home = UINavigationController(rootViewController: homevc)
        home.tabBarItem.image = UIImage(named :"home")
        home.tabBarItem.selectedImage = UIImage(named :"home")
        home.tabBarItem.title = "Home"
        
        
        
        let documentvc = self.storyboard?.instantiateViewController(withIdentifier: "DocumentVC") as! DocumentVC
        let document = UINavigationController(rootViewController: documentvc)
        document.tabBarItem.image = UIImage(named :"document")
        document.tabBarItem.selectedImage = UIImage(named :"document")
        document.tabBarItem.title = "Document"
        
        
        
        let accountvc = self.storyboard?.instantiateViewController(withIdentifier: "Account") as! Account
        let account = UINavigationController(rootViewController: accountvc)
        account.tabBarItem.image = UIImage(named :"account")
        account.tabBarItem.selectedImage = UIImage(named :"account")
        account.tabBarItem.title = "Account"
       
        
        
        
        let morevc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC

        let more = UINavigationController(rootViewController: morevc)
        more.tabBarItem.image = UIImage(named :"more")
        more.tabBarItem.selectedImage = UIImage(named :"more")
        more.tabBarItem.title = "More"
        
        
        
        viewControllers = [home,document,account,more]
       
    }
    
}
