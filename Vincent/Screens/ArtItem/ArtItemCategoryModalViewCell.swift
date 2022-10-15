//
//  ArtItemCategoryModalViewCell.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/13.
//

import UIKit

import SnapKit
import Then

final class ArtItemCategoryModalViewCell: BaseCollectionViewCell {

    let artCategoryModalLabel = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .headline, weight: .semibold)
        $0.textAlignment = .center
        $0.backgroundColor = .clear
        $0.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func render() {
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .clear
        contentView.addSubview(artCategoryModalLabel)
    }

    override func configUI() {
        artCategoryModalLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .mainBlack
                self.artCategoryModalLabel.textColor = .white
            } else {
                contentView.backgroundColor = .clear
                self.artCategoryModalLabel.textColor = .black
            }
        }
    }
}

extension ArtItemCategoryModalViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

