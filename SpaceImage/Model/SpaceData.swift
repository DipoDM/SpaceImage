//
//  SpaceData.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import Foundation


struct Results: Decodable {
    let allData : SpaceData
}

struct SpaceData: Decodable/*, Identifiable*/ {
    
//    var id: String {
//        return objectID
//    }
    
    //let objectID: String
    let title: String
    let description: String
    let date: String
    let copyright: String
    let hdurl: String?
    let url: String
}
