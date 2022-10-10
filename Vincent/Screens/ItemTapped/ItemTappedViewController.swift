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

    // TODO: dynamic size로 변경 필요
    lazy private var baseScrollView = UIScrollView(frame: .zero).then {
        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 200)
        $0.backgroundColor = .white
        $0.frame = view.bounds
        $0.contentSize = scrollContentViewSize
    }

    lazy private var baseScrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .white
        $0.frame.size = baseScrollView.frame.size
    }

    private let images: [UIImage?] = [UIImage(named: "i1"), UIImage(named: "i2"), UIImage(named: "i3"), UIImage(named: "i4")]

    private var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = images.count
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .mainYellow
        return pageControl
    }()

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

    private let titleTextView = UITextView().then {
        $0.text = "밑단 찢어진 가봉 마네킹 / 2줄 테스트 2줄 테스트 2줄 테스트 2줄 테스트 "
        $0.isScrollEnabled = false
        $0.font = .systemFont(ofSize: 20)
    }

    private let dayLabel = UILabel().then {
        $0.text = "3일전"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray4
    }

    private let descriptionTextView = UITextView().then {
        $0.text = "여기까지, 기본적으로 NavigationBar를 Custom 할 수 있는 간단한 방법들을 알아봤어요. 더욱 자세한 소스는 Github에 업로드 했으니 참고해주세요. 그리고 한 가지 더! NavigationBar를 Clear로 했을 경우 화면이 Push 되거나 뒤로 돌아갈 NavigationBar 옆부분에도 Shadow가 생긴다는 사실! 소스에서 보면 TableViewTop 기준이 superViewTop인지, view.Top 인지에 따라서 NavigationBar 옆쪽 Shadow 유무 등등.. 다양하게 조절할 수 있으니 코드를 바꿔보면서 테스트 하면 될 것 같아요. 😉"
        $0.font = .systemFont(ofSize: 16)
        $0.isScrollEnabled = false
    }

    private let firstSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let secondSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let sellerInformationCell = UIView()

    private let sellerNickName = UILabel().then {
        $0.text = "오니기리멘"
        $0.font = .systemFont(ofSize: 16)
    }

    private let sellerInformation = UILabel().then {
        $0.text = "거래수:3 / 팔고 있는 물품 4"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray4
    }

    private let sellerProfileImage = UIImageView().then {
        $0.image = UIImage(named: "Ken")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private let backButtonImage = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
    }

    // layout
    override func render() {
        //baseScroll
        view.addSubviews(baseScrollView, bottomUIView)
        baseScrollView.addSubview(baseScrollContentView)

        //baseScrollContentView
        baseScrollContentView.addSubviews(imageScrollView, pageControl,titleTextView, dayLabel, descriptionTextView, firstSeperator, secondSeperator, sellerInformationCell)

        //imageScrollView
        imageScrollView.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalTo(baseScrollContentView.snp.top)
        }

        //pageControl
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(imageScrollView.snp.bottom).inset(15)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
        }

        //titleTextView
        titleTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(70)
            $0.top.equalTo(imageScrollView.snp.bottom).offset(30)
        }

        //dayLabel
        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(titleTextView)
            $0.top.equalTo(titleTextView.snp.bottom)
        }

        firstSeperator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dayLabel.snp.bottom).offset(30)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        descriptionTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(200)
            $0.top.equalTo(firstSeperator).offset(20)
        }

        secondSeperator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(30)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        sellerInformationCell.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondSeperator).offset(3)
            $0.width.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }

        sellerInformationCell.addSubviews(sellerProfileImage, sellerNickName, sellerInformation, backButtonImage)

        sellerProfileImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }

        sellerNickName.snp.makeConstraints {
            $0.leading.equalTo(sellerProfileImage.snp.trailing).offset(10)
            $0.top.equalTo(sellerProfileImage)
        }

        sellerInformation.snp.makeConstraints {
            $0.leading.equalTo(sellerNickName)
            $0.top.equalTo(sellerNickName.snp.bottom).offset(10)
        }

        backButtonImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }

        //bottomUI
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
        configureScrollView()
    }

    private func setFunctionAndDelegate() {

        //addTarget
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)

        //set delegate
        imageScrollView.delegate = self
    }

    private func configureScrollView() {
        imageScrollView.contentSize.width = view.frame.width * CGFloat(images.count)

        for pageIndex in 0..<images.count {
            let imageView = UIImageView()
            let xPositionOrigin = self.view.frame.width * CGFloat(pageIndex)
            imageView.frame = CGRect(x: xPositionOrigin, y: 0, width: view.bounds.width, height: 300)
            imageView.backgroundColor = .orange
            imageView.image = images[pageIndex]
            imageScrollView.addSubview(imageView)
        }
    }

    private func selectedPage(_ currentPage: Int) {
        pageControl.currentPage = currentPage
    }
}

//obcj func
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

    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        imageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
}

//delegate
extension ItemTappedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let size = scrollView.contentOffset.x / scrollView.frame.size.width
        selectedPage(Int(round(size)))
    }
}


