//
//  model.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/03.
//

import Foundation


struct SerchBookKList: Codable {
    
        var count: Int
        var Items: [ItemDic]?

        struct ItemDic : Codable{
    
        var Item : ItemInfo?

        struct ItemInfo: Codable {
        var title :String
        var smallImageUrl :String
        var salesDate :String
        var artistName: String
    
        }

    }

}
