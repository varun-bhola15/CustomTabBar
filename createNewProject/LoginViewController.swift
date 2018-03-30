//
//  ViewController.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var PaswordLabel: UILabel!
    @IBOutlet weak var rememberLabel: UILabel!
    @IBOutlet weak var touchIDLabel: UILabel!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    @IBOutlet weak var PurchaseLabel: UILabel!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet var emailTxtFld: UITextField!
    @IBOutlet var passwordTxtFld: UITextField!
//     let chara = "raj"
//    let Pass = "raj"
   // var chara: String!
    //var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        switch1.onTintColor = #colorLiteral(red: 0.07260166854, green: 0.4434324503, blue: 0.8109169602, alpha: 1)
        switch2.onTintColor = #colorLiteral(red: 0.07260166854, green: 0.4434324503, blue: 0.8109169602, alpha: 1)
        emailTxtFld.delegate = self
        passwordTxtFld.delegate = self
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGED") == true {
            let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "TabControl") as! TabControl
            //self.navigationController?.pushViewController(HomeVc, animated: false)

        }
//        let defaults = UserDefaults.standard
//        if let textFieldValue = defaults.string(forKey: chara)
//        {
//            emailTxtFld.text = textFieldValue
//        }
//        if let textFieldValuePass = defaults.string(forKey: Pass){
//            passwordTxtFld.text = textFieldValuePass
//        }
    }
 
    override func viewWillAppear(_ animated: Bool) {
        //if emailTxtFld.text != nil && passwordTxtFld.text != nil{
//            let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "TabControl") as! TabControl
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = myTabBar
//          print("clear the text")
//        }
        self.navigationController?.isNavigationBarHidden = false
      //textZero()
    }

    
    
    
    @IBAction func LoginBtnWasPressed(_ sender: Any) {
        if emailTxtFld.text?.isEmpty ?? true || passwordTxtFld.text?.isEmpty ?? true{
            dismiss(animated: true, completion: nil)
            emailTxtFld.attributedPlaceholder = NSAttributedString(string: "Enter the Email", attributes: [ NSAttributedStringKey.foregroundColor : UIColor.red])
            passwordTxtFld.attributedPlaceholder = NSAttributedString(string: "Enter the Password", attributes: [ NSAttributedStringKey.foregroundColor : UIColor.red])

        }
        
       if emailTxtFld.text?.isEmpty != true {
        UserDefaults.standard.set(true, forKey: "ISUSERLOGGED")
        let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "TabControl") as! TabControl
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = myTabBar
       }
        
    
//        if emailTxtFld.text == "varun" && passwordTxtFld.text == "varun"{
//            
//        }
        
        
        
    }
    @IBAction func PasswordTextFieldAction(_ sender: UITextField) {
         passwordTxtFld.isSecureTextEntry = true
    }

    @IBAction func rememberSwitch(_ sender: Any)
    {
        if (switch1.onTintColor != nil){
            switch1.onTintColor = #colorLiteral(red: 0.07260166854, green: 0.4434324503, blue: 0.8109169602, alpha: 1)
        }else{
            switch1.onTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
    @IBAction func TouchIDSwitch(_ sender: Any) {
        if (switch2.onTintColor != nil){
            switch2.onTintColor = #colorLiteral(red: 0.07260166854, green: 0.4434324503, blue: 0.8109169602, alpha: 1)
        }else{
            switch2.onTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    @IBAction func show(_ sender: Any) {
        passwordTxtFld.isSecureTextEntry = false
    }
    
    
    @IBAction func signUp(_ sender: Any) {
    }
    
    //Keyboard dismiss will tap on view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

