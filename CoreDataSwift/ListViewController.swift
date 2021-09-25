//
//  ListViewController.swift
//  CoreDataSwift
//
//  Created by Raj on 15/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    var student = [Student]() // to form array
    
    @IBOutlet weak var tableView: UITableView!
    var delegate:DataPass! // for editing Data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.shareInstance.getStudentData() // to read array data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.studentDeclared = student[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            student = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name,                    "address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
}








