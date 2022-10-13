//
//  ArtItemCategoryViewController.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/12.
//

import UIKit

import SnapKit
import Then

class ArtItemCategoryView: UIView {

    private enum LayoutConstant {
        static let spacing: CGFloat = 10.0
        static let cellWidth: CGFloat = 90
        static let cellHeight: CGFloat = 40
    }

    private let categoryDetailData = ["마네킹", "염료", "천", "실바늘", "재봉틀", "미싱기"]

    private let categoryTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .heavy)
        $0.text = "섬유 패션"
    }

    private let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 8
        $0.itemSize = CGSize(width: LayoutConstant.cellWidth, height: LayoutConstant.cellHeight)
        $0.sectionInset = UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
        $0.scrollDirection = .horizontal
    }

    private lazy var categoryListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout).then {
        $0.register(ArtItemCategoryCell.self, forCellWithReuseIdentifier: ArtItemCategoryCell.identifier)
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewLayouts() {
        self.addSubviews(categoryTitleLabel, categoryListCollectionView)

        categoryTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.top.equalTo(self.snp.top).inset(30)
        }

        categoryListCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryTitleLabel.snp.bottom).offset(20)
            $0.height.equalTo(40)
        }
        self.backgroundColor = .red
    }
}

extension ArtItemCategoryView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDetailData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtItemCategoryCell.identifier, for: indexPath) as? ArtItemCategoryCell else {
            assert(false, "Wrong cell")
        }

//        if indexPath.item == 0 {
//            cell.isSelected = true
//            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
//        }

        cell.artItemCategoryLabel.text = categoryDetailData[indexPath.item]
        cell.contentView.backgroundColor = .black

        return cell
        
    }

}

extension ArtItemCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
