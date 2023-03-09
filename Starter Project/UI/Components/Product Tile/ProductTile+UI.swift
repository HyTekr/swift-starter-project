//
//  ProductTile+UI.swift
//  Starter Project
//
//  Created by Oscar de la Hera Gomez on 3/8/23.
//

import Foundation
import UIKit

extension ProductTile {
    func setupUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            guard let _ = LanguageCoordinator.shared.currentContent, let _ = self.product else {
                return
            }

            let purchaseButtonType: PurchaseButtonType
            switch self.type {
            case .get:
                purchaseButtonType = .get
                break
            case .price, .consumableBuy, .buyMonthly, .buyYearly, .buyIntroOfferMonthly:
                purchaseButtonType = .price
                break
            case .pending:
                purchaseButtonType = .pending
                break
            case .purchased:
                purchaseButtonType = .purchased
                break
            case .activeUntil:
                purchaseButtonType = .purchased
                break
            case .autoRenewablePurchased:
                purchaseButtonType = .purchased
                break
            case .gracePeriod:
                purchaseButtonType = .warning
                break
            case .expiring:
                purchaseButtonType = .warning
                break
            case .refund:
                purchaseButtonType = .refund
                break
            case .refundSubscription:
                purchaseButtonType = .refund
                break
            }

            self.setupPurchaseButton(type: purchaseButtonType)
            self.setupProductTitle()
            self.setupProductDescription()
        }

    }

    // MARK: UI Setup Functionality
    private func setupPurchaseButton(type: PurchaseButtonType) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.addSubview(self.purchaseButton)
            self.purchaseButton.top(to: self.contentView, offset: kPadding)
            self.purchaseButton.right(to: self.contentView, offset: -kPadding)
        }
    }

    private func setupProductTitle() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.addSubview(self.productTitle)
            self.productTitle.top(to: self.contentView, offset: kPadding)
            self.productTitle.left(to: self.contentView, offset: kPadding)
            self.productTitle.rightToLeft(of: self.purchaseButton, offset: -kPadding)
            self.productTitle.backgroundColor = .red
        }
    }

    private func setupProductDescription() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.addSubview(self.productDescription)
            self.productDescription.topToBottom(of: self.productTitle, offset: kPadding)
            self.productDescription.left(to: self.contentView, offset: kPadding)
            self.productDescription.right(to: self.contentView, offset: -kPadding)
            self.productDescription.backgroundColor = .red
        }
    }
}
