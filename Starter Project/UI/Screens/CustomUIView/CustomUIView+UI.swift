//
//  CustomUIView+UI.swift
//  Starter Project
//
//  Created by Oscar de la Hera Gomez on 7/18/22.
//

import Foundation
import UIKit
import TinyConstraints

extension CustomUIView {
    // The setupUI function should be the only publically available class in this extension.
    // This can be called refreshUI if your app removes and adds content periodically.
    func setupUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setupButton()
        }
    }

    // MARK: UI Setup Functionality
    private func setupButton() {
        guard let currentContent = LanguageCoordinator.shared.currentContent?.sample else { return }
        button.update(text: currentContent.sendEmail)
        addSubview(button)
        button.left(to: self, offset: kPadding)
        button.right(to: self, offset: -kPadding)
        button.bottom(to: self, offset: -kPadding)
        button.height(kButtonDimension)

        button.onRelease = { [weak self] in
            guard let self = self else { return }
            self.sendEmail()
        }
    }
}
