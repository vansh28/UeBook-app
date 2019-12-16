//
//  AboutUsViewController.swift
//  UeBook
//
//  Created by Deepak on 16/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate=self
         scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var scrollView: UIScrollView!
    
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
