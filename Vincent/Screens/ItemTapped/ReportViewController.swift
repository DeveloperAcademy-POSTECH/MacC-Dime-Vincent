//
//  ReportViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/12.
//
import SnapKit
import UIKit
import Then

class ReportViewControlelr: BaseViewController {

    private let reportUIView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    private let reportLabel = UILabel().then {
        $0.text = "신고하기"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }

    private let reportTextView = UITextView().then {
        $0.backgroundColor = .systemGray5
        $0.text = "신고 내용을 구체적으로 적어주세요!"
        $0.textColor = .systemGray2
    }

    private let submitButton = UIButton(configuration: .filled()).then {
        $0.tintColor = .mainYellow
        $0.setTitle("제출하기", for: .normal)
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title3)

    private lazy var dismissButton = UIButton().then {
        $0.setImage(UIImage(systemName: "multiply", withConfiguration: symbolConfiguration), for: .normal)
        $0.tintColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionsAndDelegate()
    }

    override func render() {
        view.addSubview(reportUIView)
        reportUIView.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.width.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }

        reportUIView.addSubviews(reportLabel, reportTextView, submitButton, dismissButton)

        reportLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reportUIView.safeAreaLayoutGuide).offset(20)
        }

        dismissButton.snp.makeConstraints {
            $0.centerY.equalTo(reportLabel.snp.centerY)
            $0.trailing.equalTo(reportTextView.snp.trailing)
        }

        reportTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reportLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview().inset(30)
            $0.height.equalTo(150)
        }

        submitButton.snp.makeConstraints {
            $0.top.equalTo(reportTextView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }

    override func configUI() {
        view.backgroundColor = .black.withAlphaComponent(0.7)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        reportUIView.layer.cornerRadius = reportUIView.frame.width / 12
    }

    private func addActionsAndDelegate() {
        dismissButton.addTarget(self, action: #selector(didPressDismissButton(_:)), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(didPressSubmitButton(_:)), for: .touchUpInside)
        reportTextView.delegate = self
    }

    @objc func didPressSubmitButton(_ sender: UIButton) {
        print("submit")
    }

    @objc func didPressDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ReportViewControlelr: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        reportTextView.text = ""
        reportTextView.textColor = .black
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if reportTextView.text.isEmpty {
            reportTextView.text = "신고 내용을 구체적으로 적어주세요!"
            reportTextView.textColor = .systemGray2
        }
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        true
    }
}
