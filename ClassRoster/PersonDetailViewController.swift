//
//  PersonDeatilViewController.swift
//  ClassRoster
//
//  Created by Reeve Vogel on 2/26/15.
//  Copyright (c) 2015 RVCF. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
    
    @IBOutlet weak var fName: UILabel!
    
    @IBOutlet weak var lName: UILabel!
    
    @IBOutlet weak var fNameText: UITextField!
    
    @IBOutlet weak var lNameText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.selectedPerson.image != nil {
            self.imageView.image = self.selectedPerson.image
        }
        
        self.title = self.selectedPerson.firstName
        
        self.fNameText.delegate = self
        self.fNameText.text = self.selectedPerson.firstName
        
        self.lNameText.delegate = self
        self.lNameText.text = self.selectedPerson.lastName
        
        fName.text = "First: \(self.selectedPerson.firstName)"
        lName.text = "Last: \(self.selectedPerson.lastName)"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.fNameText.text
        self.selectedPerson.lastName = self.lNameText.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func photosButtonPressed(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info [UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        self.selectedPerson.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
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
