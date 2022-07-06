//
//  TwoDotsLabel.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 03.07.2022.
//

import Foundation
import UIKit

final class TwoDotsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurate() {
        self.text = ":"
        self.textColor = .white
        self.backgroundColor = .clear
    }
}
