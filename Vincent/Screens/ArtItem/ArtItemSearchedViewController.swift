//
//  ArtItemSearchedView.swift
//  Vincent
//
//  Created by 김연호 on 2022/10/15.
//

import UIKit

import SnapKit
import Then

class ArtItemSearchedViewController: BaseViewController {

    private let searchView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }

    private let magniImage = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
    }

    private let searchTextField = UITextField().then {
        $0.font = UIFont.preferredFont(forTextStyle: .caption1, weight: .regular)
        $0.textColor = .systemGray5
        $0.backgroundColor = .red
        $0.placeholder = "윈저앤뉴튼, 홀베인, 클레이트 등"
    }

    // TODO: -Dropdown 라이브러리 다운받아서 드롭다운으로 만들어야 할 것 같습니다. 임시로 디자인만 넣어놓음
    private let categoryMenu = UIButton().then {
        $0.addTarget(self, action: #selector(presentModal(_:)), for: .primaryActionTriggered)
        $0.backgroundColor = .mainBlack
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout, weight: .semibold)
    }

    private let artItemCollectionView = ArtItemCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
    }

    override func render() {
        view.addSubviews(searchView, magniImage, searchTextField, categoryMenu)
        view.addSubview(artItemCollectionView)
    }

    override func configUI() {
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

        categoryMenu.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.top.equalTo(searchView.snp.bottom).offset(30)
        }

        artItemCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryMenu.snp.bottom).offset(30)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension ArtItemSearchedViewController {
    @objc private func presentModal(_: UIButton!) {
        let categoryModalView = ArtItemCategotyModalViewController()

        if #available(iOS 15.0, *) {
            if let sheet = categoryModalView.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.preferredCornerRadius = 30
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.selectedDetentIdentifier = .medium
            }
        } else {
            // Fallback on earlier versions
        }

        present(categoryModalView, animated: true, completion: nil)

    }
}
