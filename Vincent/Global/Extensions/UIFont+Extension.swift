//
//  UIFont+Extension.swift
//  Vincent
//
//  Created by KYUBO A. SHIM on 2022/10/09.
//

import UIKit

extension UIFont {
    static func preferredFont(forTextStyle: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: forTextStyle)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: forTextStyle)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
