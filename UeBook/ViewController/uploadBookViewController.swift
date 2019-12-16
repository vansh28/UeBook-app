//
//  uploadBookViewController.swift
//  UeBook
//
//  Created by Deepak on 11/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import Foundation

class uploadBookViewController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource
{
    
  
    var value:Int = 0
    
    var strRecommmended = ["Recommmended","New Books", " Sport", "Music","Story","Dev test"] //multi-season
    
    var activeDataArray = [String]()
   
    
    
    
    
    
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
        
       
        
            txtRecommened.text = activeDataArray[row]
            self.view.endEditing(true)
        
     
    }
    

    let thePicker = UIPickerView()
    
    
    
    @IBOutlet weak var txtBookTitle: UITextField!
    @IBOutlet weak var lblBookTitle: UILabel!
    
    @IBOutlet weak var txtRecommended: UITextField!
    
    @IBOutlet weak var txtBookAuthor: UITextField!
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    @IBOutlet weak var textViewBookDescription: UITextView!
    
    @IBOutlet weak var lblBookDes: UILabel!
    
    @IBOutlet weak var txtQuestion: UITextField!
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var btnUploadCoverImage: UIButton!
    
   
    @IBAction func btnUploadCoverImage(_ sender: Any) {
    }
    
    @IBOutlet weak var txtRecommened: UITextField!
    
    @IBOutlet weak var btnPublish: UIButton!
    
    
    @IBOutlet weak var btnSaveforLater: UIButton!
    @IBAction func btnPublish(_ sender: Any) {
    }
    
    
    @IBAction func btnSaveForlater(_ sender: Any) {
    }
    
    @IBAction func btnVideo(_ sender: Any) {
    }
    
    
    @IBOutlet weak var btnRecording: UIButton!
    
    
    
    override func viewDidLoad() {
        
         super.viewDidLoad()
        
        
        activeDataArray = strRecommmended
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
       
        thePicker.delegate = self
        thePicker.dataSource=self
        txtRecommened.inputView=thePicker
        txtRecommened.text = activeDataArray[0]
        
//        thePicker.backgroundColor = .white
//        thePicker.layer.borderColor = UIColor.gray.cgColor
//        thePicker.layer.borderWidth = 1
    
        
        
        
        
        txtBookTitle.delegate=self
        txtQuestion.delegate=self
        txtBookAuthor.delegate=self
        textViewBookDescription.delegate=self
        
        
        txtBookTitle.layer.cornerRadius = 5
        txtBookTitle.layer.borderWidth = 1.0
        txtBookTitle.layer.borderColor = UIColor.black.cgColor
        txtBookTitle.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)

        
        txtQuestion.layer.cornerRadius = 5
        txtQuestion.layer.borderWidth = 1.0
        txtQuestion.layer.borderColor = UIColor.black.cgColor
        txtQuestion.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)

        
        txtBookAuthor.layer.cornerRadius = 5
        txtBookAuthor.layer.borderWidth = 1.0
        txtBookAuthor.layer.borderColor = UIColor.black.cgColor
        txtBookAuthor.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        txtRecommened.layer.cornerRadius = 5
        txtRecommened.layer.borderWidth = 1.0
        txtRecommened.layer.borderColor = UIColor.black.cgColor
        txtRecommened.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
      
     
        
        
        
        textViewBookDescription.layer.cornerRadius = 5
        let myColor = UIColor.black
       textViewBookDescription.layer.borderColor = myColor.cgColor
        textViewBookDescription.layer.borderWidth = 1.0
        textViewBookDescription.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        

        
       
        txtBookTitle.placeholder="Book Title"
        lblBookTitle.isHidden = true
        
        txtBookAuthor.placeholder="Book Author"
        lblBookAuthor.isHidden = true
        
        txtQuestion.placeholder="Question"
        lblQuestion.isHidden = true
        
        textViewBookDescription.text = "Book Description"
        textViewBookDescription.textColor = UIColor.lightGray
        lblBookDes.isHidden = true
        
        
        
        
        
        btnUploadCoverImage.layer.cornerRadius = 5
        btnUploadCoverImage.layer.borderWidth = 1.0
        btnUploadCoverImage.layer.borderColor = UIColor.black.cgColor
        
        btnPublish.layer.cornerRadius = 5
        btnPublish.layer.borderWidth = 1.0
        
        btnSaveforLater.layer.cornerRadius = 5
        btnSaveforLater.layer.borderWidth = 1.0

        

       

    }
    
func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
            
            let myColor = UIColor.red
            textViewBookDescription.layer.borderColor = myColor.cgColor
            
            textViewBookDescription.layer.borderWidth = 1.0
            
            self.lblBookDes.isHidden=false
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        
        let myColor = UIColor.black
        textViewBookDescription.layer.borderColor = myColor.cgColor
        
        textViewBookDescription.layer.borderWidth = 1.0
        
        if(textView == textViewBookDescription)
        {
            if self.textViewBookDescription.text?.count == 0
            {
                
                textViewBookDescription.text = "Book Description"
                textViewBookDescription.textColor = UIColor.lightGray
                lblBookDes.isHidden = true
                }
            
        }
        
}
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        //activeDataArray = []
        
        
        
        
        if(textField == txtBookTitle)
        {
            txtBookTitle.placeholder = ""
            self.lblBookTitle.isHidden=false
            
            let myColor = UIColor.red
            txtBookTitle.layer.borderColor = myColor.cgColor
            
            txtBookTitle.layer.borderWidth = 1.0
            
        }
        else if(textField == txtBookAuthor)
        {
            txtBookAuthor.placeholder = ""
            self.lblBookAuthor.isHidden=false
            
            let myColor = UIColor.red
            txtBookAuthor.layer.borderColor = myColor.cgColor
            
            txtBookAuthor.layer.borderWidth = 1.0
            
        }
        else if(textField == txtQuestion)
        {
            txtQuestion.placeholder = ""
            self.lblQuestion.isHidden=false
            
            let myColor = UIColor.red
            txtQuestion.layer.borderColor = myColor.cgColor
            
            txtQuestion.layer.borderWidth = 1.0
            
        }
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if(textField == txtBookTitle)
        {
            let myColor = UIColor.black
            txtBookTitle.layer.borderColor = myColor.cgColor
            
            txtBookTitle.layer.borderWidth = 1.0
            
            if self.txtBookTitle.text?.count == 0
            {
                txtBookTitle.placeholder="Book Title"
                self.lblBookTitle.isHidden = true
            }
        }
            
            
        else if(textField == txtBookAuthor)
        {
            
            let myColor = UIColor.black
            txtBookAuthor.layer.borderColor = myColor.cgColor
            
            txtBookAuthor.layer.borderWidth = 1.0
            if self.txtBookAuthor.text?.count == 0
            {
                txtBookAuthor.placeholder="Book Author"
                self.lblBookAuthor.isHidden = true
            }
        }
        else if(textField == txtQuestion)
        {
            
            let myColor = UIColor.black
            txtQuestion.layer.borderColor = myColor.cgColor
            
            txtQuestion.layer.borderWidth = 1.0
            if self.txtQuestion.text?.count == 0
            {
                txtQuestion.placeholder="Question"
                self.lblQuestion.isHidden = true
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
    
    
    
    
    
    
    class TextField: UITextField {
        
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return UIEdgeInsetsInsetRect(bounds, padding)
        }
        
        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return UIEdgeInsetsInsetRect(bounds, padding)
            
        
        }
        
        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return UIEdgeInsetsInsetRect(bounds, padding)
        }
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
