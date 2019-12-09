//
//  loginViewController.swift
//  UeBook
//
//  Created by Deepak on 06/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Alamofire


class loginViewController: UIViewController {

    @IBOutlet weak var txtPasword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
          //btnSubmit.layer.cornerRadius = 8.0
        
   // Login_API_Method()
     
    }
    
  
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    @IBOutlet weak var fb: UIButton!
    
    
    
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
    
@IBAction func btnSubmit(_ sender: Any) {
if self.txtEmail.text?.count == 0 {
                
                
                let alert = UIAlertController(title: "Please Enter Email-ID", message: nil, preferredStyle: .alert)
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
                
            }

        
        if self.txtPasword.text?.count == 0 {
            
            
            let alert = UIAlertController(title: "Please Enter Password", message: nil, preferredStyle: .alert)
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
            
        }
        Login_API_Method()
    
    }
   
    
  
   
    
    
   

    
    func Login_API_Method() {
        
        
        let parameters: NSDictionary = [
            "user_name" : txtEmail.text!,
            "password" : txtPasword.text!,
            "device_type":"ios",
            "device_token":"0"
        ]
        
       /* let parameters: NSDictionary = [
            "user_name": "pooja",
            "password":  "1345",
            "device_type":"ios",
            "device_token":"0"
        ]*/
        
       // http://dnddemo.com/ebooks/api/v1/userLogin
        // let url = "http://dnddemo.com/ebooks/api/v1/createUser"
        
        let kBaseUrl                           = "http://dnddemo.com/ebooks/api/v1/"
        let KLogin                          = " http://dnddemo.com/ebooks/api/v1/userLogin"
        
        //let KLoginUrl                           = kBaseUrl + "userLogin"
        
        ServiceManager.POSTServerRequest(String(KLogin), andParameters: parameters as! [String : String], success: {response in
            print("response-------",response!)
            //self.HideLoader()
            if response is NSDictionary {
                let statusCode = response?["error"] as? Int
                let resposeArr = response?["response"] as? [[String: AnyObject]]
             
                
                if statusCode == 1 {
                    
                    let alert = UIAlertController(title: "Invalid username or password", message: nil, preferredStyle: .alert)
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
                    
                
                    
                    
                    // self.AlertVC(alertMsg:"Invalid username or password")
                }
                    
                    
                else if statusCode == 0 {
                    if resposeArr == nil || resposeArr?.count == 0 {
                        
                        
                        let alert = UIAlertController(title: "Login Successful", message: nil, preferredStyle: .alert)
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
                        
                        
                        //self.AlertVC(alertMsg:"Data Not Found!")
                    }
                }
                else if statusCode == 2 {
                    if resposeArr == nil || resposeArr?.count == 0 {
                        
                        
                        let alert = UIAlertController(title: " Data Not Found!", message: nil, preferredStyle: .alert)
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
                       
                        
                        //self.AlertVC(alertMsg:"Data Not Found!")
                    }
                    
                    
                }
            }
        }, failure: { error in
            //self.HideLoader()
        })
    }
   
    
    

    
 
   





func Register_API_Method() {
 
    
    let parameters: NSDictionary = [
        "user_name": "pooja",
        "password":  "pooja",
        "email": "puripooja93@gmail.com",
        "publisher_type": "reader",
        "gender":"female",
        "country":"india",
        "about_me": "hi",
        "device_type":"iOS",
        "device_token":"1234567"
    ]
    
    // let url = "http://dnddemo.com/ebooks/api/v1/createUser"
    
    let kBaseUrl                           = "http://dnddemo.com/ebooks/api/v1/"
    let KLoginUrl                           = kBaseUrl + "createUser"
    
    ServiceManager.POSTServerRequest(String(KLoginUrl), andParameters: parameters as! [String : String], success: {response in
        print("response-------",response!)
        //self.HideLoader()
        if response is NSDictionary {
            let statusCode = response?["error"] as? Int
            let resposeArr = response?["response"] as? [[String: AnyObject]]
            
            if statusCode == 1 {
               // self.AlertVC(alertMsg:"Invalid username or password")
            }
            else if statusCode == 0 {
                if resposeArr == nil || resposeArr?.count == 0 {
                    //self.AlertVC(alertMsg:"Data Not Found!")
                }
                
                
            }
        }
    }, failure: { error in
        //self.HideLoader()
    })
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
