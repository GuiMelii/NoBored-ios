//
//  TermsViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 17/06/22.
//

import UIKit

final class TermsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var termsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termsTextView.showsVerticalScrollIndicator = false
        termsTextView.isEditable = false
        termsTextView.isSelectable = false
        // Do any additional setup after loading the view.
    }


    @IBAction private func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
