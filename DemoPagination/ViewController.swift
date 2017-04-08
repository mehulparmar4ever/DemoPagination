//
//  ViewController.swift
//  DemoPagination
//
//  Created by Jigar Patel on 08/04/17.
//  Copyright © 2017 Irishapps. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: PagingMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let options: PagingMenuControllerCustomizable = PagingMenuOptions1()

        self.setup(options)
        self.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

struct PagingMenuOptions1: PagingMenuControllerCustomizable {
    //TAB BAR customisation...
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl//.standard(widthMode: .flexible, centerItem: true, scrollingMode: .pagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor.blue, horizontalPadding: 10, verticalPadding: 0)
        }
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemTAB1(), MenuItemTAB2(), MenuItemTAB3()]
        }
    }
    
    //TAB BAR NAME
    struct MenuItemTAB1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "TAB 1")
            //let description = MenuItemText(text: String(describing: self))
            return .text(title: title)
            //multilineText(title: title, description: description)
        }
    }
    
    struct MenuItemTAB2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "TAB 2")
            return .text(title: title)
        }
    }
    
    
    struct MenuItemTAB3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "TAB 3")
            return .text(title: title)
        }
    }
    
    //Add view controller in uppar tab
    let objViewController1 = ViewController1.instantiateFromStoryboard()
    let objViewController2 = ViewController2.instantiateFromStoryboard()
    let objViewController3 = ViewController3.instantiateFromStoryboard()
    
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [objViewController1,objViewController2,objViewController3])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }
}
