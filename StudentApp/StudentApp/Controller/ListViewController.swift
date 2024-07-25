//
//  ListViewController.swift
//  StudentApp
//
//  Created by swati mane on 13/09/22.
//

import UIKit
protocol DataPassDelegate{
    func data(object : [String:String] , index:Int , isEdit:Bool)
}

class ListViewController: UIViewController {
   
    var student = [Student]()
    var delegate:DataPassDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.sharedInstance.getStudentData()
        
    }
    

    @IBOutlet weak var tableView: UITableView!
}

//MARK: - DataSource Method

extension ListViewController : UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for:indexPath) as! TableViewCell
        cell.student = student[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
    

// MARK: - Delegate Method

extension ListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name ,
                    "email":student[indexPath.row].email ,
                     "mobile": student[indexPath.row].mobile ,
                    "course":student[indexPath.row].course ]
        delegate.data(object: dict as! [String : String] , index: indexPath.row ,isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
    
   
    
}


