//
//  SettingsSection.swift
//  TableViewDataSource
//
//  Created by David Chin on 09/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

struct SettingsSection {
    var title: String?
    var cellData: [SettingType]
    
    init(title: String?, cellData: [SettingType]) {
        self.title = title
        self.cellData = cellData
    }
}
