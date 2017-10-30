//
//  cryptoCurrencyModel.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 10/24/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import Foundation

struct cryptoCurrency: Codable {
    let id: String
    let name: String
    let rank: Int?
    let price_usd: Float?
    let dayHourVolumeUSD: Float?
    let marketCapUSD: Float?
    let availableSupply: Float?
    let totalSupply: Float?
    let percentChangeOneHour: Float?
    let percentChangeDay: Float?
    let percentChangeWeek: Float?
    let lastUpdated: Int?
}
