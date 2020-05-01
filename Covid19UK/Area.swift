//
//  Area.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 30/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import Foundation

struct AreaData: Codable {
    let status:  Bool
    let data: [Data]
    
    struct Data: Codable{
        let confirmed: Int
        let area: [Area]
        
        
        enum CodingKeys: CodingKey {
            
            case confirmed
            case area
            
        }
        
        init(from decoder: Decoder) throws {
            
            //從 decoder 呼叫 container(keyedBy:)，取得包含 JSON 資料的 container。之後我們可利用 key 讀取 container 的內容
            let container = try decoder.container(keyedBy: CodingKeys.self)
            //Call decode(_:forKay:)將 key confirmed 對應的內容解析成整數，存入 property confirmed
            confirmed = try container.decode(Int.self, forKey: .confirmed)
            //key area 的內容是字串，因此我們先將它解析成字串，存入常數 areaString
            let areaString = try container.decode(String.self, forKey: .area)
            //將 areaString 變成 areaData，然後再用 JSONDecoder 將它變成 [Area]
            if let areaData = areaString.data(using: .utf8), let area = try? JSONDecoder().decode([Area].self, from: areaData) {
                self.area = area
            } else {
                self.area = []
            }
        }
        
    }
    struct Area: Codable {
        let location: String
        let number: Int
    }
    
}
