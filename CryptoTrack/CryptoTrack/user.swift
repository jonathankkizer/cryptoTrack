//
//  user.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/9/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation

public class User {
    var userName: String?
    var passWord: String?
    var currencyType: String?
    
    init(userName:String, passWord:String, currencyType:String) {
        self.userName = userName
        self.passWord = passWord
        self.currencyType = currencyType
    }
}
