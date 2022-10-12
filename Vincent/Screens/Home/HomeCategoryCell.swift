//
//  HomeCategoryCell.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/12.
//

import UIKit
import SnapKit
import Then

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class HomeCategoryCell: UICollectionViewCell {
    private enum Constants {
        // MARK: contentView layout constants
        static let contentViewCornerRadius: CGFloat = 4.0
        
        // MARK: profileImageView layout constants
        static let imageHeight: CGFloat = 180.0
        
        // MARK: Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 10.0
    }
    let artItemImageView = UIImageView(frame: .zero).then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFill
    }
    
    let artItemPrice = UILabel(frame: .zero).then {
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.backgroundColor = .blue
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    let artItemRegisterTime = UILabel(frame: .zero).then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.backgroundColor = .mainYellow
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    let artItemTitle = UILabel(frame: .zero).then {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.backgroundColor = .white
        $0.textAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white
        
        contentView.addSubviews(artItemImageView, artItemPrice, artItemRegisterTime, artItemTitle)
    }
    
    private func setupLayouts() {
        
        artItemImageView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.top.equalTo(contentView.snp.top)
            $0.height.equalTo(Constants.imageHeight)
        }
        
        artItemPrice.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(5)
            $0.top.equalTo(artItemImageView.snp.bottom).offset(Constants.profileDescriptionVerticalPadding)
        }
        
        artItemRegisterTime.snp.makeConstraints {
            $0.leading.equalTo(artItemPrice.snp.trailing).offset(10)
            $0.centerY.equalTo(artItemPrice.snp.centerY)
        }
        
        artItemTitle.snp.makeConstraints {
            $0.leading.equalTo(artItemPrice.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing).inset(5)
            $0.top.equalTo(artItemPrice.snp.bottom).offset(Constants.profileDescriptionVerticalPadding)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with artitem: ArtItems) {
        artItemImageView.image = UIImage(named: artitem.artItemImage)
        artItemPrice.text = artitem.artItemPrice
        artItemRegisterTime.text = artitem.artItemRegiserTime
        artItemTitle.text = artitem.artItemTitle
    }
}


extension HomeCategoryCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

struct ArtItems {
    let artItemImage: String
    let artItemPrice: String
    let artItemRegiserTime: String
    let artItemTitle: String
}
