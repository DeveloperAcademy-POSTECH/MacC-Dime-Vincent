//
//  ArtItemCategoryViewCellController.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/12.
//

import UIKit

import SnapKit
import Then

final class ArtItemCategoryCell: UICollectionViewCell {

    let artItemCategoryLabel = UILabel().then {
        $0.textColor = .black
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 15
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear

        contentView.addSubview(artItemCategoryLabel)
        
    }

    private func setupLayouts() {

        artItemCategoryLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .black
                self.artItemCategoryLabel.textColor = .white
            } else {
                contentView.backgroundColor = .clear
                self.artItemCategoryLabel.textColor = .black
            }
        }
    }
}


extension ArtItemCategoryCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

