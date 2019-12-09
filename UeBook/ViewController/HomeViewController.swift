//
//  HomeViewController.swift
//  UeBook
//
//  Created by Deepak on 09/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
@IBOutlet weak var tableView: UITableView!
    
    
    var itemsToLoad: [String] = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
                self.view.addSubview(tableView)
        

   
       
        
        // Do any additional setup after loading the view.
    }
    
  
   
    
   
    
  

    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
        
    }
   
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        return cell
       
    }
    
   
    

    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
