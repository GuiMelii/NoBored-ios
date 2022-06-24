//
//  CategoriesViewController.swift
//  NotBored
//
//  Created by Guilherme Wilhelm Magnabosco on 21/06/22.
//

import UIKit
import Foundation

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var totalParticipants: Int?
    let categories = [ActivityModel(type: "Education"), ActivityModel(type: "Recreational"), ActivityModel(type: "Social"), ActivityModel(type: "Diy"), ActivityModel(type: "Charity"), ActivityModel(type: "Cooking"), ActivityModel(type: "Relaxation"), ActivityModel(type: "Music"), ActivityModel(type: "Busywork")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
        
    @IBAction func randomButton(_ sender: UIButton) {
        print("hello")
        let suggestionViewController = SuggestionViewController()
        suggestionViewController.totalParticipants = totalParticipants
        suggestionViewController.modalPresentationStyle = .overFullScreen
        suggestionViewController.modalTransitionStyle = .crossDissolve
        suggestionViewController.category = ActivityModel(type: "Random")
        present(suggestionViewController, animated: true)
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let category = categories[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = category.type
        cell.contentConfiguration = configuration
        return cell
    }
    
}

extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestionViewController = SuggestionViewController()
        suggestionViewController.totalParticipants = totalParticipants
        suggestionViewController.modalPresentationStyle = .overFullScreen
        suggestionViewController.modalTransitionStyle = .crossDissolve
        suggestionViewController.category = categories[indexPath.row]
        present(suggestionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
