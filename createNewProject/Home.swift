//
//  Home.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit
var timer: Timer!

class Home: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   //var arrayOfWriterData = [shopping]()
    @IBOutlet var newBtn: UIButton!
    @IBOutlet var clearanceBtn: UIButton!
    @IBOutlet var bestSellerBtn: UIButton!
    @IBOutlet var collectionVU: UICollectionView!
    @IBOutlet var HomePromoView: UIView!
    @IBOutlet var imageVw: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    var imagesArr = [String]()
    var imagesDataArr1 = [String]()
    var imagesDataArr2 = [String]()
    
    
    var updateCount : Int!
    let nav = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArr = ["Ac.jpg","foodProcessor.jpg","hardisk.jpg","iron.jpg","kettle.jpg","lappy.jpg","microwave.jpg","refrigerator.jpg","safe.jpg","swing.jpg","tv.jpg","vaccume.jpg","wasingmachine.jpg","waterpurifier.jpg","woofer.jpg" ]

        imagesDataArr1 = ["LG AC 1.5 ton","Samsung foodProcessor","WD hardisk 1TB","Morphy Richard Iron","USHA Electric Kettle","Dell i7","LG Microwave 14Ltr","Samsung Refrigerator 18Ltr","Godrej Safe","USHA Swing","Sansui TV","Bajaj Vaccume Cleaner","Samsung Washing Machine","Kent Water Purifier","iBall Woofer"]
        
        imagesDataArr2 = ["Item Price: $500.00","Item Price: $70.00","Item Price: $35.00","Item Price: $15.00","Item Price: $25.00","Item Price: $800.00","Item Price: $400.00","Item Price: $300.00","Item Price: $120.00","Item Price: $800.00","Item Price: $350.00","Item Price: $450.00","Item Price: $15.00","Item Price: $15.00","Item Price: $25.00"]
        navigationItem.title = "Home"
       updateCount = 0
        
        self.bestSellerBtn.layer.borderWidth = 1
        self.bestSellerBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.newBtn.layer.borderWidth = 1
        self.newBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.clearanceBtn.layer.borderWidth = 1
        self.clearanceBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.HomePromoView.layer.borderWidth = 2
        self.HomePromoView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.collectionVU.delegate = self
        self.collectionVU.dataSource = self
        configurePageControl()
        
       // let barBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(pressed))
        let barBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(pressed))
        self.navigationItem.setLeftBarButton(barBtn, animated: true)
       
       
    }

    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Home.updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @objc internal func updateTimer() {
        if (updateCount <= 2){
            pageControl.currentPage = updateCount
            updateCount = updateCount + 1
            let imageName = "slider" + "\(updateCount!)" + ".jpg"
            print(imageName)
            imageVw.image = UIImage(named:imageName)
        }else{
            updateCount = 0
        }
    }
    
    
    
    func configurePageControl() {
        pageControl.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.0703939572, green: 0.4434091449, blue: 0.8109118938, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as! HomeCollectionCell
        cell.collectionImage.image = UIImage(named:imagesArr [indexPath.row])
        cell.collectionText1.text = imagesDataArr1[indexPath.row]
        cell.collectionText2.text = imagesDataArr2[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
    
    }

    @IBAction func SeeAllBtn(_ sender: Any) {
        let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = myTabBar
    
    }
    
    @IBAction func seeAllPromos(_ sender: Any) {
        let alert = UIAlertController(title: "Promocode", message: "RU123T", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    @objc func pressed() {
        print("Pressed")
//
//
//        let logout = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let navVC = UINavigationController(rootViewController: redViewController)
//
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navVC
//         let navController = UINavigationController(rootViewController: logout)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = navController
        appDelegate.window?.makeKeyAndVisible()
////        UserDefaults.standard.set(false, forKey: "chara")
//
//                if UserDefaults.standard.bool(forKey: "ISUSERLOGGED") == true {
//                    let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                    self.navigationController?.pushViewController(HomeVc, animated: false)
//        
//                }
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGED")
//        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
