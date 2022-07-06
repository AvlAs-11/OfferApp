//
//  TimerModel.swift
//  OfferApp
//
//  Created by Pavel Avlasov on 03.07.2022.
//

import Foundation

protocol UpdateTimeProtocol {
    func updateTime()
}

final class TimerModel {
    
    var timer: Timer?
    var delegate: UpdateTimeProtocol?
    var totalTime = 86399
    var day = 1
    var hour = 0
    var minute = 0
    var second = 0
    
    func createTimer(with data: String) {
        
        guard let dataToInt = Int(data) else { return }
        self.totalTime = dataToInt
        
        if timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            self.timer = timer
        }
    }
    
    @objc private func updateTime() {
        if self.totalTime == 0 {
            stopTimer()
        }
        self.day = (self.totalTime / 86400) % 60
        self.hour = (self.totalTime / 3600) % 60
        self.minute = (self.totalTime / 60) % 60
        self.second = self.totalTime % 60
        self.totalTime -= 1
        self.delegate?.updateTime()
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        let defaults = UserDefaults.standard
        self.totalTime = 86399
        defaults.set("86399", forKey: "DataKey")
    }
    
    func pauseTimer() {
        let defaults = UserDefaults.standard
        defaults.set(String(self.totalTime), forKey: "DataKey")
    }
}
