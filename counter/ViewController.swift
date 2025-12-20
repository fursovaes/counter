//
//  ViewController.swift
//  counter
//
//  Created by Елена Fursova on 14.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var myLabel: UILabel!
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var decreaseButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func updateLabel() {
        myLabel.text = "Значение счетчика: \(counter)"
    }
    
    private func addHistoryEntry(message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateTime = dateFormatter.string(from: Date())
        
        historyTextView.text += "[\(currentDateTime)]: \(message)\n"
        
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
        
        historyTextView.scrollRangeToVisible(range)
    }
    
    @IBAction private func incrementButtonTapped(_ sender: UIButton) {
        counter += 1
        updateLabel()
        addHistoryEntry(message: "значение изменено на +1")

    }

    @IBAction private func decreaseButtonTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            updateLabel()
            addHistoryEntry(message: "значение изменено на -1")
        } else {
            addHistoryEntry(message: "попытка уменшить значение счетчика ниже 0")
        }
    }
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        counter = 0
        updateLabel()
        addHistoryEntry(message: "значение сброшено")
    }
}
