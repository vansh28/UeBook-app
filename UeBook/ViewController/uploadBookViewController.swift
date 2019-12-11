//
//  uploadBookViewController.swift
//  UeBook
//
//  Created by Deepak on 11/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Foundation

class uploadBookViewController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate
{

    @IBOutlet weak var txtBookTitle: UITextField!
    @IBOutlet weak var lblBooktitle: UILabel!
    
    @IBOutlet weak var txtRecommended: UITextField!
    @IBOutlet weak var txtBookAuthor: UITextField!
    @IBOutlet weak var txtViewBookDescription: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBAction func btnUploadCoverImage(_ sender: Any) {
    }
    
    
    @IBOutlet weak var btnUploadCoverImage: UIButton!
    
    
    @IBOutlet weak var txtQuestion: UITextField!
    override func viewDidLoad() {
        
         super.viewDidLoad()
        //  scrollView.delegate=self
        
        txtBookTitle.delegate=self
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
       
        txtBookTitle.placeholder=" Book Title"
        lblBooktitle.isHidden = true
        

        //let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
        let myColor = UIColor.gray
        txtBookTitle.layer.borderColor = myColor.cgColor
                txtBookTitle.layer.cornerRadius = 8.0
                txtBookTitle.layer.borderWidth = 2.0
        
//        txtFIledBriefDes.placeholder="Brief Description"
//        lblBriefDes.isHidden = true
//        
//        txtUpdateCountry.placeholder="Update Country"
//        lblUpdateCountry.isHidden = true
      
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        //activeDataArray = []
        
        
        
        
        if(textField == txtBookTitle)
        {
            txtBookTitle.placeholder = ""
            self.lblBooktitle.isHidden=false
            
            let myColor = UIColor.red
            txtBookTitle.layer.borderColor = myColor.cgColor
            
            txtBookTitle.layer.borderWidth = 1.0
            
        }
//        else if(textField == txtEmailUpdate)
//        {
//            txtEmailUpdate.placeholder = ""
//            self.lblEmailUpdate.isHidden=false
//
//        }
//
//
//        else if(textField == txtUpdateCountry)
//        {
//            txtUpdateCountry.placeholder = ""
//            self.lblUpdateCountry.isHidden=false
//
//        }
        
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        
        if(textField == txtBookTitle)
        {
            if self.txtBookTitle.text?.count == 0
            {
                
               
                let myColor = UIColor.black
                txtBookTitle.layer.borderColor = myColor.cgColor
                
                txtBookTitle.layer.borderWidth = 1.0
              
                txtBookTitle.placeholder="Book Title"
                
                
              
                
                

                self.lblBooktitle.isHidden = true
                //self.lblUpdateUser.isHidden = true
                //  self.lblEmailUpdate.isHidden = true
                
                // self.lblUpdateCountry.isHidden = true
                
            }
            
        }
            
//
//        else if(textField == txtEmailUpdate)
//        {
//            if self.txtEmailUpdate.text?.count == 0
//            {
//
//
//                txtEmailUpdate.placeholder="Update Email"
//
//
//                // self.lblBriefDes.isHidden = true
//                // self.lblUpdateUser.isHidden = true
//                self.lblEmailUpdate.isHidden = true
//                //self.lblUpdateCountry.isHidden = true
//
//            }
//
//
//        }
//
//
//        else if(textField == txtUpdateCountry)
//        {
//            if self.txtUpdateCountry.text?.count == 0
//            {
//
//
//                txtUpdateCountry.placeholder="Update Email"
//
//
//                //self.lblBriefDes.isHidden = true
//                //self.lblUpdateUser.isHidden = true
//                //self.lblEmailUpdate.isHidden = true
//                self.lblUpdateCountry.isHidden = true
//                //self.lblEmailUpdate.isHidden = true
//            }
//
//
//        }
//
//
//        else
//        {
//            // var str =  lblUpdateUser.text
//
//
//
//            //self.lblUpdateUser.isHidden = false
//            //txtUpdateUser.placeholder = "pooja"
//        }
        
        
    
        return true
        
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
