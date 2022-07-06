//
//  TimerView.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 01.07.2022.
//

import Foundation
import UIKit

class TimerView: UIView {
    
    let separator1 = TwoDotsLabel()
    let separator2 = TwoDotsLabel()
    let separator3 = TwoDotsLabel()
    let dayCounterView = SingleTimerView()
    let hourCounterView = SingleTimerView()
    let minuteCounterView = SingleTimerView()
    let secondCounterView = SingleTimerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurate() {
        
        self.addSubview(dayCounterView)
        self.addSubview(separator1)
        self.addSubview(hourCounterView)
        self.addSubview(separator2)
        self.addSubview(minuteCounterView)
        self.addSubview(separator3)
        self.addSubview(secondCounterView)
        
        dayCounterView.translatesAutoresizingMaskIntoConstraints = false
        hourCounterView.translatesAutoresizingMaskIntoConstraints = false
        minuteCounterView.translatesAutoresizingMaskIntoConstraints = false
        secondCounterView.translatesAutoresizingMaskIntoConstraints = false
        separator1.translatesAutoresizingMaskIntoConstraints = false
        separator2.translatesAutoresizingMaskIntoConstraints = false
        separator3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            separator2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            separator2.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            separator1.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            separator3.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            dayCounterView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            hourCounterView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            minuteCounterView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            secondCounterView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            separator1.leftAnchor.constraint(equalTo: dayCounterView.rightAnchor, constant: 2),
            hourCounterView.rightAnchor.constraint(equalTo: separator2.leftAnchor, constant: -2),
            hourCounterView.heightAnchor.constraint(equalTo: self.heightAnchor),
            hourCounterView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            minuteCounterView.leftAnchor.constraint(equalTo: separator2.rightAnchor, constant: 2),
            minuteCounterView.heightAnchor.constraint(equalTo: self.heightAnchor),
            minuteCounterView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            separator3.leftAnchor.constraint(equalTo: minuteCounterView.rightAnchor, constant: 2),
            separator1.rightAnchor.constraint(equalTo: hourCounterView.leftAnchor, constant: -2),
            dayCounterView.rightAnchor.constraint(equalTo: separator1.leftAnchor, constant: -2),
            dayCounterView.heightAnchor.constraint(equalTo: self.heightAnchor),
            dayCounterView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            secondCounterView.leftAnchor.constraint(equalTo: separator3.rightAnchor, constant: 2),
            secondCounterView.heightAnchor.constraint(equalTo: self.heightAnchor),
            secondCounterView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        ])
    }
}
