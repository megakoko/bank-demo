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
    let displayable_name: String
    let logo: String
    let icon: String
    let main_bg_color: String
    let supports_app_to_app: Bool
    let divisions: [String]
}
