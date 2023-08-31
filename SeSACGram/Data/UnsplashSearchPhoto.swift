//
//  UnsplashSearchPhoto.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/30.
//

import Foundation

// MARK: - UnsplashSearchPhotoResult
/*
 "total": 10011,
     "total_pages": 1002,
     "results": [
         {
             "id": "aWHKsYkbCi8",
             "slug": "aWHKsYkbCi8",
             "created_at": "2023-04-28T12:59:36Z",
             "updated_at": "2023-08-30T03:37:34Z",
             "promoted_at": null,
             "width": 5709,
             "height": 8563,
             "color": "#0c598c",
             "blur_hash": "LiC@Hj-oozWWT#X8bIj[9HNIjZoL",
             "description": "Sand dune, Nature Reserve - NEOM, Saudi Arabia | The NEOM Nature Reserve region is being designed to deliver protection and restoration of biodiversity across 95% of NEOM.",
             "alt_description": "a person standireng on top of a sand dune",
             "breadcrumbs": [],
             "urls": {
                 "raw": "https://images.unsplash.com/photo-1682686581264-c47e25e61d95?ixid=M3w0OTU2NzZ8MXwxfHNlYXJjaHwxfHxza3l8ZW58MHx8fHwxNjkzNDE4OTIwfDA&ixlib=rb-4.0.3",
                 "full": "https://images.unsplash.com/photo-1682686581264-c47e25e61d95?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0OTU2NzZ8MXwxfHNlYXJjaHwxfHxza3l8ZW58MHx8fHwxNjkzNDE4OTIwfDA&ixlib=rb-4.0.3&q=85",
                 "regular": "https://images.unsplash.com/photo-1682686581264-c47e25e61d95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTU2NzZ8MXwxfHNlYXJjaHwxfHxza3l8ZW58MHx8fHwxNjkzNDE4OTIwfDA&ixlib=rb-4.0.3&q=80&w=1080",
                 "small": "https://images.unsplash.com/photo-1682686581264-c47e25e61d95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTU2NzZ8MXwxfHNlYXJjaHwxfHxza3l8ZW58MHx8fHwxNjkzNDE4OTIwfDA&ixlib=rb-4.0.3&q=80&w=400",
                 "thumb": "https://images.unsplash.com/photo-1682686581264-c47e25e61d95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0OTU2NzZ8MXwxfHNlYXJjaHwxfHxza3l8ZW58MHx8fHwxNjkzNDE4OTIwfDA&ixlib=rb-4.0.3&q=80&w=200",
                 "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1682686581264-c47e25e61d95"
             },
 */
struct UnsplashSearchPhotoResult: Codable{
    let total: Int
    let totalPage: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPage = "total_pages"
        case results
    }
}

struct Result: Codable{
    let urls: url
}

struct url: Codable{
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
    let small_s3: String
}
