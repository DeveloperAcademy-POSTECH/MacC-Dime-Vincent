//
//  SellViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/08.
//

import UIKit

import SnapKit
import Then

final class SellViewController: BaseViewController {

    // MARK: - property
    
    private let screenText = UILabel().then {
        $0.textColor = .red
        $0.text = "등록"
    }
    
    override func render() {
        view.addSubview(screenText)
        screenText.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
