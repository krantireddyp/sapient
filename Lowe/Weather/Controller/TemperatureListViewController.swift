//
//  TemperatureListViewController.swift
//  Lowe
//
//

import Foundation
import UIKit

class TemperatureListViewController: UIViewController {
    
    @IBOutlet weak var tempeartureList: UITableView!
    
    var weatherModel: WeatherStruct?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = weatherModel?.city?.name ?? ""
        tempeartureList.register(TemperatureListTableViewCell.nib, forCellReuseIdentifier: TemperatureListTableViewCell.identifier)
        tempeartureList.reloadData()
    }

    
    private func navigate(list: List?) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "TemperatureDetailViewController") as? TemperatureDetailViewController else {
            return
        }
        vc.list = list
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension TemperatureListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigate(list: weatherModel?.list?[indexPath.row])
    }
    
    
}

extension TemperatureListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModel?.list?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TemperatureListTableViewCell.identifier) as? TemperatureListTableViewCell else {
            return UITableViewCell()
        }
        cell.updateUI(list: weatherModel?.list?[indexPath.row])
        return cell
    }

}
