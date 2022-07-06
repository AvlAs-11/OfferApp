//
//  ActivateButton.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 04.07.2022.
//

import Foundation
import UIKit

class ActivateButton: UIButton {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        if let blueColor = UIColor(named: "BlueColor")?.cgColor, let pinkColor = UIColor(named: "PinkColor")?.cgColor {
            gradient.colors = [blueColor, pinkColor]
        }
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        gradient.cornerRadius = 16
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    private func configuration() {
        self.layer.addSublayer(gradientLayer)
        self.clipsToBounds = true
        self.setTitle("ACTIVATE OFFER", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.038, weight: .semibold)
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor(named: "PinkColor")?.cgColor
        self.layer.shadowRadius = 12
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.masksToBounds = false
    }
}
