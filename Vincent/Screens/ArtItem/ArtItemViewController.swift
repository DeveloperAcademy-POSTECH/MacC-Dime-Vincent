//
//  ArtItemViewController.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/12.
//

import UIKit

import SnapKit
import Then

class ArtItemViewController: BaseViewController {

    private let searchView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }

    private let magniImage = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
    }

    private let searchTextField = UITextField().then {
        $0.textColor = .systemGray5
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.backgroundColor = .red
        $0.placeholder = "윈저앤뉴튼, 홀베인, 클레이트 등"
    }

    private let artItemCount = UILabel().then {
        $0.backgroundColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.text = "상품00개"
    }

    private let artItemCategoryListView = ArtItemCategoryView()

    private let artItemCollectionView = ArtItemCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubviews(searchView, magniImage, searchTextField, artItemCount)
        view.addSubview(artItemCategoryListView)
        view.addSubview(artItemCollectionView)
    }

    private func setupLayouts() {

        searchView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(60)
            $0.trailing.equalTo(view.snp.trailing).inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.height.equalTo(40)
        }

        magniImage.snp.makeConstraints {
            $0.leading.equalTo(searchView.snp.leading)
            $0.centerY.equalTo(searchView.snp.centerY)
        }

        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(magniImage.snp.trailing)
            $0.trailing.equalTo(searchView.snp.trailing)
            $0.top.equalTo(searchView.snp.top).offset(7)
            $0.bottom.equalTo(searchView.snp.bottom).inset(7)
        }
        artItemCount.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.top.equalTo(artItemCategoryListView.snp.bottom).offset(30)
        }

        artItemCategoryListView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(searchView.snp.bottom).offset(40)
            $0.height.equalTo(190)
        }

        artItemCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(artItemCategoryListView.snp.bottom).offset(30)
            $0.bottom.equalTo(view.snp.bottom)
        }

    }
}
