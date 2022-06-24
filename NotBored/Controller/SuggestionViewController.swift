//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 22/06/22.
//

import UIKit

final class SuggestionViewController: UIViewController {
    
    private let activitiesService = ActivitiesService()
    var category: ActivityModel = ActivityModel(type: "")
    var totalParticipants: Int?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var activityNameLabel: UILabel!
    @IBOutlet private weak var participantsLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var categoryRandomLabel: UILabel!
    @IBOutlet private weak var categoryStackView: UIStackView!
    @IBOutlet private weak var coinLogoImageView: UIImageView!
    @IBOutlet private weak var labelsStackView: UIStackView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsStackView.isHidden = true
        categoryLabel.text = category.type
        if (category.type != "Random") {
            categoryStackView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getApiData()
    }
    
    private func getApiData() {
        activitiesService.getActivities(category: category.type, participants: totalParticipants) { data in
            if let apiResponse = data {
                self.labelsStackView.isHidden = false
                self.activityNameLabel.text = apiResponse.activity
                self.participantsLabel.text = String(apiResponse.participants)
                self.priceLabel.text = apiResponse.priceDescription.price
                self.coinLogoImageView.tintColor = apiResponse.priceDescription.color
                self.categoryRandomLabel.text = apiResponse.type.capitalizingFirstLetter()
                
            } else {
                self.labelsStackView.isHidden = true
                print("Erro ao pegar dados da API.")
                self.activityNameLabel.text = "Error ❌"

            }
        }
    }
    
    @IBAction private func tryAgainButton(_ sender: UIButton) {
        getApiData()
    }
    
    @IBAction private func goBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
