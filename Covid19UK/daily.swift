//
//  daily.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 03/05/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import Foundation

struct Covid: Codable {
    let status: Bool
    let data:[DailyCovid]
    
    struct DailyCovid: Codable {
        let confirmed: Int
        let date: Date?
        let death: Int
        let cured: Int
        let serious: Int
        let negative: Int
        let tested: Int?
    }
}
