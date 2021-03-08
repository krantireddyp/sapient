//
//  TemperatureDetailViewController.swift
//  Lowe
//
//

import UIKit

class TemperatureDetailViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!

    var list: List?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }

    private func updateUI(){
        guard let  list = list else {
            return
        }
        weatherLabel.text = list.weather?.first?.main ?? ""
        weatherDescLabel.text = list.weather?.first?.weatherDescription ?? ""
        temperatureLabel.text = "\(list.main?.temp ?? 0.0)"
        feelsLikeLabel.text = "Feels Like: \(list.main?.feelsLike ?? 0.0)"
    }

}
