//
//  CategoryViewController.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/09.
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
    private let screenText = UILabel().then {
        $0.textColor = .red
        $0.text = "홈"
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
        view.addSubview(wallPaper)
        view.addSubview(screenText)
        view.addSubview(twoDimensionalArtBtn)
        view.addSubview(digitalDrawingBtn)
        view.addSubview(canvasBtn)
        view.addSubview(potteryBtn)
        view.addSubview(metalArtBtn)
        view.addSubview(textileFashionBtn)
        view.addSubview(artBooksBtn)
        view.addSubview(draftingSuppliesBtn)
        view.addSubview(papersBtn)
        view.addSubview(woodenArtBtn)
        view.addSubview(easelBtn)
        view.addSubview(etcBtn)
        view.addSubview(flowerImage)
        // MARK: - wallpaper를 임시로 safeAreaLayoutGuide에 맞춰 만들었습니다.
        wallPaper.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        twoDimensionalArtBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        digitalDrawingBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(twoDimensionalArtBtn.snp.trailing).offset(20)
        }
        canvasBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(digitalDrawingBtn.snp.trailing).offset(20)
        }
        potteryBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        metalArtBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            $0.leading.equalTo(potteryBtn.snp.trailing).offset(20)
        }
        textileFashionBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(twoDimensionalArtBtn.snp.bottom).offset(20)
            $0.leading.equalTo(metalArtBtn.snp.trailing).offset(20)
        }
        artBooksBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        draftingSuppliesBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.leading.equalTo(artBooksBtn.snp.trailing).offset(20)
        }
        papersBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(potteryBtn.snp.bottom).offset(20)
            $0.leading.equalTo(draftingSuppliesBtn.snp.trailing).offset(20)
        }
        woodenArtBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        easelBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.leading.equalTo(woodenArtBtn.snp.trailing).offset(20)
        }
        etcBtn.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(65)
            $0.top.equalTo(artBooksBtn.snp.bottom).offset(20)
            $0.leading.equalTo(easelBtn.snp.trailing).offset(20)
        }
        flowerImage.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(200)
            $0.bottom.equalTo(view.snp.bottom).offset(-100)
            $0.centerX.equalToSuperview()
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
        CategoryViewController()
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
