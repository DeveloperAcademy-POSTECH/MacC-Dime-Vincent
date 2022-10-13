//
//  ProfileTappedViewController.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/11.
//
import SnapKit
import UIKit
import Then

final class ProfileTappedViewController: BaseViewController {
    private let testHeaderTitle = ["내 프로필", "내 활동", "문의"]
    private let userProfileCell = UIView(frame: .zero)
    private let userNickName = UILabel().then {
        $0.text = "다임다임"
    }

    private let userID = UILabel().then {
        $0.text = "@zdshld2134"
    }

    private let profileTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.rowHeight = 70
        $0.showsVerticalScrollIndicator = false
        $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.className)
        $0.tableFooterView = UIView(frame: .zero)
    }

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    private let wallPaper = UIImageView().then {
        $0.image = UIImage(named: "wallpaperNone")
        $0.contentMode = .scaleAspectFit
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        setFunctionsAndDelegate()
    }

    override func render() {
        view.addSubviews(wallPaper, profileTableView)
        wallPaper.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        profileTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setFunctionsAndDelegate() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
}

extension ProfileTappedViewController: UITableViewDataSource {
    //cell control
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.className, for: indexPath) as! ProfileTableViewCell
        cell.backgroundColor = .clear

        switch ProfileSection(rawValue: indexPath.section) {
        case .profileInformation:
            cell.setupCellData(ProfileSection.profileInformation.sectionOption[indexPath.row], spacing: 0, isUserProfileCell: true)
        case .myActivity:
            cell.setupCellData(ProfileSection.myActivity.sectionOption[indexPath.row], spacing: 5, isUserProfileCell: false)
        case .service:
            cell.setupCellData(ProfileSection.service.sectionOption[indexPath.row], spacing: 5, isUserProfileCell: false)
        case .none:
            print("default")
        }

        cell.selectedBackgroundView = UIView(frame: .zero)
        return cell
    }
}

extension ProfileTappedViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ProfileSection(rawValue: section) {
        case .profileInformation: return MyProfile.allCases.count
        case .myActivity: return MyActivities.allCases.count
        case .service: return ServiceOption.allCases.count
        case .none:
            return 0
        }
    }

    //section number
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return testHeaderTitle.count
    }

    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        testHeaderTitle[section]
    }
}



