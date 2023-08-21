//
//  Item.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 14/08/23.
//

import Foundation

class Items {
    
//    var itemsList : [String]?
//
//    static var shared : Items = {
//        let instance = Items()
//        return instance
//    }()
//
//    private init(itemsList: [String]? = nil) {
//        self.itemsList = itemsList
//    }
    
    var itemsList : [Item]?
    
    static var shared : Items = {
        let instance = Items()
        return instance
    }()
    
    private init(itemsList: [Item]? = nil) {
        self.itemsList = itemsList
    }
}


extension Items: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

