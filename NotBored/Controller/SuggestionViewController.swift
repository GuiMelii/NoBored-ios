//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 22/06/22.
//

import UIKit

final class SuggestionViewController: UIViewController {
    
    let activitiesService = ActivitiesService()
    var category: ActivityModel = ActivityModel(type: "")
    var totalParticipants: Int?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryRandomLabel: UILabel!
    @IBOutlet weak var categoryStackView: UIStackView!
    @IBOutlet weak var coinLogoImageView: UIImageView!
    @IBOutlet weak var labelsStackView: UIStackView!
    
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
    
    func getApiData() {
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
                self.activityNameLabel.text = "Erro ao pegar dados da API ❌"

            }
        }
    }
    
    @IBAction func tryAgainButton(_ sender: UIButton) {
        getApiData()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
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
