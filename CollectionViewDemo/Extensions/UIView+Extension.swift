//
//  UIView+Extension.swift
//  CollectionViewDemo
//
//  Created by саргашкаева on 4.03.2023.
//

import UIKit


extension UIView {
    
    func addCornerRadius(_ radius: CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
    }
}
