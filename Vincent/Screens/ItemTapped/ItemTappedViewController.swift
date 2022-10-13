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


    private let reportEarImage = UIImage(systemName: "ear.trianglebadge.exclamationmark")!

    private let shareImage  = UIImage(systemName: "square.and.arrow.up")!

    lazy private var reportButton = UIButton(frame: CGRect(x: 0, y: 0, width: reportEarImage.size.width, height: reportEarImage.size.height)).then {
        $0.tintColor = .black
        $0.setImage(reportEarImage, for: .normal)
    }

    lazy private var shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: shareImage.size.width, height: shareImage.size.height)).then {
        $0.tintColor = .black
        $0.setImage(shareImage, for: .normal)
    }

    lazy private var reportNavigationBarItem = UIBarButtonItem(customView: reportButton)

    lazy private var shaareNavigationBarItem = UIBarButtonItem(customView: shareButton)

    private let testLabel = UILabel().then {
        $0.text = "Image would be here"

    // TODO: dynamic size로 변경 필요
    lazy private var baseScrollView = UIScrollView(frame: .zero).then {
//        var scrollContentViewSize = CGSize(width: view.frame.width, height: view.frame.height)
        $0.backgroundColor = .white
        $0.frame = view.bounds
//        $0.contentSize = scrollContentViewSize
    }

    lazy private var baseScrollContentView = UIView(frame: .zero).then {
        $0.backgroundColor = .white
        $0.frame.size = baseScrollView.frame.size
    }

    private let images: [UIImage?] = [UIImage(named: "i1"), UIImage(named: "i2"), UIImage(named: "i3"), UIImage(named: "i4")]

    private var imageScrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.isScrollEnabled = true
    }

    private lazy var pageControl = UIPageControl().then {
        $0.numberOfPages = images.count
        $0.backgroundColor = .clear
        $0.pageIndicatorTintColor = .gray
        $0.currentPageIndicatorTintColor = .mainYellow
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

    private let titleTextView = UITextView().then {
        $0.text = "루키의 물건들 가격 제안 가능!! 10000만원 이상 부터 "
        $0.isScrollEnabled = false
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.isUserInteractionEnabled = false
    }

    private let dayLabel = UILabel().then {
        $0.text = "3일전"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray4
    }

    private let descriptionTextView = UITextView().then {
        let text: String = "여기까지, 기본적으로 NavigationBar를 Custom 할 수 있는 간단한 방법들을 알아봤어요. 더욱 자세한 소스는 Github에 업로드 했으니 참고해주세요. 그리고 한 가지 더! NavigationBar를 Clear로 했을 경우 화면이 Push 되거나 뒤로 돌아갈 NavigationBar 옆부분에도 Shadow가 생긴다는 사실! 소스에서 보면 TableViewTop 기준이 superViewTop인지, view.Top 인지에 따라서 NavigationBar 옆쪽 Shadow 유무 등등.. 다양하게 조절할 수 있으니 코드를 바꿔보면서 테스트 하면 될 것 같아요. 😉"
        $0.setLineAndLetterSpacing(text)
        $0.font = .systemFont(ofSize: 16)
        $0.isScrollEnabled = false
        $0.isUserInteractionEnabled = false
    }

    private let firstSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let secondSeperator = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    private let sellerInformationCell = UIView().then {
        $0.isUserInteractionEnabled = true

    }

    private let sellerNickName = UILabel().then {
        $0.text = "해커켄"
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
        $0.tintColor = .systemGray2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setFunctionAndDelegate()
        navigationItem.rightBarButtonItems = [shaareNavigationBarItem, reportNavigationBarItem]
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
            $0.height.equalTo(40).priority(250)
            $0.top.equalTo(imageScrollView.snp.bottom).offset(30)
        }

        //dayLabel
        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(titleTextView).inset(5)
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
            $0.height.equalTo(10).priority(250)
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
            $0.top.equalTo(secondSeperator).offset(5)
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
            $0.top.equalTo(sellerNickName.snp.bottom).offset(5)
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        baseScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + descriptionTextView.bounds.height / 3)
    }

    private func setFunctionAndDelegate() {

        //addTarget
        likeButton.addTarget(self, action: #selector(didPressLikeButton(_:)), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(didPressBuyButton(_:)), for: .touchUpInside)

        reportButton.addTarget(self, action: #selector(didPressReportButton(_:)), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didPressShareButton(_:)), for: .touchUpInside)

        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)

        //set delegate
        imageScrollView.delegate = self

        //set TapGesture
        sellerInformationCell.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(didTapSellerInformationCell(_:))))
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


    @objc func didPressReportButton(_ sender:UIBarButtonItem) {
        let presentedViewController = ReportViewControlelr()
        presentedViewController.modalPresentationStyle = .overFullScreen
        presentedViewController.modalTransitionStyle = .crossDissolve
        present(presentedViewController, animated: true)
    }

    @objc func didPressShareButton(_ sender:UIBarButtonItem) {
        print("share")

    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        imageScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }

    @objc func didTapSellerInformationCell(_ sender: UITapGestureRecognizer) {
        print("should navigate to SellerView")

    }
}

//delegate
extension ItemTappedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let size = scrollView.contentOffset.x / scrollView.frame.size.width
        selectedPage(Int(round(size)))
    }
}

// 예상 모델
struct ItemInformation: Identifiable {
    let id: String
    let images: [Data]
    let titleText: String
    let dayText: Date
    let descritionText: String
    let sellerProfileImage: Data
    let sellerNickName: String
    let sellerInformation: String
}
