//
//  BenchmarkController.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class BenchmarkController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        addBehaviors(behaviors: [TimerNavigationBarBehavior()])
    }
}
