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
    
    var imagePicker = UIImagePickerController()
   @IBOutlet weak var userImage: UIImageView!
    let kUserProfileViewController             = "UserProfileViewController"
    
    
    @IBAction func btnBack(_ sender: Any) {
        
//        let objUserProfile = self.storyboard?.instantiateViewController(withIdentifier: kUserProfileViewController) as! UserProfileViewController
//        self.navigationController?.pushViewController(objUserProfile, animated: true)

    }
    
    @IBOutlet weak var bntUserImage: UIButton!
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        self.userImage.layer.cornerRadius = self.userImage.bounds.width/2
        self.userImage.layer.borderWidth = 1
        self.userImage.layer.borderColor = UIColor.lightGray.cgColor
        
        //self.btn.layer.cornerRadius = 5
        userImage.clipsToBounds = true
        
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
      
        
        
        
        txtUser.text = "Pooja"
        
        txtUser.isEnabled=false
       // lblUpdateUser.isHidden = true
        
        
        txtEmailUpdate.placeholder="Update Email"
        lblEmailUpdate.isHidden = true
        
        txtFIledBriefDes.placeholder="Brief Description"
        lblBriefDes.isHidden = true
        
        txtUpdateCountry.placeholder="Update Country"
        lblUpdateCountry.isHidden = true
        

//        }
        
         activeDataArray = stringActor
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func btnUserImage(_ sender: Any) {
        
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        //If you want work actionsheet on ipad then you have to use popoverPresentationController to present the actionsheet, otherwise app will crash in iPad
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: - Open the camera
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            //If you dont want to edit the photo then you can set allowsEditing to false
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Choose image from camera roll
    
    func openGallary(){
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //If you dont want to edit the photo then you can set allowsEditing to false
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }

    func Edit_Img_API_Method() {
        // ShowLoader()
        let userID = UserDefaults.standard.string(forKey: "Save_User_ID")
        
        let dictionary: NSDictionary = [
            "user_id" : "33"
        ]
        
        
        
        let kBaseUrl                           = "http://dnddemo.com/ebooks/api/v1/"
        let kPostUserImage                          = kBaseUrl + "UpdatePrfilePic"
        
        
        
        
        ServiceManager.POSTServerRequestWithImage(kPostUserImage, andParameters: dictionary as! [String : String], andImage: userImage.image! , imagePara: "profile_image", success: {response in
            //
            
            
            
            //self.HideLoader()
            print("response-------",response!)
            if response is NSDictionary {
                let statusCode = response?["error"] as? Int
                let msg = response?["message"] as? String
                
              
                let img = response?["url"] as? String
                
                
                
                let kProfileImageUploadURL = "http://dnddemo.com/ebooks/api/v1/upload/"
                
                
                if statusCode == 0
                {
                 
                    let fullURL = kProfileImageUploadURL + img!
                    
                    
                   let downloadURL = NSURL(string: fullURL)
                    
                
                    //}
                    UserDefaults.standard.set(fullURL, forKey: "Save_User_Img")
                    //self.Update_Profile_API_Method()
                }
                
                
               
           
                
                
                if statusCode == 1 {
                    //self.AlertVC(alertMsg:msg!)
                }
                //            else if statusCode == 0 {
                //                AJAlertController.initialization().showAlertWithOkButton(aStrMessage: msg!) { (index, title) in
                //                    if index == 0 {
                //                        let vc = self.storyboard?.instantiateViewController(withIdentifier: kHomeViewController) as! HomeViewController
                //                        self.navigationController?.pushViewController(vc, animated: true)
                //                    }
                //                }
                //            }
            }
        }, failure: {
            error in
            //self.HideLoader()
        })
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
            return true
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
    //MARK: - UIImagePickerControllerDelegate
    
    extension EditUserViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
          
            if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
                self.userImage.image = editedImage
            }
           picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.isNavigationBarHidden = false
            self.dismiss(animated: true, completion: nil)
        }
    }




