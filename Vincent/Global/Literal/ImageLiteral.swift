//
//  ImageLiteral.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - button
    
    static var btnHome: UIImage { .load(systemName: "house") }
    static var btnEnroll: UIImage { .load(systemName: "plus.circle.fill") }
    static var btnProfile: UIImage { .load(systemName: "person.crop.circle") }
    static var btnBack: UIImage { .load(systemName: "chevron.backward") }
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
