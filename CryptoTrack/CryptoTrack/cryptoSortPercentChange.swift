//
//  cryptoSortPercentChange.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/12/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation
import CryptoCurrencyKit

func cryptoSorter(this: Ticker, that: Ticker) -> Bool {
    return this.percentChange1h! > that.percentChange1h!
}
