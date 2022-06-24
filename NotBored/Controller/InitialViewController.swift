//
//  InitialViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 17/06/22.
//

import UIKit

final class InitialViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var participantsTextField: UITextField!

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
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .darkContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

    @IBAction private func nextButton(_ sender: UIButton) {
        let categoriesViewController = CategoriesViewController()
        categoriesViewController.totalParticipants = Int(participantsTextField.text!)
        categoriesViewController.modalPresentationStyle = .overFullScreen
        categoriesViewController.modalTransitionStyle = .crossDissolve
        present(categoriesViewController, animated: true)
    }
    
    @IBAction private func termsButton(_ sender: Any) {
        let termsViewController = TermsViewController()
        present(termsViewController, animated: true)
    }
    
    @IBAction private func upButton(_ sender: UIButton) {
        if participantsTextField.text == "" {
            participantsTextField.text = "1"
        } else {
            guard let integer = Int(participantsTextField.text ?? "0") else { return }
            let total = String(integer + 1)
            participantsTextField.text = total
        }
    }
    
    @IBAction private func downButton(_ sender: UIButton) {
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
