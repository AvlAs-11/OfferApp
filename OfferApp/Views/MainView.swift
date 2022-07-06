//
//  MainView.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 30.06.2022.
//

import Foundation
import UIKit

class MainView: UIView {
    
    lazy var botAnnotationStackView = AnnotationStackView()
    lazy var timerView = TimerView()
    lazy var activateButton = ActivateButton()
    lazy var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "music")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "LAST-MINUTE CHANCE!\nto claim your offer"
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.05, weight: .semibold)
        return label
    }()
    
    lazy var midLabel: UILabel = {
        let label = UILabel()
        label.text = "90% OFF"
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.14, weight: .black)
        return label
    }()
    
    lazy var botLabel: UILabel = {
        let label = UILabel()
        label.text = "For true music fans"
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.038, weight: .semibold)
        return label
    }()
    
    lazy var topAnnotationLabel: UILabel = {
        let label = UILabel()
        label.text = "Hundreds of songs in your pocket"
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.width * 0.035, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubview(musicImageView)
        self.addSubview(topLabel)
        self.addSubview(midLabel)
        self.addSubview(botLabel)
        self.addSubview(timerView)
        self.addSubview(topAnnotationLabel)
        self.addSubview(activateButton)
        self.addSubview(botAnnotationStackView)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        midLabel.translatesAutoresizingMaskIntoConstraints = false
        botLabel.translatesAutoresizingMaskIntoConstraints = false
        timerView.translatesAutoresizingMaskIntoConstraints = false
        topAnnotationLabel.translatesAutoresizingMaskIntoConstraints = false
        activateButton.translatesAutoresizingMaskIntoConstraints = false
        botAnnotationStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            musicImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            musicImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            musicImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            topLabel.bottomAnchor.constraint(equalTo: midLabel.topAnchor, constant: -UIScreen.main.bounds.width * 0.03),
            topLabel.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            topLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                            constant: -UIScreen.main.bounds.width * 0.065),
            midLabel.bottomAnchor.constraint(equalTo: botLabel.topAnchor,
                                             constant: -UIScreen.main.bounds.width * 0.02),
            midLabel.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            midLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                            constant: -UIScreen.main.bounds.width * 0.065),
            botLabel.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            botLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                            constant: -UIScreen.main.bounds.width * 0.065),
            botLabel.bottomAnchor.constraint(equalTo: timerView.topAnchor,
                                             constant: -UIScreen.main.bounds.width * 0.05),
            timerView.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            timerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.12),
            timerView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                             constant: -UIScreen.main.bounds.width * 0.065),
            timerView.bottomAnchor.constraint(equalTo: topAnnotationLabel.topAnchor,
                                              constant: -UIScreen.main.bounds.width * 0.04),
            topAnnotationLabel.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            topAnnotationLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                                      constant: -UIScreen.main.bounds.width * 0.065),
            topAnnotationLabel.bottomAnchor.constraint(equalTo: activateButton.topAnchor,
                                                       constant: -UIScreen.main.bounds.width * 0.025),
            activateButton.leftAnchor.constraint(equalTo: musicImageView.rightAnchor),
            activateButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                                  constant: -UIScreen.main.bounds.width * 0.065),
            activateButton.bottomAnchor.constraint(equalTo: botAnnotationStackView.topAnchor,
                                                   constant: -UIScreen.main.bounds.width * 0.025),
            activateButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.15),
            botAnnotationStackView.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor),
            botAnnotationStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -UIScreen.main.bounds.width * 0.05)
        ])
    }
}

