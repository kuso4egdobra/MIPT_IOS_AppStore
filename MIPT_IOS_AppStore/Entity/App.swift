//
//  App.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 20/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import Foundation

class App {
    
    init(name: String, type: String, logoName: String, companyName: String, description: String) {
        self.name = name
        self.type = type
        self.logoName = logoName
        self.companyName = companyName
        self.description = description
    }
    
    var name: String
    var type: String
    var logoName: String
    var companyName: String
    var description: String
}
