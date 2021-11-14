//
//  LoadingView.swift
//  EarthquakeAppTurkey
//
//  Created by Burak AKIN on 31.08.2021.
//  Copyright © 2021 Burak AKIN. All rights reserved.
//

import UIKit

struct ConstantLoadable {
     static let loadingViewTag = 1234
}

class LoadingView: UIView {

    private let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.secondarySystemFill
        layer.cornerRadius = 10
        addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    public func animate() {
        activityIndicatorView.startAnimating()
    }
    

}


