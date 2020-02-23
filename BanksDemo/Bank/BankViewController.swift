//
//  BankViewController.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import UIKit
import WebKit

class BankViewController: UITableViewController {
    @IBOutlet private weak var logoWebView: WKWebView!
    @IBOutlet private weak var appToAppSupportLabel: UILabel!
    @IBOutlet private weak var divisionsLabel: UILabel!

    var bank: Bank!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        title = bank.displayable_name
        appToAppSupportLabel.text = bank.supports_app_to_app ? "Yes" : "No"
        if let logoUrl = URL(string: bank.logo) {
            logoWebView.load(URLRequest(url: logoUrl))
        }
        divisionsLabel.text = bank.divisions.isEmpty ? "None" : bank.divisions.joined(separator: ", ")
    }
}
