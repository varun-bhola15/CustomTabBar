//
//  MoreVC.swift
//  createNewProject
//
//  Created by varun bhola on 16/03/18.
//  Copyright © 2018 varun15bhola. All rights reserved.
//

import UIKit

class MoreVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  let nav4 = UINavigationItem()
    var indexPath = IndexPath()
    
  // var tabData = ["David Elliott","Anthony Amore","Richard kendall","Tom Clancy","Tomas Walfe","Tom Robbins","Tom Lowe","William Finnegan","Junot Dias","Mark Tawein","T.M Slities"]
    
    @IBOutlet weak var moreTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "More"
        //tabBarItem.title = "hh hjvhj"
//        self.moreTable.delegate = self
//        self.moreTable.dataSource = self
//        moreTable.reloadData()
        let nibname = UINib(nibName: "moreCell", bundle: nil)
        moreTable.register(nibname, forCellReuseIdentifier: "moreCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @objc func selectImage(sender:UIButton)  {
        
        print("\(sender.tag)")
        let controller = UIImagePickerController()
        controller.delegate = self 
        controller.sourceType = .photoLibrary
        //present(controller, animated: true, completion: nil)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as! moreCell
        
//        cell.uploadButton.addTarget(self, action:#selector(selectImage), for: .touchUpInside)
        cell.tag = indexPath.row
        cell.moredele = self
       // cell.label3.text = "hvhjbb"
//        cell.textLabel?.text = "\(indexPath.row)"

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
}
extension MoreVC : MoreCellDelegate{
    func selectImageFromLibraray(sender:UIButton) {
        let buttonPosition:CGPoint = sender.convert(.zero, to:moreTable)
        let indexPath = moreTable.indexPathForRow(at: buttonPosition)
        self.indexPath = indexPath!
        print("\(String(describing: indexPath?.row))")
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    
}
//extension MoreVC : MoreCellDelegate2{
//    func selectImageFromCamera(sender:UIButton) {
//        let buttonPosition:CGPoint = sender.convert(.zero, to:moreTable)
//        let indexPath = moreTable.indexPathForRow(at: buttonPosition)
//        self.indexPath = indexPath!
//        print("\(String(describing: indexPath?.row))")
//        let controller = UIImagePickerController()
//        controller.delegate = self
//        controller.sourceType = .camera
//        present(controller, animated: true, completion: nil)
//
//    }
//
//}




extension MoreVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if (info[UIImagePickerControllerOriginalImage] as? UIImage) != nil
            //let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            let indexPath = IndexPath(row: self.indexPath.row, section: 0)
            let cell = moreTable.cellForRow(at: indexPath) as! moreCell
            cell.label3.text = "Uploaded"
            
        }else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }
}



