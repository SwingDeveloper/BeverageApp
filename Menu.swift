//
//  Menu.swift
//  BeverageApp
//
//  Created by macbook_air_1 on 2022/12/27.
//

import Foundation

struct Menu: Decodable {
    
    let records: [Record]

    struct Record: Decodable {
        let fields: Fields
    }

    struct Fields: Decodable {
        let name: String
        let type: [String]
        let image: String
        let price_m: Int
        let price_l: Int
        let description: String
       }
    }
