//
//  APIClient.swift
//  Lowe
//
//

import Foundation
import Alamofire

class  APIClient {
    private static func requestData<T: Decodable>(route: APIRouter,
                                                  decoder: JSONDecoder = JSONDecoder(),
                                                  completion:@escaping (Swift.Result < T,
                                                                                       Error>)
                                                    -> Void) -> DataRequest {
        return AF.request(route).responseData { response in
            switch response.result {
            case .success(let response):
                do {
                    let obj = try decoder.decode(T.self, from: response)
                    completion(.success(obj))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    
    static func fetchWeather(city: String,
                           key: String,
                           completion:@escaping (Swift.Result<WeatherStruct, Error>) -> Void) {
        requestData(route: APIRouter.weatherAPI(city: city,
                                                key: key),
                    completion: completion)
    }
}
