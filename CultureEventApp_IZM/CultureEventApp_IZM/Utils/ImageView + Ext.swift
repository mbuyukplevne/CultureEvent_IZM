//
//  ImageView + Ext.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 26.05.2023.
//https://openapi.izmir.bel.tr/api/ibb/kultursanat/etkinlikler

import UIKit
import Kingfisher

// Kingfisher image cache Extensions
extension UIImageView {
    func setImage(with url: String) {
        let urlString = url
        guard let url = URL(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        print("------>URL SERVİS \(urlString)")
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }

}
