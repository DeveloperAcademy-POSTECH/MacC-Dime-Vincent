//
//  CategoryViewController.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/10.
//

import UIKit
import SnapKit
import Then

final class CategoryViewController: BaseViewController {

    // MARK: - property
    private let wallPaper = UIImageView().then {
        $0.image = UIImage(named: "wallpaperNone")
        $0.contentMode = .scaleAspectFit
    }
    private let twoDimensionalArtBtn = UIButton(type: .system).then {
        $0.setTitle("평면예술", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let digitalDrawingBtn = UIButton(type: .system).then {
        $0.setTitle("디지털 드로잉", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let canvasBtn = UIButton(type: .system).then {
        $0.setTitle("캔버스", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let potteryBtn = UIButton(type: .system).then {
        $0.setTitle("도예예술", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let metalArtBtn = UIButton(type: .system).then {
        $0.setTitle("금속예술", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let textileFashionBtn = UIButton(type: .system).then {
        $0.setTitle("섬유패션", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let artBooksBtn = UIButton(type: .system).then {
        $0.setTitle("도예예술", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let draftingSuppliesBtn = UIButton(type: .system).then {
        $0.setTitle("제도용품", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let papersBtn = UIButton(type: .system).then {
        $0.setTitle("지류", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let woodenArtBtn = UIButton(type: .system).then {
        $0.setTitle("목조예술", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let easelBtn = UIButton(type: .system).then {
        $0.setTitle("이젤", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let etcBtn = UIButton(type: .system).then {
        $0.setTitle("기타", for: .normal)
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    private let flowerImage = UIImageView().then {
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 100
    }
    // MARK: - rendering
    override func render() {
        view.addSubviews(wallPaper, twoDimensionalArtBtn, digitalDrawingBtn, canvasBtn, potteryBtn, metalArtBtn, textileFashionBtn, artBooksBtn, draftingSuppliesBtn, papersBtn, woodenArtBtn, easelBtn, etcBtn, flowerImage)
        // MARK: - wallpaper를 임시로 safeAreaLayoutGuide에 맞춰 만들었습니다.
        wallPaper.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        twoDimensionalArtBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalTo(digitalDrawingBtn.snp.leading).dividedBy(1.12)
        }
        digitalDrawingBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        canvasBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(digitalDrawingBtn.snp.trailing).dividedBy(0.942)
        }
        potteryBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            $0.trailing.equalTo(digitalDrawingBtn.snp.leading).dividedBy(1.12)
        }
        metalArtBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            //$0.leading.equalTo(potteryBtn.snp.trailing).offset(20)
        }
        textileFashionBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            $0.leading.equalTo(metalArtBtn.snp.trailing).dividedBy(0.942)
        }
        artBooksBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.trailing.equalTo(digitalDrawingBtn.snp.leading).dividedBy(1.12)
        }
        draftingSuppliesBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        papersBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.leading.equalTo(draftingSuppliesBtn.snp.trailing).dividedBy(0.942)
        }
        woodenArtBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.trailing.equalTo(digitalDrawingBtn.snp.leading).dividedBy(1.12)
        }
        easelBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        etcBtn.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3.7)
            $0.height.equalToSuperview().dividedBy(13)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.leading.equalTo(easelBtn.snp.trailing).dividedBy(0.942)
        }
        flowerImage.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(1.8)
            $0.height.equalToSuperview().dividedBy(4)
            $0.bottom.equalTo(view.snp.bottom).offset(-100)
            $0.centerX.equalToSuperview()
            viewWillLayoutSubviews()
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        flowerImage.layer.cornerRadius = flowerImage.frame.size.height / 2
    }
}

//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        //empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> some UIViewController {
//        CategoryViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct SnapkitVCRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewControllerRepresentable()
//                .previewDisplayName("Preview")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//    }
//}
//#endif
