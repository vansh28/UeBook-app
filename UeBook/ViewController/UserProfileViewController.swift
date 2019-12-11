//
//  UserProfileViewController.swift
//  UeBook
//
//  Created by Deepak on 10/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    let kEditUserViewController             = "EditUserViewController"
 
    @IBAction func btnUserINfo(_ sender: Any) {
        
        let objUserProfile = self.storyboard?.instantiateViewController(withIdentifier: kEditUserViewController) as! EditUserViewController
        self.navigationController?.pushViewController(objUserProfile, animated: true)
    }
   
    
    @IBOutlet weak var view1: UIView!
    

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
    
    
   


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       // scrollView.delegate=self
        //self.view.layoutIfNeeded()
        
        
      //  let view = view1
        //view1.width(constant: self.view.frame.width)
        //view1.addArrangedSubview(view)

        
       

         scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        //tableView.delegate=self
        //tableView.dataSource=self
        

        // Do any additional setup after loading the view.
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
