//
//  InitialViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 17/06/22.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var participantsTextField: UITextField!

    @objc func textFieldDidChange(_ textField: UITextField) {
        let convertedToNumber = Int(participantsTextField.text ?? "0")
        guard let text = participantsTextField.text, !text.isEmpty, convertedToNumber != nil else {
            participantsTextField.text = ""
            return
        }
        
        nextButton.isEnabled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        participantsTextField.delegate = self
        participantsTextField.keyboardType = .numberPad
        participantsTextField.borderStyle = .none
        participantsTextField.attributedPlaceholder = NSAttributedString(
            string: "0",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        participantsTextField.addTarget(self, action: #selector(InitialViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    

    @IBAction func nextButton(_ sender: UIButton) {
        let categoriesViewController = CategoriesViewController()
        categoriesViewController.totalParticipants = Int(participantsTextField.text!)
        categoriesViewController.modalPresentationStyle = .overFullScreen
        categoriesViewController.modalTransitionStyle = .crossDissolve
        present(categoriesViewController, animated: true)
    }
    
    @IBAction func termsButton(_ sender: Any) {
        let termsViewController = TermsViewController()
        present(termsViewController, animated: true)
    }
    
    @IBAction func upButton(_ sender: UIButton) {
        if participantsTextField.text == "" {
            participantsTextField.text = "1"
        } else {
            guard let integer = Int(participantsTextField.text ?? "0") else { return }
            let total = String(integer + 1)
            participantsTextField.text = total
        }
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        if participantsTextField.text == "" {
            participantsTextField.text = "0"
        } else {
            guard let integer = Int(participantsTextField.text ?? "0") else { return }
            let total = integer - 1
            guard total >= 0 else { return }
            participantsTextField.text = String(total)
        }
    }
    

}
