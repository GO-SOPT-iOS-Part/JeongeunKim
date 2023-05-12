//
//  MovieInfoService.swift
//  Weather
//
//  Created by JEONGEUN KIM on 2023/05/12.
//

import UIKit

import Alamofire

final class MovieInfoService {
    
    static let shared = MovieInfoService()
    
    private init() {}
    
    func getMovieInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL + "/now_playing"
        let header: HTTPHeaders = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZDhjYmQwNWUwMWM5NDdkZTFmNzZiODdjOGZlMmJkMCIsInN1YiI6IjY0NWQxOTZjNmFhOGUwMDBlNGJlZDIwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OGKqnW6rzTCBE7NShZdNZz_nSBP2MbJo1fqNHLRNHkY"
        ]

        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                print(statusCode)
                guard let value = response.value else { return }
                print(value)
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(MovieInfoResponse.self, from: data) else { return .pathErr }
        print(decodedData)
        
        return .success(decodedData as Any)
    }
}
