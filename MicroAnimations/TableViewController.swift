//
//  TableViewController.swift
//  MicroAnimations
//
//  Created by Christopher Goldsby on 10/6/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit


private enum AnimationType: String {
    case fade
    case moveIn
}

final class TableViewController: UITableViewController {
    
    private let datasource: [AnimationType] = [.fade, .moveIn]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = datasource[indexPath.item].rawValue
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}
