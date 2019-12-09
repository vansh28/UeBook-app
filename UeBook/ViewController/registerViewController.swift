//
//  registerViewController.swift
//  UeBook
//
//  Created by Deepak on 06/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit



class registerViewController: UIViewController ,UITextFieldDelegate {
    


    @IBOutlet weak var txtFullName: UITextField!
    override func viewDidLoad() {
       
        txtEmail.textColor = UIColor.black
    
        txtGender.delegate=self
        txtpassword.delegate=self
        txtActor.delegate=self
        txtFullName.delegate=self
        txtEmail.delegate=self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        if (textField==txtEmail)
        {
           // txtEmail.text=""
        txtEmail.textColor = UIColor.black
        }

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let newLength = textField.text!.count + string.count - range.length
        
        if(textField == txtpassword)
        {
            return newLength <= 20
        }
        
        return true
    }
   
    
    
    @IBAction func BtnRegister(_ sender: Any) {
        
        if self.txtFullName.text?.count == 0
        {
            AlertVC(alertMsg:"Please Enter User Name")
            
        }
        else if self.txtEmail.text?.count == 0
        {
            AlertVC(alertMsg:"Please Enter Email-ID")
            
        }
        else  if isValidEmail (testStr: txtEmail.text!) == false
        {
            
            
            txtEmail.textColor = UIColor.red
           
            AlertVC(alertMsg:"Please Enter Vaild Email-ID")
            
        }
            
            
        else if self.txtpassword.text?.count == 0
        {
            AlertVC(alertMsg:"Please Enter Password")
            
        }
        
        
        Register_API_Method()
        }
    
    
    
    
    func alert()
    {
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
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var txtActor: UITextField!
    

    @IBOutlet weak var txtGender: UITextField!
    

        
        
        
    

    
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
    
    
  
func Register_API_Method() {
    
    
    let parameters: NSDictionary = [
        "user_name": txtFullName.text!,
        "password":  txtpassword.text!,
        "email": txtEmail.text!,
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
}
