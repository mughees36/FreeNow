//
//  UIViewController+Extension.swift
//  DevCrew
//
//  Created by Mughees Mustafa on 02/11/2020.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    class func instantiateFromStoryboard(_ name: String = "Main") -> Self {
        return instantiateFromStoryboardHelper(name)
    }

    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    func showErrorAlert(title: String, description: String) {
    
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: title, message: description, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
