//
//  GroupApp.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 15/11/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import Foundation

class GroupApps {
    var title1: String
    var title2: String
    
    var apps: [App]
    
    init(title1: String, title2: String, apps: [App]) {
        self.title1 = title1
        self.title2 = title2
        self.apps = apps
    }
}
