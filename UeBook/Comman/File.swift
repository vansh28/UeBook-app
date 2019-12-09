//
//  File.swift
//  UeBook
//
//  Created by Deepak on 09/12/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import Foundation
extension ViewController{
    
    func AlertVC(alertMsg:String) {
        AJAlertController.initialization().showAlertWithOkButton(aStrMessage: alertMsg) { (index, title) in
        }
    }
}







