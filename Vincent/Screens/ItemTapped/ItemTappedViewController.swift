//
//  ItemTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/09.
//
import SnapKit
import UIKit
import Then

class ItemTappedViewController: BaseViewController {

    private let testLabel = UILabel().then {
        $0.text = "Image would be here"
    }

    private let bottomUIView = UIView(frame: .zero).then {
        $0.backgroundColor = .mainBlack
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    private lazy var likeButton = UIButton().then {
        let image = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        $0.setImage(image, for: .normal)
        $0.tintColor = .white
    }

    // TODO: 추후 setTitle부분에 변수가 들어가야함
    private let buyButton = UIButton().then {
        $0.setTitle("33000원에 살게요", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .mainYellow
        $0.layer.cornerRadius = 15
    }


    // TODO: dynamic size로 변경 필요
    lazy private var scrollView = UIScrollView(frame: .zero).then {
        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 400)
        $0.backgroundColor = .systemBlue
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    lazy private var scrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .orange
        $0.frame.size = scrollView.frame.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
    }

    // layout
    override func render() {
        //scroll
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)

        scrollContentView.addSubviews(testLabel, bottomUIView)
        testLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollContentView.snp.centerX)
            $0.top.equalTo(scrollContentView.snp.top).offset(100)
        }

        bottomUIView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(116)
            $0.width.equalToSuperview()
        }

        bottomUIView.addSubviews(buyButton, likeButton)
        likeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        buyButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
    }
    // configuration
    override func configUI() {
    }

    private func setFunctionAndDelegate() {
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)
    }
}

extension ItemTappedViewController {
    @objc func didPressLikeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart", withConfiguration: symbolConfiguration), for: .normal)
        }
    }

    @objc func didPressBuyButton(_ sender: UIButton) {
        print("should navigate to ChatView")
    }
}


