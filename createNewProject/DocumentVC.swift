//
//  DocumentVC.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class DocumentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let nav2 = UINavigationItem()
    
    
    @IBOutlet var collectionVU2: UICollectionView!
    var imagesArr = [String]()
    var imagesDataArr1 = [String]()
    var imagesDataArr2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Document"
        imagesArr = ["Ac.jpg","foodProcessor.jpg","hardisk.jpg","iron.jpg","kettle.jpg","lappy.jpg","microwave.jpg","refrigerator.jpg","safe.jpg","swing.jpg","tv.jpg","vaccume.jpg","wasingmachine.jpg","waterpurifier.jpg","woofer.jpg" ]
        
        imagesDataArr1 = ["LG AC 1.5 ton","Samsung foodProcessor","WD hardisk 1TB","Morphy Richard Iron","USHA Electric Kettle","Dell i7","LG Microwave 14Ltr","Samsung Refrigerator 18Ltr","Godrej Safe","USHA Swing","Sansui TV","Bajaj Vaccume Cleaner","Samsung Washing Machine","Kent Water Purifier","iBall Woofer"]
        
        imagesDataArr2 = ["Item Price: $500.00","Item Price: $70.00","Item Price: $35.00","Item Price: $15.00","Item Price: $25.00","Item Price: $800.00","Item Price: $400.00","Item Price: $300.00","Item Price: $120.00","Item Price: $800.00","Item Price: $350.00","Item Price: $450.00","Item Price: $15.00","Item Price: $15.00","Item Price: $25.00"]
        
       self.collectionVU2.delegate = self
      self.collectionVU2.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocumentCell", for: indexPath) as! DocumentCell
        cell.imageItem.image = UIImage(named:imagesArr [indexPath.row])
        cell.titleLabel.text = imagesDataArr1[indexPath.row]
        cell.descLabel.text = imagesDataArr2[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return cell
        
    }
}
