//
//  BestSellerListTableViewController.swift
//  NYTimesBestSellerList
//
//  Created by Bethany Wride on 10/2/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BestSellerListTableViewController: UITableViewController {
  // MARK: - Variables
    var bestSellerList: [Result] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        BestSellerListController.fetchBestSellerList { (results) in
            self.bestSellerList = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestSellerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bestSellerListCell", for: indexPath)
        let list = bestSellerList[indexPath.row]
        cell.textLabel?.text = list.bookDetails[0].title
        cell.detailTextLabel?.text = list.bookDetails[0].author
        return cell
    }
}
