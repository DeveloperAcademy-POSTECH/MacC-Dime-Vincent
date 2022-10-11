//
//  HomeViewController.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/11.
//

import UIKit

final class HomeViewController: BaseViewController {
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
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 10
    }
    override func render() {
        view.addSubviews(helloLabel, vincentLabel, profileImage)
        helloLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(30)
        }
        vincentLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(60)
        }
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.trailing.equalTo(-20)
            $0.top.equalTo(60)
        }
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
