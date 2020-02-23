//
//  BankCell.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import UIKit
import WebKit

class BankCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var iconWebView: WKWebView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(for bank: Bank) {
        nameLabel.text = bank.name
        nameLabel.textColor = UIColor(hex: bank.mainBgColor) ?? UIColor.label
        if let url = URL(string: bank.iconUrl) {
            iconWebView.load(URLRequest(url: url))
        }
    }
}
