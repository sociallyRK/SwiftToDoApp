//
//  FirstViewController.swift
//  TodoApp
//
//  Created by Rahul Khanna on 6/11/14.
//  Copyright (c) 2014 Rahul Khanna. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //UITableViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return taskMgr.tasks.count
    }
    
    //Returning to View
    override func viewWillAppear(animated: Bool) {
        //super.didReceiveMemoryWarning()
        tblTasks.reloadData();
        //this function will execute; will tell the table the data how many tasks need to appear
        
        // Dispose of any resources that can be recreated.
    }
    
    // UI Table View Delegate
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            //println("delete this row")
            taskMgr.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData();
        }
    }
    // provides delete functionality
    

    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        cell.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    
}
