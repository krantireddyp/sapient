//
//  WeatherViewModel.swift
//  Lowe
//
//

import Foundation

class WeatherViewModel {

    var weatherModel: WeatherStruct? = nil

    func fetchData(cityName: String, completion:@escaping (Bool, String?) -> Void) {
        APIClient.fetchWeather(city: cityName, key: "65d00499677e59496ca2f318eb68c049") {[weak self] response in
            switch response {
            case .success(let model):
                self?.weatherModel = model
                completion(true,nil)
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
}
