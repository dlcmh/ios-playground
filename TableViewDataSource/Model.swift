//
//  Model.swift
//  TableViewDataSource
//
//  Created by David Chin on 09/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

struct Model {
    static let data = [
        SettingsSection(
            title: "General",
            cellData: [
                SettingType.Switch(text: "Dark mode"),
                SettingType.Switch(text: "Auto save"),
                SettingType.Segue(text: "Language"),
            ]
        ),
        SettingsSection(
            title: "Stats",
            cellData: [
                SettingType.Info(text: "Usage", detail: "2 days")
            ]
        )
    ]
}
