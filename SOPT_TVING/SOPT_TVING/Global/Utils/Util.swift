//
//  Util.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import UIKit

final class Utils {
    class func modal(_ viewController: UIViewController, _ modalViewController: UIViewController, _ modalStyle: UIModalPresentationStyle) {
        let modalViewController = modalViewController
        modalViewController.modalPresentationStyle = modalStyle
        viewController.present(modalViewController, animated: false)
    }
    
    class func push(navigationController: UINavigationController?, viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            navigationController?.isNavigationBarHidden = true
            navigationController?.pushViewController(viewController, animated: animated)
        }
    }
}
