//
//  ContactUsViewController.swift
//  UeBook
//
//  Created by Deepak on 16/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Alamofire

class ContactUsViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var txtEmail: UITextField!
   @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var lblPhnNumber: UILabel!
    
    
    @IBOutlet weak var textViewMesage: UITextView!
   
    
    @IBOutlet weak var lblMessage: UILabel!
    
    
    @IBOutlet weak var btnSend: UIButton!
    
    
    @IBAction func btnSend(_ sender: Any) {
        
        
       
         if self.txtEmail.text?.count == 0
        {
            AlertVC(alertMsg:"Please Enter Email-ID")
            
        }
        else  if isValidEmail (testStr: txtEmail.text!) == false
        {
            
            
            //txtEmail.textColor = UIColor.red
            
            AlertVC(alertMsg:"Please Enter Vaild Email-ID")
            
        }
            
            
        else if self.txtPhoneNumber.text?.count == 0
        {
            AlertVC(alertMsg:"Please Enter Contact Number")
            
        }
            
         else  if isValidPhone(phoneNumber: txtPhoneNumber.text!) == false
         {
            
            
            //txtEmail.textColor = UIColor.red
            
            AlertVC(alertMsg:"Please Enter Vaild Contact Number")
            
         }
            
        
         else if self.textViewMesage.text?.count == 0
         {
            AlertVC(alertMsg:"Please Write your message")
            
        }
    
   else
         {
            txtEmail.text = ""
            txtEmail.placeholder="Email"
            lblEmail.isHidden = true
            
            txtPhoneNumber.text = ""

            txtPhoneNumber.placeholder="Contact Number"
            lblPhnNumber.isHidden = true
            
            
            textViewMesage.text = ""

            textViewMesage.text = "Write your message"
            textViewMesage.textColor = UIColor.lightGray
            lblMessage.isHidden = true
            

    Contact_Us()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.delegate=self
        txtPhoneNumber.delegate=self
        textViewMesage.delegate=self
        
        
        txtEmail.layer.cornerRadius = 5
        txtEmail.layer.borderWidth = 1.0
        txtEmail.layer.borderColor = UIColor.black.cgColor
        
        txtPhoneNumber.layer.cornerRadius = 5
        txtPhoneNumber.layer.borderWidth = 1.0
        txtPhoneNumber.layer.borderColor = UIColor.black.cgColor
        
        
        textViewMesage.layer.cornerRadius = 5
        let myColor = UIColor.black
        textViewMesage.layer.borderColor = myColor.cgColor
        textViewMesage.layer.borderWidth = 1.0
        btnSend.layer.cornerRadius = 5
         txtEmail.placeholder="Email"
        lblEmail.isHidden = true
        
        txtPhoneNumber.placeholder="Contact Number"
        lblPhnNumber.isHidden = true
        
        textViewMesage.text = "Write your message"
        textViewMesage.textColor = UIColor.lightGray
         lblMessage.isHidden = true
        
      

        // Do any additional setup after loading the view.
    }
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func isValidPhone(phoneNumber: String) -> Bool {
        let mobileNumberPattern = "[789][0-9]{9}"
        let mobileNumberPred = NSPredicate(format: "SELF MATCHES %@", mobileNumberPattern)
        if mobileNumberPred.evaluate(with: phoneNumber) == true {
            return true
        }
        else {
            return false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
            
            let myColor = UIColor.red
            textViewMesage.layer.borderColor = myColor.cgColor
            
            textViewMesage.layer.borderWidth = 1.0
            
            self.lblMessage.isHidden=false
           
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       
        
        let myColor = UIColor.black
        textViewMesage.layer.borderColor = myColor.cgColor
        
        textViewMesage.layer.borderWidth = 1.0
        
        if(textView == textViewMesage)
        {
            if self.textViewMesage.text?.count == 0
            {
                
                textViewMesage.text = "Write your message"
                textViewMesage.textColor = UIColor.lightGray
                lblMessage.isHidden = true
                
                
                
                
                //self.lblUpdateUser.isHidden = true
                //  self.lblEmailUpdate.isHidden = true
                
                // self.lblUpdateCountry.isHidden = true
                
            }
            
        }
        
        
    
        
        
    }
  
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        //activeDataArray = []
        
        
        
        
        if(textField == txtEmail)
        {
            txtEmail.placeholder = ""
            self.lblEmail.isHidden=false
            
            let myColor = UIColor.red
            txtEmail.layer.borderColor = myColor.cgColor
            
            txtEmail.layer.borderWidth = 1.0
            
        }
        else if(textField == txtPhoneNumber)
        {
            txtPhoneNumber.placeholder = ""
            self.lblPhnNumber.isHidden=false
            
            let myColor = UIColor.red
            txtPhoneNumber.layer.borderColor = myColor.cgColor
            
            txtPhoneNumber.layer.borderWidth = 1.0
            
        }
            
            
        
        
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        
        if(textField == txtEmail)
        {
            let myColor = UIColor.black
            txtEmail.layer.borderColor = myColor.cgColor
            
            txtEmail.layer.borderWidth = 1.0
            
            if self.txtEmail.text?.count == 0
            {
                
              
                txtEmail.placeholder="Email"
                
                
                self.lblEmail.isHidden = true
                //self.lblUpdateUser.isHidden = true
                //  self.lblEmailUpdate.isHidden = true
                
                // self.lblUpdateCountry.isHidden = true
                
            }
            
        }
            
            
        else if(textField == txtPhoneNumber)
        {
            
            let myColor = UIColor.black
            txtPhoneNumber.layer.borderColor = myColor.cgColor
            
            txtPhoneNumber.layer.borderWidth = 1.0
            if self.txtPhoneNumber.text?.count == 0
            {
                
               
                
                txtPhoneNumber.placeholder="Contact Number"
                
                
                // self.lblBriefDes.isHidden = true
                // self.lblUpdateUser.isHidden = true
                self.lblPhnNumber.isHidden = true
                //self.lblUpdateCountry.isHidden = true
                
            }
            
            
        }
            
            
      
        return true
        
    }
    
    
    func AlertVC(alertMsg:String) {
        
        let alert = UIAlertController(title: alertMsg, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        // AJAlertController.initialization().showAlertWithOkButton(aStrMessage: alertMsg) { (index, title) in
        
    }
    
    
    
    func Contact_Us() {
        
        
        let parameters: NSDictionary = [
            "user_id": "33",
            "name":  "Vansh",
            "email": txtEmail.text!,
            "phone": txtPhoneNumber.text!,
            "contatMessage":textViewMesage.text!
        ]
         
        // let url = "http://dnddemo.com/ebooks/api/v1/createUser"
        
        let kBaseUrl                           = "http://dnddemo.com/ebooks/api/v1/"
        let KLoginUrl                           = kBaseUrl + "contact_us"
        
        ServiceManager.POSTServerRequest(String(KLoginUrl), andParameters: parameters as! [String : String], success: {response in
            print("response-------",response!)
            //self.HideLoader()
            if response is NSDictionary {
                let statusCode = response?["error"] as? Int
                let resposeArr = response?["response"] as? [[String: AnyObject]]
                
                if statusCode == 1 {
                    self.AlertVC(alertMsg:"Error, Please retry")
                    // self.AlertVC(alertMsg:"Invalid username or password")
                }
                else if statusCode == 0 {
                    if resposeArr == nil || resposeArr?.count == 0 {
                        self.AlertVC(alertMsg:"Successfully send your mail")
                        //self.AlertVC(alertMsg:"Data Not Found!")
                    }
                    
                    
                }
            }
        }, failure: { error in
            //self.HideLoader()
        })
    }



}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


