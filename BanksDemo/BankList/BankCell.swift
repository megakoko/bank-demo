//
//  BankCell.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import UIKit

class BankCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(for bank: Bank) {
        textLabel?.text = bank.displayable_name
    }
}
