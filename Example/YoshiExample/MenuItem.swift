//
//  MenuItem.swift
//  YoshiExample
//
//  Created by Michael Campbell on 12/22/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import Yoshi

/**
 *  A custom menu item to be displayed in a YoshiTableViewMenu.
 */
internal final class MenuItem: YoshiTableViewMenuItem {

    let name: String
    let subtitle: String?
    var selected: Bool

    init(name: String,
         subtitle: String? = nil,
         selected: Bool = false) {
        self.name = name
        self.subtitle = subtitle
        self.selected = selected
    }

}

/**
 *  A menu item to be displayed in Yoshi.
 */
internal struct TableViewMenu: YoshiTableViewMenu {

    var title: String
    var subtitle: String?
    var displayItems: [YoshiTableViewMenuItem]
    var didSelectDisplayItem: (_ displayItem: YoshiTableViewMenuItem) -> Void

}

/**
 *  A date selector menu item to be displayed in Yoshi.
 */
internal final class DateSelector: YoshiDateSelectorMenu {

    var title: String
    var subtitle: String?
    var selectedDate: Date
    var didUpdateDate: (_ dateSelected: Date) -> Void

    init(title: String,
         subtitle: String? = nil,
         selectedDate: Date = Date(),
         didUpdateDate: @escaping (Date) -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.selectedDate = selectedDate
        self.didUpdateDate = didUpdateDate
    }
}

/**
 *  A custom menu item to be displayed in Yoshi.
 */
internal struct CustomMenu: YoshiMenu {

    let title: String
    let subtitle: String?
    let completion: (() -> Void)?

    func execute() -> YoshiActionResult {
        guard let completion = completion else {
            return .handled
        }

        return .asyncAfterDismissing(completion)
    }
}
