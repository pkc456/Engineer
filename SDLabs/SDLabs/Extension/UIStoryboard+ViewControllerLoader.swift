//
//  UIStoryboard+ViewControllerLoader
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import UIKit

private enum Storyboard: String {
    case home = "Home"
}

fileprivate extension UIStoryboard {

    static func loadUIControllerFromStoryboard(storyboard: Storyboard, identifier: String) -> UIViewController {
        return loadController(from: storyboard, identifier: identifier)
    }

    static func loadController(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
}

// MARK: App View Controllers
extension UIStoryboard {
    
    static func loadHomeNavigationViewController() -> UINavigationController {
        return loadUIControllerFromStoryboard(storyboard: .home, identifier: "HomeNavViewController") as! UINavigationController
    }
    
}
