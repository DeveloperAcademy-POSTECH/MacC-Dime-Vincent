//
//  HomeCell.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/11.
//
import SnapKit
import UIKit
import Then

class HomeCell: UICollectionViewCell {
    static var cellID = "Cell"
    var testLagel = UILabel().then {
        $0.text = "test"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .link
        contentView.addSubview(testLagel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLagel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
