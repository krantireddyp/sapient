//
//  TemperatureListTableViewCell.swift
//  Lowe
//
//

import UIKit

class TemperatureListTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(list : List?) {
        weatherLabel.text = list?.weather?.first?.main ?? ""
        temperatureLabel.text = "\(list?.main?.temp ?? 0.0)"
    }
    
}
