//
//  SellCheckBoxView.swift
//  Vincent
//
//  Created by KYUBO A. SHIM on 2022/10/10.
//

import UIKit
import SnapKit
import Then

class SellCheckBoxView: UIView {
    
    let configImageUI = UIImage.SymbolConfiguration(textStyle: .title1)
    
    var checkBool: Bool = false {
        didSet {
            if checkBool == false {
                checkBoxImage.tintColor = UIColor.gray
                checkBoxImage.image = UIImage(systemName: "square", withConfiguration: configImageUI)
            } else {
                checkBoxImage.tintColor = UIColor.yellow
                checkBoxImage.image = UIImage(systemName: "checkmark.square.fill", withConfiguration: configImageUI)
            }
        }
    }
    
    let stackView = UIStackView().then {
        $0.spacing = 0
        $0.axis = .horizontal
    }
    
    let checkBoxImage = UIImageView().then {
        $0.image = UIImage(systemName: "square", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title1))
        $0.tintColor = .gray
        $0.sizeToFit()
    }

    let checkTitle = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.preferredFont(forTextStyle: .callout, weight: .semibold)
        $0.text = "나눔할래요"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func updateConstraints() {
        render()
        super.updateConstraints()
    }
    
    func render() {
        stackView.addArrangedSubview(checkBoxImage)
        stackView.addArrangedSubview(checkTitle)
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        checkBoxImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.width.equalTo(32)
        }
        
        checkTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(self.checkBoxImage.snp.right).offset(5)
        }
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
