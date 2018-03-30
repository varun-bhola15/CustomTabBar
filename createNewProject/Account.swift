//
//  Account.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class Account: UIViewController {
    
    @IBOutlet var animationLabel4: UILabel!
    @IBOutlet var viewCircle: UIView!
    @IBOutlet var availableAmountLbl: UILabel!
    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var currentAmountLbl: UILabel!
    @IBOutlet var totalAmountLbl: UILabel!
    @IBOutlet var purchasesRemaininglbl: UILabel!
    @IBOutlet var avialableSpendinglbl: UILabel!
    @IBOutlet var currentBalanceLbl: UILabel!
    @IBOutlet var totalLimitLbl: UILabel!
    @IBOutlet var stackInName: UIStackView!
    @IBOutlet var stackNumber: UIStackView!
    @IBOutlet var downloadPercentage: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var viewAccount: UIButton!
    
    let nav3 = UINavigationItem()
    let shapeLayer = CAShapeLayer()
    var minValue = 0
    var maxValue = 5
    var downloader = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        startBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        viewAccount.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        totalLimitLbl.font = UIFont.boldSystemFont(ofSize: 17)
        purchasesRemaininglbl.font = UIFont.boldSystemFont(ofSize: 22)
        totalAmountLbl.font = UIFont.boldSystemFont(ofSize: 17)
        self.viewCircle.layer.borderWidth = 2
        self.viewCircle.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        let rightTrackImage = UIImage(named: "track")
        sliderOutlet.setMaximumTrackImage(rightTrackImage, for: .normal)
        let leftTrackImage = UIImage(named: "trackCover")
        sliderOutlet.setMinimumTrackImage(leftTrackImage, for: .normal)
        
        
        
        DispatchQueue.main.async {
        ///ciclular Progress Bar
        
        let center = self.viewCircle.center
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 50, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
            
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound

        self.viewCircle.layer.addSublayer(trackLayer)
        self.viewCircle.layer.insertSublayer(trackLayer, above: self.viewCircle.layer)
            
        self.shapeLayer.path = circularPath.cgPath
        self.shapeLayer.strokeColor = #colorLiteral(red: 0.2050263882, green: 0.5214856267, blue: 0.8346499801, alpha: 1)
        self.shapeLayer.lineWidth = 10
        self.shapeLayer.fillColor = UIColor.clear.cgColor
        self.shapeLayer.lineCap = kCALineCapRound
        self.shapeLayer.strokeEnd = 0
        self.view.layer.addSublayer(self.shapeLayer)

       self.viewCircle.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
        
    }
    }
    @objc private func handleTap(){
        downloader = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: (#selector(Account.updater)), userInfo: nil, repeats: true)
        print("Attempting to animate stroke")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 5
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }
    
    @objc func updater() {
        if minValue != maxValue{
            minValue += 1
            animationLabel4.text = "\(minValue)"
            dismiss(animated: true, completion: nil)
        }else{
            
             }
    }

    
    @IBAction func MakePayment(_ sender: Any) {
       
    }
    
    @IBAction func slider(_ sender: UISlider) {
        availableAmountLbl.text = "$\(String(Int(sender.value)))"
        currentAmountLbl.text = "$\(String(Int(1651 - sender.value)))"
        totalAmountLbl.text = "$\(String(Int(sender.value * 2)))"
    }
    
    
}

