//
//  DatabaseHelper.swift
//  StudentApp
//
//  Created by swati mane on 13/09/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var sharedInstance = DatabaseHelper()
    
   // persistence for crude opertations like save , delete etc
    //saveContext : for data save
   let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save (object:[String:String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into:context!) as! Student
        student.name = object["name"]
        student.email = object["email"]
        student.mobile = object["mobile"]
        student.course = object["course"]
        do{
            try context?.save()
        }catch{
            print("Data is not save")
        }
        
    }
    
    // For get data
    
    func getStudentData() -> [Student]{
        var student = [Student]()
        // NSFetchRequest - fetching data from persistence storage ,type is NsMangedObject
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("Not get data")
        }
        return student
    }
    
    func deleteData(index:Int) -> [Student]{
        var student = getStudentData()
        context?.delete(student[index]) // delete from row
        student.remove(at: index) // delete from array
        do{
            try context?.save()
        }catch{
            print("Cannot delete data")
        }
        return student
        
    }
    
    //For Edit
    func editData(object:[String:String] , i:Int){
        let student = getStudentData()
        student[i].name = object["name"]
        student[i].email = object["email"]
        student[i].mobile = object["mobile"]
        student[i].course = object["course"]
        do {
            try context?.save()
        }catch{
            print("Data is not edited")
        }
    }
}
