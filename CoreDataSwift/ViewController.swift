//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Raj on 15/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,DataPass{

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func btnShowDataClicked(_ sender: UIButton) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.delegate = self // editing purpose in cell
        self.navigationController?.pushViewController(listVC, animated: true)
    }

    @IBAction func btnSaveClicked(_ sender: UIButton) {
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
        if isUpdate{
            DatabaseHelper.shareInstance.editData(object: dict as! [String:String], i: i)
        }else{
        DatabaseHelper.shareInstance.save(object: dict as! [String:String])
        }
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        
        i = index
        isUpdate = true
        
    }
}

