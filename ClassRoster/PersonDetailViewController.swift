//
//  PersonDeatilViewController.swift
//  ClassRoster
//
//  Created by Reeve Vogel on 2/26/15.
//  Copyright (c) 2015 RVCF. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    
    
    @IBOutlet weak var fName: UILabel!
    
    @IBOutlet weak var lName: UILabel!
    
    @IBOutlet weak var fNameText: UITextField!
    
    @IBOutlet weak var lNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.selectedPerson.firstName
        
        self.fNameText.delegate = self
        self.lNameText.delegate = self
        
        fName.text = "First: \(self.selectedPerson.firstName)"
        lName.text = "Last: \(self.selectedPerson.lastName)"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
