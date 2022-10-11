//
//  HomeViewController.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/11.
//

import UIKit

struct Data {
    let memberName = ["효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린", "효정", "미미", "유아", "승희", "지호", "비니", "아린"]
}
final class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var collectionView = {
        var cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.backgroundColor = .gray
        cv.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.cellID)
        return cv
    }()
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
    
    override func render() {
        view.addSubviews(wallPaper, helloLabel, vincentLabel, profileImage, collectionView, searchBar)
//        collectionView.snp.makeConstraints {
//            $0.top.equalTo(vincentLabel.snp.bottom).offset(30)
//            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(0)
//            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(0)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(30)
//            //      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
//        }
        wallPaper.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//        위의 view bounds로 화면 전체를 그리게 만들어보림
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.cellID, for: indexPath) as! HomeCell
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
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
