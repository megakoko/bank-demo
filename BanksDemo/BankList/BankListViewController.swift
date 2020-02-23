//
//  BankListViewControllerViewController.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import UIKit

class BankListViewController: UITableViewController {
    private var banks = [Bank]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initUI()
    }

    private func initData() {
        banks = [Bank(id: "test", displayable_name: "Test")]
    }

    private func initUI() {
        tableView.register(BankCell.self, forCellReuseIdentifier: BankCell.className)
    }
}

extension BankListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BankCell.className, for: indexPath) as! BankCell
        cell.configure(for: banks[indexPath.row])
        return cell
    }
}
