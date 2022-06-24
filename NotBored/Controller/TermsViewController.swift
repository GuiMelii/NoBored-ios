//
//  TermsViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 17/06/22.
//

import UIKit

final class TermsViewController: UIViewController {

    @IBOutlet weak var termsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        termsTextView.showsVerticalScrollIndicator = false
        termsTextView.isEditable = false
        termsTextView.isSelectable = false
        // Do any additional setup after loading the view.
    }


    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
