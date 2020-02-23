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
        NetworkManager.shared.getBanks { banks in
            DispatchQueue.main.async {
                guard let banks = banks else { return }
                self.banks = banks
                self.tableView.reloadData()
            }
        }
    }

    private func initUI() {
        tableView.register(UINib(nibName: BankCell.className, bundle: nil), forCellReuseIdentifier: BankCell.className)
    }
}

// MARK: - UIViewController

extension BankListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "BankDetails":
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            guard let vc = segue.destination as? BankViewController else { return }
            vc.bank = banks[selectedIndexPath.row]
        default:
            break
        }
    }
}


// MARK: - UITableViewController

extension BankListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BankCell.className, for: indexPath) as! BankCell
        cell.configure(for: banks[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BankDetails", sender: self)
    }
}
