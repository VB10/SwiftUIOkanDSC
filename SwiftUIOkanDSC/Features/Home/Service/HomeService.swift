//
//  HomeService.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

import Foundation
import Alamofire

protocol IHomeService {
    func fetchDogDatas(onSuccess: @escaping ([DogModel]) -> Void, onFail: @escaping (String) -> Void)
}

struct HomeService: IHomeService {
    private let baseEndPoint: String = "https://hwasampleapi.firebaseio.com"

    private enum NetworkPath: String {
        case DOGS = "dogs.json"
    }
    
    /// Fetch All Dogs
    /// - Parameters:
    ///   - onSuccess: List all of dogs
    ///   - onFail: Return service message
    func fetchDogDatas(onSuccess: @escaping ([DogModel]) -> Void, onFail: @escaping (String) -> Void) {
        AF.request("\(baseEndPoint)/\(NetworkPath.DOGS.rawValue)", method: HTTPMethod.get).validate().responseDecodable(of: [DogModel].self) { (response) in

            guard let model = response.value else {
                onFail(response.description)
                return
            }
            onSuccess(model)
        }
    }
}
