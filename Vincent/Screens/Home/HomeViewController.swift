//
//  HomeViewController.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/11.
//

import UIKit

final class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    static let categoryHeaderID = "카테고리"
    static let recentItemsID = "최근 상품"
    let headerID = "headerID"
    private let wallPaper = UIImageView().then {
        $0.image = UIImage(named: "wallpaperHome")
        $0.contentMode = .scaleAspectFill
    }
    private let helloLabel = UILabel().then {
        $0.text = "Hello,"
        $0.textColor = .gray
        $0.font = .boldSystemFont(ofSize: 24)
    }
    private let vincentLabel = UILabel().then {
        $0.text = "Vincent"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 40)
    }
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "kakao")
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let searchBar = UIView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
    }
    private var collectionView = {
        let layout = UICollectionViewCompositionalLayout { section, env in
            //섹션별로 레이아웃을 그립니다.
            switch section {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(100)))
                item.contentInsets.leading = 8
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderID, alignment: .topLeading)
                ]
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(250)))
                item.contentInsets.leading = 8
                item.contentInsets.trailing = 8
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: categoryHeaderID, alignment: .topLeading)
                ]
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 16)
                return section
            }
        }
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func render() {
        view.addSubviews(wallPaper, helloLabel, vincentLabel, profileImage, collectionView, searchBar)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(0)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(30)
            //      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        wallPaper.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        helloLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        vincentLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalTo(vincentLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-15)
            $0.bottom.equalTo(searchBar.snp.top).offset(60)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.cellID)
        collectionView.register(Header.self, forSupplementaryViewOfKind: HomeViewController.categoryHeaderID, withReuseIdentifier: headerID)
        collectionView.register(HomeCategoryCell.self, forCellWithReuseIdentifier: HomeCategoryCell.identifier)
        navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 8
        default:
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.cellID, for: indexPath) as! HomeCell
        cell.backgroundColor = .blue
        return cell
    }
}

class Header: UICollectionReusableView {
    //Header 클래스는 각 세션에서 헤더를 장식하는 역할을 합니다. 현재 하나만 존재하며 두 세션 모두 사용되기에 다른 클래스가 필요하다고 생각되며 분리도 가능하다고 생각합니다.
    let label = UILabel()
    let button = UIButton(type: .system)
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "카테고리"
        button.setTitle("더보기", for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        addSubview(stackView)
    }
    override func layoutSubviews() {
        stackView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        HomeViewController()
    }
}
@available(iOS 13.0, *)
struct SnapkitVCRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}
#endif
