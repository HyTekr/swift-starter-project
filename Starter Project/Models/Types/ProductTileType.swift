//
//  ProductTileType.swift
//  Starter Project
//
//  Created by Oscar de la Hera Gomez on 3/8/23.
//

import Foundation

enum ProductTileType: CaseIterable {
    case get
    case price
    case consumableBuy
    case buyMonthly
    case buyYearly
    case buyIntroOfferMonthly
    case pending
    case purchased
    case activeUntil
    case autoRenewablePurchased
    case gracePeriod
    case expiring
    case refund
    case refundSubscription
}
