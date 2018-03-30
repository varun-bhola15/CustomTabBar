//
//  moreCell.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

protocol MoreCellDelegate {
    func selectImageFromLibraray(sender:UIButton)
    
}

protocol MoreCellDelegate2 {
    func selectImageFromCamera(sender:UIButton)
    
}

//var label3:UILabel = UILabel()

class moreCell: UITableViewCell,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var uploadButton: UIButton!
    
    var moredele : MoreCellDelegate?
  //  var moredele2 : MoreCellDelegate2?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func UploadImage(_ sender: UIButton) {

        if ((moredele?.selectImageFromLibraray(sender: sender)) != nil) {
            
        }
        
       
       print("open Gallery")
        
    
    }
    
    @IBAction func useCamera(_ sender: UIButton) {
//        moredele2?.selectImageFromCamera(sender: sender)
//        print("open Camera")
    }
    
    

}


