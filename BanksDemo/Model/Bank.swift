//
//  Bank.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import Foundation

struct Bank: Decodable {
    let id: String
    let name: String
    let logoUrl: String
    let iconUrl: String
    let mainBgColor: String
    let supportsAppToApp: Bool
    let divisions: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name = "displayable_name"
        case logoUrl = "logo"
        case iconUrl = "icon"
        case mainBgColor = "main_bg_color"
        case supportsAppToApp = "supports_app_to_app"
        case divisions
    }
}
