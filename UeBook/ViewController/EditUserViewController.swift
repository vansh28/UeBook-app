//
//  EditUserViewController.swift
//  UeBook
//
//  Created by Deepak on 11/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class EditUserViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource
{
  let kUserProfileViewController             = "UserProfileViewController"
    
    
    @IBAction func btnBack(_ sender: Any) {
        
//        let objUserProfile = self.storyboard?.instantiateViewController(withIdentifier: kUserProfileViewController) as! UserProfileViewController
//        self.navigationController?.pushViewController(objUserProfile, animated: true)

    }
    
    @IBOutlet weak var btnBack: UIButton!
    
   let thePicker = UIPickerView()
    
    @IBOutlet weak var txtUser: UITextField!
    
    
    @IBOutlet weak var txtEmailUpdate: UITextField!
    
    @IBOutlet weak var lblEmailUpdate: UILabel!
    @IBOutlet weak var txtFIledBriefDes: UITextField!
    
    @IBOutlet weak var lblBriefDes: UILabel!
    @IBOutlet weak var txtUpdateCountry: UITextField!
    
    @IBOutlet weak var lblUpdateCountry: UILabel!
    @IBOutlet weak var lblUpdateUser: UILabel!
    
    @IBOutlet weak var txtSelectActor: UITextField!
    
    var stringActor = ["Select kind of Actor","Reader", "Writer", "Publish House"]
    var activeDataArray = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        //txtUpdateUser.delegate=self
        txtFIledBriefDes.delegate=self
        txtEmailUpdate.delegate=self
        txtUpdateCountry.delegate=self
        txtSelectActor.delegate=self
        
        txtSelectActor.inputView=thePicker
        thePicker.delegate = self
        thePicker.dataSource=self
        thePicker.backgroundColor = .white
       // thePicker.layer.borderColor = UIColor.gray.cgColor
       // thePicker.layer.borderWidth = 1
        
        
        
        txtUser.text = "Pooja"
        
        txtUser.isEnabled=false
       // lblUpdateUser.isHidden = true
        
        
        txtEmailUpdate.placeholder="Update Email"
        lblEmailUpdate.isHidden = true
        
        txtFIledBriefDes.placeholder="Brief Description"
        lblBriefDes.isHidden = true
        
        txtUpdateCountry.placeholder="Update Country"
        lblUpdateCountry.isHidden = true
        
//        if txtUpdateUser.text?.count == 0
//        {
//
//            txtUpdateUser.placeholder="Update Name"
//             lblUpdateUser.isHidden = true
//        }
//
//       else if txtFIledBriefDes.text?.count == 0
//        {
//
//            txtFIledBriefDes.placeholder="Brief Description"
//            lblBriefDes.isHidden = true
//        }
//      else  if txtEmailUpdate.text?.count == 0
//        {
//
//            txtEmailUpdate.placeholder="Update Email"
//            lblEmailUpdate.isHidden = true
//        }
        
         activeDataArray = stringActor
        

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activeDataArray.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activeDataArray[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       
       
            txtSelectActor.text=activeDataArray[row]
            self.view.endEditing(true)
        }
        
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        //activeDataArray = []
       
        
        
     
 if(textField == txtFIledBriefDes)
         {
            txtFIledBriefDes.placeholder = ""
            self.lblBriefDes.isHidden=false

        }
         else if(textField == txtEmailUpdate)
         {
            txtEmailUpdate.placeholder = ""
            self.lblEmailUpdate.isHidden=false

        }
        
        
         else if(textField == txtUpdateCountry)
         {
            txtUpdateCountry.placeholder = ""
            self.lblUpdateCountry.isHidden=false
            
        }

    }
    
    

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        

            
       if(textField == txtFIledBriefDes)
        {
            if self.txtFIledBriefDes.text?.count == 0
            {
                
                
                txtFIledBriefDes.placeholder="Brief Description"
                
                
                self.lblBriefDes.isHidden = true
                //self.lblUpdateUser.isHidden = true
              //  self.lblEmailUpdate.isHidden = true
                
               // self.lblUpdateCountry.isHidden = true

            }
            
        }
            
            
        else if(textField == txtEmailUpdate)
        {
            if self.txtEmailUpdate.text?.count == 0
            {
                
                
                txtEmailUpdate.placeholder="Update Email"
                
                
               // self.lblBriefDes.isHidden = true
               // self.lblUpdateUser.isHidden = true
                self.lblEmailUpdate.isHidden = true
                //self.lblUpdateCountry.isHidden = true

            }
            
            
        }
            
            
        else if(textField == txtUpdateCountry)
        {
            if self.txtUpdateCountry.text?.count == 0
            {
                
                
                txtUpdateCountry.placeholder="Update Email"
                
                
                //self.lblBriefDes.isHidden = true
                //self.lblUpdateUser.isHidden = true
                //self.lblEmailUpdate.isHidden = true
                self.lblUpdateCountry.isHidden = true
                //self.lblEmailUpdate.isHidden = true
            }
            
            
        }
            
            
        else
        {
            // var str =  lblUpdateUser.text
            
            
            
            //self.lblUpdateUser.isHidden = false
            //txtUpdateUser.placeholder = "pooja"
        }
        
        
    
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
