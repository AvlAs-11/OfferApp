//
//  AnnotationLabel.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 03.07.2022.
//

import Foundation
import UIKit

final class AnnotationLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.textColor = .gray
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.025, weight: .regular)
    }
}
