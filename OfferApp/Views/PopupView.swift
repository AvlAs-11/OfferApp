//
//  PopupView.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 04.07.2022.
//

import Foundation
import UIKit

final class PopupView: UIView {
    
    lazy var greatLabel: UILabel = {
        let label = UILabel()
        label.text = "Great!"
        label.textColor = .white
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.masksToBounds = false
        label.font = UIFont.systemFont(ofSize: self.frame.width * 0.05, weight: .semibold)
        return label
    }()
    
    lazy var activatedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Offer activated at "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: self.frame.width * 0.03, weight: .semibold)
        return label
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PopupColor")
        view.layer.cornerRadius = 12
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(backgroundView)
        self.addSubview(greatLabel)
        self.addSubview(activatedTimeLabel)
        self.greatLabel.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.activatedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.greatLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.greatLabel.bottomAnchor.constraint(equalTo: self.backgroundView.centerYAnchor, constant: -10),
            self.backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.backgroundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
            self.backgroundView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3),
            self.activatedTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activatedTimeLabel.topAnchor.constraint(equalTo: self.backgroundView.centerYAnchor, constant: 10)
        ])
    }
}
