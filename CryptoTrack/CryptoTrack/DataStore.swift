//
//  fireBaseStore.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/28/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

public var userCoins = [userCoin]()

class DataStore {
    
    static let shared = DataStore()
    
    private var ref: DatabaseReference!
    
    private init() {
        // Get a database reference.
        // Needed before we can read/write to/from the firebase database.
        ref = Database.database().reference()
    }
    
    func count() -> Int {
        return userCoins.count
    }
    
    func getCoin(index: Int) -> userCoin {
        return userCoins[index]
    }
    
    func loadCoin() {
        // Start with an empty array.
        cryptoCurrencyViewSafeToUnwrap = false
        userCoins = [userCoin]()
        
        // Fetch the data from Firebase and store it in our internal people array.
        // This is a one-time listener.
        let currentUser = UserDefaults().string(forKey:"userName")
        ref.child(currentUser!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            
            if let coins = value {
                // Iterate over the person objects and store in our internal people array.
                for p in coins {
                    let id = p.key as! String
                    let coinInfo = p.value as! [String:String]
                    let userCoinAmount = coinInfo["uCoinAmount"]
                    //print(userCoinAmount!)
                    let userCoinPrice = coinInfo["uCoinPrice"]
                    //print(userCoinPrice!)
                    let userCurrency = coinInfo["uCurrency"]
                    //print(userCurrency!)
                    let newUserCoin = userCoin(userCoinAmount: userCoinAmount, userCoinPrice: userCoinPrice, userCurrency: userCurrency)
                    print(newUserCoin.userCurrency!)
                    userCoins.append(newUserCoin)
                    print(userCoins.count)
                }
                cryptoCurrencyViewSafeToUnwrap = true
                //CryptoCurrencyViewController.renderCryptoCurrencyView()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func addCoin(coin: userCoin) {
        // define array of key/value pairs to store for this person.
        let coinRecord = [
            "uCoinAmount": coin.userCoinAmount,
            "uCoinPrice": coin.userCoinPrice,
            "uCurrency": coin.userCurrency
        ]
        
        // Save to Firebase.
        let currentUser = UserDefaults().string(forKey:"userName")
        self.ref.child(currentUser!).child(coin.userCurrency!).setValue(coinRecord)
        
        // Also save to our internal array, to stay in sync with what's in Firebase.
        //userCoins.append([coin])
    }
    
}

