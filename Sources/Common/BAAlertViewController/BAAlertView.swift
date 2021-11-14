//
//  BAAlertView.swift
//  EarthquakeAppTurkey
//
//  Created by Burak AKIN on 2.09.2021.
//  Copyright © 2021 Burak AKIN. All rights reserved.
//

import UIKit

public protocol BAAlertView {
    func showAlert(alert: Alert)
    func showAlert(withMessage message: String)
}

public extension BAAlertView where Self: UIViewController {
    
    //Dismiss Base AlertView
    func showAlert(withMessage message: String) {
        let alert = Alert(message: message,
                          buttons: [AlertButton(title: "TAMAM", action: nil)])
        showAlert(alert: alert)
    }
    
    func showAlert(alert: Alert) {
        let vc = BAAlertViewController(alert: alert)
        present(vc, animated: true, completion: nil)
    }
    
}
