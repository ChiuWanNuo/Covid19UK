//
//  data.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 23/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import Foundation

struct Vrius: Codable {
    let status: Bool
    let data:[VriusInfo]
    
    struct VriusInfo: Codable {
        let confirmed: Int
        let date: Date?
        let death: Int
        let cured: Int
        let serious: Int
        let negative: Int
        let tested: Int?
        let ts: Date?
    }


}




