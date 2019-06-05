//
//  ProfileController.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    private class BackgroundColorNavigationBarBehavior: ViewControllerLifecycleBehavior {
        func afterLoading(_ viewController: UIViewController) {
            viewController.view.backgroundColor = .black
        }
    }

    private class StatusBarStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {
        func beforeAppearing(_ viewController: UIViewController) {
            if let vc = viewController as? ProfileController {
                vc.statusBarStyle = .lightContent
                viewController.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }

    private var statusBarStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBehaviors(behaviors: [BackgroundColorNavigationBarBehavior(), StatusBarStyleNavigationBarBehavior()])
    }
}
