//
//  ArtItemCategoryModalViewController.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/13.
//

import UIKit

import SnapKit
import Then


final class ArtItemCategotyModalViewController: BaseViewController {

    private enum LayoutConstant {
        static let spacing: CGFloat = 10.0
        static let cellWidth: CGFloat = 90
        static let cellHeight: CGFloat = 40
    }

    private let categoryDate = ["카테고리1", "카테고리2","카테고리3","카테고리4","카테고리5","카테고리6","카테고리7","카테고리8","카테고리9"]

    private let modalViewTitle = UILabel().then {
        $0.text = "카테고리"
        $0.font = .preferredFont(forTextStyle: .callout, weight: .bold)
    }

    private let refreshConfiguration = UIImage.SymbolConfiguration(textStyle: .largeTitle)

    private lazy var refreshButton = UIButton().then {
        $0.imageView?.contentMode = .scaleAspectFit
        $0.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.backgroundColor = .red
        $0.tintColor = .mainBlack
        $0.addTarget(self, action: #selector(refreshbuttonAction(_:)), for: .touchUpInside)
        $0.setImage(UIImage(systemName: "arrow.clockwise.circle.fill", withConfiguration: refreshConfiguration), for: .normal)
    }

    private let acceptCategoryButton = UIButton().then {
        $0.setTitleColor(.mainBlack, for: .normal)
        $0.setTitle("적용하기", for: .normal)
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .preferredFont(forTextStyle: .title2, weight: .bold)
        $0.backgroundColor = .mainYellow
        $0.addTarget(self, action: #selector(acceptbuttonAction(_:)), for: .touchUpInside)
        $0.backgroundColor = .mainYellow
    }
    private let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.sectionInset = UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
        $0.itemSize = CGSize(width: LayoutConstant.cellWidth, height: LayoutConstant.cellHeight)
        $0.minimumLineSpacing = 8
    }
    private lazy var categoryDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout).then {
        $0.register(ArtItemCategoryModalViewCell.self, forCellWithReuseIdentifier: ArtItemCategoryModalViewCell.identifier)
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
    }

    override func render() {
        view.addSubview(categoryDetailCollectionView)
        view.addSubviews(modalViewTitle, refreshButton, acceptCategoryButton)
        view.backgroundColor = .white
    }

    override func configUI() {
        modalViewTitle.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(40)
        }

        categoryDetailCollectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(modalViewTitle.snp.bottom).offset(20)
            $0.height.equalTo(150)
        }

        refreshButton.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(60)
            $0.top.equalTo(categoryDetailCollectionView.snp.bottom).offset(60)
            $0.width.equalTo(55)
            $0.height.equalTo(55)
        }

        acceptCategoryButton.snp.makeConstraints {
            $0.trailing.equalTo(view.snp.trailing).inset(40)
            $0.top.equalTo(categoryDetailCollectionView.snp.bottom).offset(60)
            $0.width.equalTo(200)
            $0.height.equalTo(55)
        }
    }

}

extension ArtItemCategotyModalViewController {

    @objc private func refreshbuttonAction(_: UIButton!) {
        print("refresh!")
    }

    @objc private func acceptbuttonAction(_: UIButton!) {
        print("accept!")
    }
}

extension ArtItemCategotyModalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDate.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtItemCategoryModalViewCell.identifier, for: indexPath) as? ArtItemCategoryModalViewCell else {
            assert(false, "Wrong cell") }

        cell.artCategoryModalLabel.text = categoryDate[indexPath.item]
        cell.contentView.backgroundColor = .clear
      
        return cell
    }

}

extension ArtItemCategotyModalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: LayoutConstant.cellWidth, height: LayoutConstant.cellHeight)
    }
}
