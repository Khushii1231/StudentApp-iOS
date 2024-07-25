//
//  StudentFormController.swift
//  StudentApp
//
//  Created by swati mane on 13/09/22.
//

import UIKit
import CoreData

class StudentFormController: UIViewController , DataPassDelegate{
    
    func data(object: [String : String] , index:Int ,isEdit:Bool) {
        txtName.text = object["name"]
        txtEmail.text = object["email"]
        txtCourse.text = object["course"]
        textMobile.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
    var i = Int()
    var isUpdate = Bool()
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var textMobile: UITextField!
    @IBOutlet weak var txtCourse: UITextField!
    @IBOutlet weak var btnSaveClick: UIButton!
    
    @IBOutlet weak var emailErr: UILabel!
    @IBOutlet weak var nameErr: UILabel!
    @IBOutlet weak var mobileErr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    @IBAction func btnSaveClick(_ sender: Any) {
        let dict = ["name":txtName.text , "email":txtEmail.text , "mobile":textMobile.text , "course":txtCourse.text]
        if isUpdate{
            DatabaseHelper.sharedInstance.editData(object:dict as! [String:String], i:i)
        }else {
            DatabaseHelper.sharedInstance.save(object:dict as! [String : String])
        }
      
       
    }
    
    @IBAction func btnShowClick(_ sender: UIButton) {
        let listVc = self.storyboard?.instantiateViewController(withIdentifier:"ListView") as! ListViewController
        listVc.delegate = self
        self.navigationController?.pushViewController(listVc, animated: true)
    }
    
    
    
}
