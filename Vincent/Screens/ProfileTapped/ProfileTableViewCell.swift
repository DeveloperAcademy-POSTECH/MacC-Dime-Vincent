//
//  ProfileTableViewCell.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/11.
//
import SnapKit
import UIKit
import Then

final class ProfileTableViewCell: UITableViewCell {

    private let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)

    private var isUserProfileCell: Bool = false

    private var cellTextLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .white
    }
    //MyProfile
    private let userProfileImage = UIImageView().then {
        $0.image = UIImage(systemName: "drop")
    }
    private let userNickName = UILabel().then {
        $0.textColor = .white
        $0.text = "다임다임"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    private let userID = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.text = "@zdshld2134"
    }

    lazy private var chevronImage = UIImageView().then {
        $0.image = ImageLiteral.btnFoward
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }

    var cellSpacing: CGFloat = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func render() {
        contentView.addSubviews(userProfileImage, userNickName, userID, cellTextLabel,chevronImage)
        if isUserProfileCell {
            contentView.addSubviews(userProfileImage, userNickName, userID,chevronImage)
        } else {
            contentView.addSubview(cellTextLabel)
        }
        contentView.backgroundColor = .mainBlack
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: cellSpacing, right: 0))

        chevronImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }

        //layout
        if isUserProfileCell {
            userProfileImage.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(20)
                $0.width.height.equalTo(40)
            }

            userNickName.snp.makeConstraints {
                $0.top.equalTo(userProfileImage)
                $0.leading.equalTo(userProfileImage.snp.trailing).offset(7)
            }

            userID.snp.makeConstraints {
                $0.leading.equalTo(userNickName)
                $0.top.equalTo(userNickName.snp.bottom).offset(2)
            }
        } else {
            cellTextLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(20)
            }
        }
    }

    func setupCellData(_ text: String, spacing: Int, isUserProfileCell: Bool) {
        self.isUserProfileCell = isUserProfileCell
        self.cellTextLabel.text = text
        self.cellSpacing = CGFloat(spacing)

        if isUserProfileCell {
            userNickName.textColor = .black
            userID.textColor = .black
            contentView.backgroundColor = .white
            chevronImage.tintColor = .black
        }
    }
}
