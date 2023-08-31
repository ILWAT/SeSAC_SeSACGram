//
//  APIService.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/30.
//

import Foundation
import Alamofire


class APIService {
    private init() { }
    
    static let shared = APIService()
    
    let header: HTTPHeaders = ["Authorization": "Client-ID \(APIKeys.UnsplashAuthenticKey)"]
    
    func callRequest() {
        
        let url = URL(string: EndPoint.nasaImage.getAPIURL)!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            //data
            print(data)
            let value = String(data: data!, encoding: .utf8)
            print(value)
            print(response)
            print(error)
        }.resume()
    }
    
    func unsplashSearchImage(text: String, passingData: @escaping (UnsplashSearchPhotoResult)->()){
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: EndPoint.unsplashSearchPhoto.getAPIURL+"?query=\(text)")!
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: UnsplashSearchPhotoResult.self) { response in
            switch response.result{
            case .success(let value):
                print(value)
                passingData(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
