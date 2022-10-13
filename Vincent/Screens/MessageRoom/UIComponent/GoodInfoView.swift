//
//  GoodInfoView.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/12.
//

import UIKit

import SnapKit
import Then

final class GoodInfoView: UIView {
    
    private enum Size {
        static let width: CGFloat = UIScreen.main.bounds.size.width
        static let height: CGFloat = 70.0
    }
    
    // MARK: - property
    
    lazy var goodImageView = UIImageView().then {
        let url = URL(string: "https://picsum.photos/600/600/?random")
        $0.load(url: url!)
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    lazy var goodNameLabel = UILabel().then {
        $0.textColor = .mainBlack
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    }
    
    lazy var goodPriceLabel = UILabel().then {
        $0.textColor = .mainBlack
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    }

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func render() {
        self.addSubviews(goodImageView, goodNameLabel, goodPriceLabel)
        
        self.snp.makeConstraints {
            $0.width.equalTo(Size.width)
            $0.height.equalTo(Size.height)
        }
        
        goodImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        goodNameLabel.snp.makeConstraints {
            $0.leading.equalTo(goodImageView.snp.trailing).offset(20)
            $0.top.equalToSuperview().inset(14)
        }
        
        goodPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(goodImageView.snp.trailing).offset(20)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        goodNameLabel.text = "3색 물감"
        goodPriceLabel.text = "33,000원"
    }
    
    private func configUI() {
        backgroundColor = .white
    }
}
