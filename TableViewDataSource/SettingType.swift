//
//  SettingType.swift
//  TableViewDataSource
//
//  Created by David Chin on 09/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

enum SettingType {
    case Switch(text: String)
    case Segue(text: String)
    case Info(text: String, detail: String)
    
    var identifier: String {
        switch self {
            case .Info: return "infoCell"
            case .Segue: return "segueCell"
            case .Switch: return "switchCell"
        }
    }
}
