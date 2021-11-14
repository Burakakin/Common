//
//  BAAlertViewController.swift
//  EarthquakeAppTurkey
//
//  Created by Burak AKIN on 2.09.2021.
//  Copyright © 2021 Burak AKIN. All rights reserved.
//

import UIKit

public struct AlertButton {
    var title: String? = "Tamam"
    var action: (() -> (Void))? = nil
}

public struct Alert {
    var message: String
    var buttons: [AlertButton] = []
}

public class BAAlertViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var containerButtonStackView: UIStackView!
    
    private var alert: Alert
    
    public init(alert: Alert) {
        self.alert = alert
        super.init(nibName: "BAAlertViewController", bundle: .module)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        message.text = alert.message
        
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.systemGray4.cgColor
        containerView.layer.cornerRadius = 10
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        
        for (index, element) in alert.buttons.enumerated() {
            let button = UIButton()
            button.titleLabel?.font = UIFont(name: "Muli-Bold", size: 18)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 10
            
            button.setTitle(element.title, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            containerButtonStackView.addArrangedSubview(button)
        }
    }
    
    
    
    
    @objc func buttonAction(sender: UIButton!) {
        dismiss(animated: true) {
            self.alert.buttons[sender.tag].action?()
        }
    }
    
    
}
