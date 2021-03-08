//
//  WeatherBaseViewController.swift
//  Lowe
//
//

import UIKit

class WeatherBaseViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var lookupButton: UIButton!
    
    var viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonUI()
    }
    
    private func setupButtonUI() {
        lookupButton.layer.cornerRadius = 8.0
        lookupButton.layer.borderWidth = 1.0
        lookupButton.layer.borderColor = UIColor.darkGray.cgColor
    }

    private func navigate() {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "TemperatureListViewController") as? TemperatureListViewController else {
            return
        }
        vc.weatherModel = viewModel.weatherModel
        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        guard  let text = cityNameTextField.text else { return }
        viewModel.fetchData(cityName: text) {[weak self] (status, message) in
            DispatchQueue.main.async {
                if status {
                    self?.navigate()
                } else {
                    self?.showAlert(title: "Alert", message: message, actionTitles: ["ok"], style: [.default], actions: [nil])
                }
            }
        }
    }
}

extension WeatherBaseViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

