//
//  APIType.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/30.
//

import Foundation


enum EndPoint{
    case unsplashSearchPhoto
    case nasaImage
}

extension EndPoint{
    
    var getBaseURL: String{
        get{
            switch self {
            case .unsplashSearchPhoto:
                return URL.UnsplashBaseURL
            case .nasaImage:
                return URL.nasaImageURL
            }
        }
    }
    
    var getAPIURL: String{
        get{
            switch self {
                case .unsplashSearchPhoto:
                    return self.getBaseURL+"search/photos"
                case .nasaImage:
                    return self.getBaseURL+"apod/image/2308/M66_JwstTomlinson_3521.jpg"
            }
        }
        
    }
}
