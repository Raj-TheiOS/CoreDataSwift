//
//  Student+CoreDataProperties.swift
//  CoreDataSwift
//
//  Created by Raj on 15/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//
//

import Foundation
import CoreData

extension Student {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
