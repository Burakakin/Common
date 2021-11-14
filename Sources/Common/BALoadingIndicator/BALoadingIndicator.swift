//
//  Loadable.swift
//
//
//  Created by Burak AKIN on 31.08.2021.
//  Copyright © 2021 Burak AKIN. All rights reserved.
//

import UIKit

//Show and Hide ActivityView
public protocol BALoadingIndicator {
    func showLoadingView()
    func hideLoadingView()
}


public extension BALoadingIndicator where Self: UIViewController {
    
    func showLoadingView() {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        //Disable Navigation and Tabbar
        //navigationController?.view.isUserInteractionEnabled = false
        tabBarController?.view.isUserInteractionEnabled = false
        //Constraint
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        loadingView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        loadingView.animate()
        loadingView.tag = ConstantLoadable.loadingViewTag
    }
    
    func hideLoadingView() {
        view.subviews.forEach { subview in
            if subview.tag == ConstantLoadable.loadingViewTag {
                subview.removeFromSuperview()
                //Disable Navigation and Tabbar
                //navigationController?.view.isUserInteractionEnabled = true
                tabBarController?.view.isUserInteractionEnabled = true
            }
        }
    }
    
    
}

