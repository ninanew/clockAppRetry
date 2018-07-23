//
//  ViewController.swift
//  Clock
//
//  Created by Kristina Neuwirth on 6/12/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var h1: ClockView!
    @IBOutlet weak var h2: ClockView!
    @IBOutlet weak var dots: BlinkingTimerView!
    @IBOutlet weak var m1: ClockView!
    @IBOutlet weak var m2: ClockView!
    @IBOutlet weak var s1: ClockView!
    @IBOutlet weak var s2: ClockView!
    @IBOutlet weak var ap: ClockView!
    @IBOutlet weak var mm: ClockView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    
    var showDots: Bool = false
    
    
    private struct TimeFormat {
        static let twelveHourFormat = "hh:mm:ss a"
        static let twentyFourHourFormat = "HH:mm:ss"
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = TimeFormat.twelveHourFormat
        return formatter
    }()
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    self.view.'' = UIColor.blue to change font color
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //don't forget to call super when you override a func - you're saying "i'm adding functionality to this, but still want all the good stuff this function does in the super class"
        super.viewWillAppear(animated)
        startTimer()
    }
    
    func blinking () {
        if showDots {
//            print("HEY") //prints are great - just always remember to remove them when you are done. people get VERY cranky about left behind print statements!
            dots.dots.isHidden = false
            showDots = false
        } else {
            dots.dots.isHidden = true
            showDots = true
        }
    }
    
    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [weak self] _ in
//                guard  self != nil else { return } //this is redundant - using [weak self] essentially does this for you

                guard let currentDate = self?.dateFormatter.string(from: Date()) else {return}
                var dateArray = [Character]()
                for char in currentDate {
                    dateArray.append(char)
//                    print(char)
                    
                }
                self?.h1.updateDigit(digit: dateArray[0])
                self?.h2.updateDigit(digit: dateArray[1])
                self?.m1.updateDigit(digit: dateArray[3])
                self?.m2.updateDigit(digit: dateArray[4])
                self?.s1.updateDigit(digit: dateArray[6])
                self?.s2.updateDigit(digit: dateArray[7])
                self?.ap.updateDigit(digit: dateArray[9])
                self?.mm.updateDigit(digit: dateArray[10])
                
                self?.blinking()
//                print(currentDate)
            })
        } else {
            stopTimer()
            startTimer()
        }
    }
    
    func stopTimer () {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        
            }
    
        }
    
    }

}
