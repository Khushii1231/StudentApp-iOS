//
//  Student+CoreDataProperties.swift
//  
//
//  Created by swati mane on 13/09/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var course: String?

}
