//
//  TabBarController.swift
//  Teddit
//
//  Created by prk on 1/5/23.
//

import UIKit

protocol ChangeTabDelegate {
    func changeTo(tabIndex: Int)
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TabBarController: ChangeTabDelegate {
    
    func changeTo(tabIndex: Int) {
        let totalTabs = self.tabBar.items!.count
        if tabIndex >= totalTabs {
            self.selectedIndex = totalTabs - 1
        } else {
            self.selectedIndex = tabIndex
        }
    }
    
}
