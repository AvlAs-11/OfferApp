//
//  SingleTimerView.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 06.07.2022.
//

import Foundation
import UIKit

final class SingleTimerView: UIView {
    
    let timerLabel = TimerLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.addSubview(timerLabel)
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 12
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            timerLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

extension UIView {
    
    func pushTransition(_ duration: CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: "kCATransitionPush")
    }
}
