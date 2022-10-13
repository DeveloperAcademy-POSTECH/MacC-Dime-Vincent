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

    static var btnFoward: UIImage { .load(systemName: "chevron.forward") }
    static var btnCamera: UIImage { .load(systemName: "camera") }
    static var btnSend: UIImage { .load(systemName: "paperplane") }
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
