//
//  NotpadViewController.swift
//  UeBook
//
//  Created by Deepak on 11/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class NotpadViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
  
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var myText: UILabel!
  
    var labelData = ["Australia", "Brazil", "Canada","China","Germany","India","Malaysia", "Pakistan", "Russia", "South Africa", "United States of America"]
    
    var imageData = ["Australia", "Brazil", "Canada","China","Germany","India","Malaysia", "Pakistan", "Russia", "SouthAfrica", "UnitedStatesofAmerica"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        //tbleView.tableFooterView = UIView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelData.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        let labelProfile = UILabel(frame: CGRect(x: 86, y: 0, width: 220 , height: 30))
       // let userName = UserDefaults.standard.string(forKey: "Save_User_Name")
        //if userName?.isEmpty == true || userName == "" || userName == nil {
            labelProfile.text = "User Name"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        
        cell .addSubview(labelProfile)
        return cell
    }
    
    
    
    
    
    
   
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
        
    }
}
 

 
    
   
    
    
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cellHeight = tableView(self.tableView, heightForRowAtIndexPath: NSIndexPath(forRow: indexPath.row, inSection: indexPath.section))
//        var cell = CustomCell(frame: CGRectMake(0, 0, self.view.frame.width, cellHeight), title: titleArray[indexPath.row])
//        cell.cellLabel.text = //labelText
//            cell.cellButton.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
//
//        return cell
//    }
    
//    class CustomCell: UITableViewCell {
//        var cellButton: UIButton!
//        var cellLabel: UILabel!
//
//        init(frame: CGRect, title: String) {
//            super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
//
//            cellLabel= UILabel(frame: CGRectMake(self.frame.width - 100, 10, 100.0, 40))
//            cellLabel.textColor = UIColor.blackColor()
//            cellLabel.font = //set font here
//
//                cellButton = UIButton(frame: CGRectMake(5, 5, 50, 30))
//            cellButton.setTitle(title, forState: UIControlState.Normal)
//
//            addSubview(cellLabel)
//            addSubview(cellButton)
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//        }
//    }
//
//
//
    
    
   
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



