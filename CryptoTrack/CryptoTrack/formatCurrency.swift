//
//  formatCurrency.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/6/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation

// receives a double and converts it to a currency format (USD)
func formatCurrencyUSD(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 2
    formatter.locale = Locale(identifier: Locale.current.identifier)
    let result = formatter.string(from: value as NSNumber)
    return result!
}

func formatCurrencyEUR(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 2
    formatter.locale = Locale(identifier: "fr_MC")
    let result = formatter.string(from: value as NSNumber)
    return result!

}

func formatCurrencyBTC(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 5
    formatter.currencySymbol = ""
    var result = formatter.string(from: value as NSNumber)
    result = "Ƀ" + result!
    return result!
    
}
