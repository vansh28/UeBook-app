//
//  UserProfileViewController.swift
//  UeBook
//
//  Created by Deepak on 10/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Alamofire

import Foundation

var imagePicker: UIImagePickerController!

class UserProfileViewController: UIViewController,UIScrollViewDelegate
{
  @IBOutlet weak var userImage: UIImageView!
   var selectedImage: UIImage?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnUserImage: UIButton!
    
    
    
    
    @IBOutlet weak var view1: UIView!
        let kEditUserViewController
            = "EditUserViewController"
    
    
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        
        let userProfileImg = UserDefaults.standard.string(forKey: "Save_User_Img")
        
        //let url = URL(string:userProfileImg!)!
        
        if userProfileImg?.isEmpty == true || userProfileImg == "" || userProfileImg == nil {
            userImage.image = #imageLiteral(resourceName: "userinfo.png")
        }
        else{
            
            //userImage.image = UserDefaults.standard.string(forKey: "Save_User_Img")
            
//            userImage.image=(withUrl: url)
//            userImage.af_setImage(withURL:url , placeholderImage:#imageLiteral(resourceName: "Dummy_User") )
        }
        
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        self.userImage.layer.cornerRadius = self.userImage.bounds.width/2
        self.userImage.layer.borderWidth = 1
        self.userImage.layer.borderColor = UIColor.lightGray.cgColor

        self.btnUserImage.layer.cornerRadius = 5
        userImage.clipsToBounds = true
       
    }
    

    
    
    
    @IBAction func btnUserinfo(_ sender: Any) {
        let objUserProfile = self.storyboard?.instantiateViewController(withIdentifier: kEditUserViewController) as! EditUserViewController
        self.navigationController?.pushViewController(objUserProfile, animated: true)
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
                
                UserDefaults.standard.set(downloadURL, forKey: "Save_User_Img")
                
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

}






//
//func UploadImage()
//    {
//
//
//        let image = UIImage.init(named: "myImage")
//        let imgData = UIImageJPEGRepresentation(image!, 0.2)!
//
//        let parameters: Parameters = [
//            "user_id" : "33"]
//         //Optional for extra parameter
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8)!, withName: key)
//            } //Optional for extra parameters
//        },
//                         to:"mysite/upload.php")
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                    print(response.result.value)
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//            }
//        }
//
//
//
//
//
//        if let data = UIImageJPEGRepresentation(selectedImages,1) {
//            let parameters: Parameters = [
//                "user_id" : "33"
//            ]
//            // You can change your image name here, i use NSURL image and convert into string
//            let imageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
//            let fileName = imageURL.absouluteString
//            // Start Alamofire
//            Alamofire.upload(multipartFormData: { multipartFormData in
//                for (key,value) in parameters {
//                    multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
//                }
//                multipartFormData.append(data, withName: "avatar", fileName: fileName!,mimeType: "image/jpeg")
//            },
//                             usingTreshold: UInt64.init(),
//                             to: "YourURL",
//                             method: .put,
//                             encodingCompletion: { encodingResult in
//                                switch encodingResult {
//                                case .success(let upload, _, _):
//                                    upload.responJSON { response in
//                                        debugPrint(response)
//                                    }
//                                case .failure(let encodingError):
//                                    print(encodingError)
//                                }
//            })
//        }
//}



//MARK: - UIImagePickerControllerDelegate

extension UserProfileViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        
  var selectedImage: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"]   as? UIImage {
            
            selectedImage = editedImage
           userImage.image=selectedImage
             self.Edit_Img_API_Method()
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
            userImage.image=selectedImage
             self.Edit_Img_API_Method()
            
            
        }
      
        
        
//        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
//            self.userImage.image = editedImage
//        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.isNavigationBarHidden = false
        
        self.dismiss(animated: true, completion: nil)
       
        
    }
}

    

extension uploadBookViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
          //  self.userImage.image = editedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.isNavigationBarHidden = false
        self.dismiss(animated: true, completion: nil)
    }
}
    

    
    
    
    
   


   // @IBOutlet weak var tableView: UITableView!
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


