//
//  TimerLabel.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 30.06.2022.
//

import Foundation
import UIKit

final class TimerLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.038, weight: .bold)
        self.layer.cornerRadius = 12
    }
}

extension TimerLabel {
    func animate(newText: String, characterDelay: TimeInterval) {
        DispatchQueue.main.async {
            self.text = ""
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.text = newText
                self.pushTransition(characterDelay)
            }
        }
    }
}


