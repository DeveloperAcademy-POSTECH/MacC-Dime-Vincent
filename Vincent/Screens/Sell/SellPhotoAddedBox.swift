//
//  SellPhotoBox.swift
//  Vincent
//
//  Created by KYUBO A. SHIM on 2022/10/11.
//

import UIKit
import SnapKit
import Then

class SellPhotoAddedBox: UICollectionViewCell {

    let addedImage = UIImageView().then {
        $0.backgroundColor = .yellow
        $0.contentMode = .scaleAspectFill
    }
    
    let deleteImageButton = UIButton(type: .system).then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        $0.tintColor = .red
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateConstraints()
    }
    
    override func updateConstraints() {
        render()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configUI()
    }
    
    func render() {
        self.addSubviews(addedImage, deleteImageButton)
        
        addedImage.translatesAutoresizingMaskIntoConstraints = false
        addedImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        NSLayoutConstraint.activate([
            addedImage.widthAnchor.constraint(equalTo: self.addedImage.heightAnchor, multiplier: 1.0/1.0)
        ])
        
        deleteImageButton.snp.makeConstraints {
            $0.centerX.equalTo(self.addedImage.snp.right).inset(10)
            $0.centerY.equalTo(self.addedImage.snp.top).inset(10)
        }
        deleteImageButton.widthAnchor.constraint(equalTo: self.deleteImageButton.heightAnchor, multiplier: 1.0/1.0).isActive = true
    }
    
    func configUI() {
        self.addedImage.layer.cornerRadius = self.addedImage.frame.width/5
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
