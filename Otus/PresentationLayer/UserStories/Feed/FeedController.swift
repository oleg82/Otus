//
//  FeedController.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FeedController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedProvider.get().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "FeedCell")
        cell.textLabel?.text = FeedProvider.get()[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = SessionSummaryController.create()
        vc.title = FeedProvider.get()[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedController: ViewControllerable {
    static func storyBoardName() -> String {
        return "Feed"
    }
}
