//
//  Helper.swift
//  Bookish
//
//  Created by Ashriel Brian Tang on 27/09/2017.
//  Copyright © 2017 Ashriel Brian Tang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: - Activity Indicators
    func startActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.center = self.view.center
        activityIndicator.activityIndicatorViewStyle = .gray
        
        performUpdatesOnMain {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        
    }
    
    func stopActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        performUpdatesOnMain {
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    // MARK: - Alert Views
    func displayAlert(title: String, message: String, handler: @escaping (_ alert: UIAlertAction) -> Void) {
        performUpdatesOnMain {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Keyboards
    // Resigns keyboard on tap
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

