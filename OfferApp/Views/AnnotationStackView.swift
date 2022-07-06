//
//  AnnotationStackView.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 03.07.2022.
//

import Foundation
import UIKit

final class AnnotationStackView: UIStackView {
    
    let leftBotAnnotation = AnnotationLabel()
    let midBotAnnotation = AnnotationLabel()
    let rightBotAnnotation = AnnotationLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(leftBotAnnotation)
        self.addArrangedSubview(midBotAnnotation)
        self.addArrangedSubview(rightBotAnnotation)
        configuration()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.axis  = NSLayoutConstraint.Axis.horizontal
        self.distribution  = UIStackView.Distribution.equalSpacing
        self.alignment = UIStackView.Alignment.center
        self.spacing = 16.0
        leftBotAnnotation.text = "Privacy"
        midBotAnnotation.text = "Restore"
        rightBotAnnotation.text = "Terms"
    }
}
