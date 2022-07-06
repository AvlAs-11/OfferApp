//
//  ViewController.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 30.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView = MainView()
    var timerModel = TimerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async { [self] in
            mainView.frame = self.view.bounds
        }
    }
    
    private func configuration() {
        let data = UserDefaults.standard
        let time = data.string(forKey: "DataKey")
        if let time = time {
            setTime()
            timerModel.createTimer(with: time)
        }
        if time == "" {
            setTime()
            timerModel.createTimer(with: "86399")
        }
        timerModel.delegate = self
        let frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(mainView)
        mainView.frame = frame
        mainView.activateButton.addTarget(self, action: #selector(activateButtonAction),
                                          for: .touchUpInside)
    }
    
    private func setTime() {
        mainView.timerView.dayCounterView.timerLabel.text = String(format: "%02d",
                                                                   (timerModel.totalTime / 86400) % 60)
        mainView.timerView.hourCounterView.timerLabel.text = String(format: "%02d",
                                                                    (timerModel.totalTime / 3600) % 60)
        mainView.timerView.minuteCounterView.timerLabel.text = String(format: "%02d",
                                                                      (timerModel.totalTime / 60) % 60)
        mainView.timerView.secondCounterView.timerLabel.text = String(format: "%02d",
                                                                      timerModel.totalTime % 60)
    }
    
    private func updateData() {
        if mainView.timerView.dayCounterView.timerLabel.text != String(format: "%02d", timerModel.day) {
            mainView.timerView.dayCounterView.timerLabel.animate(newText: String(format: "%02d", timerModel.day), characterDelay: 0.2)
        }
        if mainView.timerView.hourCounterView.timerLabel.text != String(format: "%02d", timerModel.hour) {
            mainView.timerView.hourCounterView.timerLabel.animate(newText: String(format: "%02d", timerModel.hour), characterDelay: 0.2)
        }
        if mainView.timerView.minuteCounterView.timerLabel.text != String(format: "%02d", timerModel.minute) {
            mainView.timerView.minuteCounterView.timerLabel.animate(newText: String(format: "%02d", timerModel.minute), characterDelay: 0.2)
        }
        if mainView.timerView.secondCounterView.timerLabel.text != String(format: "%02d", timerModel.second) {
            mainView.timerView.secondCounterView.timerLabel.animate(newText: String(format: "%02d", timerModel.second), characterDelay: 0.2)
        }
    }
    
    @objc private func activateButtonAction() {
        let popupView = PopupView(frame: self.view.frame)
        view.addSubview(popupView)
        let tap = UITapGestureRecognizer(target: popupView, action: #selector(popupView.removeFromSuperview))
        popupView.addGestureRecognizer(tap)
        mainView.activateButton.isEnabled = false
        timerModel.stopTimer()
        if timerModel.day != 0 {
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.day))
            popupView.activatedTimeLabel.text?.append(contentsOf: ":")
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.hour))
            popupView.activatedTimeLabel.text?.append(contentsOf: ":")
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.minute))
            popupView.activatedTimeLabel.text?.append(contentsOf: ":")
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.second))
        }
        if timerModel.hour != 0 {
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.hour))
            popupView.activatedTimeLabel.text?.append(contentsOf: ":")
        }
        if timerModel.minute != 0 {
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.minute))
            popupView.activatedTimeLabel.text?.append(contentsOf: ":")
        }
        if timerModel.second != 0 {
            popupView.activatedTimeLabel.text?.append(contentsOf: String(format: "%02d", timerModel.second))
        }
    }
}

extension MainViewController: UpdateTimeProtocol {
    func updateTime() {
        updateData()
    }
}
