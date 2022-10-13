//
//  SellPhotoTapAddBox.swift
//  Vincent
//
//  Created by KYUBO A. SHIM on 2022/10/11.
//

import UIKit
import SnapKit
import Then

final class SellPhotoTapAddBox: UIView {
    
    private let cameraImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
        $0.image = UIImage(systemName: "camera.fill")
    }
    
    private let infoTitle = UILabel().then {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.preferredFont(forTextStyle: .footnote, weight: .semibold)
        $0.textColor = .black
        $0.text = "눌러서\n사진 올리기"
    }
    
    private let stackView = UIStackView().then {
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 3
        $0.spacing = -5
        $0.backgroundColor = .white
        $0.axis = .vertical
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func updateConstraints() {
        render()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configUI()
    }
    
    private func render(){
        stackView.addArrangedSubview(cameraImage)
        stackView.addArrangedSubview(infoTitle)
        
        self.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 1.0/1.0)
        ])
        
        cameraImage.snp.makeConstraints {
            $0.top.equalTo(15)
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(3.8)
        }
        
        infoTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.cameraImage.snp.bottom)
        }
    }
    
    private func configUI() {
        self.stackView.layer.cornerRadius = self.stackView.frame.width/5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
