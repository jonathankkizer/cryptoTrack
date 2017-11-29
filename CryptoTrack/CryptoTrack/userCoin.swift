//
//  userCoin.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/28/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation
import CryptoCurrencyKit

public class userCoin {
    public let userCoinAmount: String?
    public let userCoinPrice: String?
    public let userCurrency: String?
    
    init(userCoinAmount: String?, userCoinPrice: String?, userCurrency: String?) {
        self.userCoinAmount = userCoinAmount
        self.userCoinPrice = userCoinPrice
        self.userCurrency = userCurrency
    }
    
}

