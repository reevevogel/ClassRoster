//
//  ViewController.swift
//  ClassRoster
//
//  Created by Reeve Vogel on 2/19/15.
//  Copyright (c) 2015 RVCF. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let count = userDefaults.objectForKey("launchCount") as? Int {
            let newCount = count + 1
            userDefaults.setObject(newCount, forKey: "launchCount")
        } else {
            println("first launch!")
            let count = 1
            userDefaults.setObject(count, forKey: "launchCount")
        }
        userDefaults.synchronize()
        
        
        self.loadFromArchive()
        
        if self.people.isEmpty {
        if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
            println(filePath)
            
            if let plistArray = NSArray(contentsOfFile: filePath){
                println(plistArray.count)
                for personObject in plistArray {
                    if let personDictionary = personObject as? NSDictionary {
                        let firstName = personDictionary["firstName"] as String
                        let lastName = personDictionary["lastName"] as String
                        let person = Person(firstName: firstName, lastName: lastName)
                        self.people.append(person)
                    }
                }
            }
        } else {
            
        }
        self.saveToArchive()
        }
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = UIColor.yellowColor()
    
//        var reeve = Person(firstName: "Reeve", lastName: "Vogel")
//        var josh = Person(firstName: "Josh", lastName: "Vogel")
//        var vivane = Person(firstName: "Vivane", lastName: "Vogel")
//        var matt = Person(firstName: "Matt", lastName: "Vogel")
//        var ryan = Person(firstName: "Ryan", lastName: "Vogel")
//        var marlee = Person(firstName: "Marlee", lastName: "Vogel")
//        var kiki = Person(firstName: "Kiki", lastName: "Vogel")
//        var george = Person(firstName: "George", lastName: "Vogel")
//        var chris = Person(firstName: "Chris", lastName: "Cassone")
//        var sakura = Person(firstName: "Sakura", lastName: "Akiyama")
//        var jared = Person(firstName: "Jared", lastName: "Friedland")
//        var laura = Person(firstName: "Laura", lastName: "Perez")
//        var philip = Person(firstName: "Philip", lastName: "Chow")
//        var guishard = Person(firstName: "Guishard", lastName: "Revan")
//        
//        self.people.append(reeve)
//        self.people.append(josh)
//        self.people.append(vivane)
//        self.people.append(matt)
//        self.people.append(ryan)
//        self.people.append(marlee)
//        self.people.append(kiki)
//        self.people.append(george)
//        self.people.append(chris)
//        self.people.append(sakura)
//        self.people.append(jared)
//        self.people.append(laura)
//        self.people.append(philip)
//        self.people.append(guishard)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
    }
    
    func loadFromArchive() {
        let path = getDocumentsPath()
        if let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as? [Person] {
        self.people = arrayFromArchive
        }
    }

    func saveToArchive(){
        let path = self.getDocumentsPath()
        println(path)
        NSKeyedArchiver.archiveRootObject(self.people, toFile: path + "/myArchive")
        
    }

    func getDocumentsPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask,true)
        let path = paths.first as String
        return path
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPersonDetail" {
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let person = self.people[indexPath!.row]
            destinationVC.selectedPerson = person
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        
        
        cell.backgroundColor = UIColor.grayColor()
        
        cell.personLabel.textColor = UIColor.whiteColor()
        
        let showPerson = self.people[indexPath.row]
        
        cell.personLabel.text = showPerson.firstName + " " + showPerson.lastName
        
        //cell.textLabel?.text = person.firstName + " " + person.lastName
        //cell.textLabel?.text = "\(indexPath.row)"
        
        if showPerson.image != nil {
            cell.personImageView.image = showPerson.image
        } else {
            cell.personImageView.image = UIImage(named: "code-fellows-logo.png")
        }
        
        return cell
    }
    
    //func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // println(indexPath.row)
        
       // let myViewController = UIViewController()
       // myViewController.view.backgroundColor = UIColor.yellowColor()
       // self.navigationController?.pushViewController(myViewController, animated: true)
    //}
}

