//
//  ProfileEnumeration.swift
//  Vincent
//
//  Created by Jisu Jang on 2022/10/11.
//

import Foundation

enum MyActivities: String, CaseIterable {
    case registeredItem = "내가 등록한 상품"
    case likeItem = "내가 찜한 상품"
    case reservesItem = "예약 중인 상품"
    case keyWords = "키워드 설정"
}

enum ServiceOption: String, CaseIterable {
    case consult = "1:1 문의하기"
    case serviceInformation = "서비스 정보"
}

enum MyProfile: String, CaseIterable {
    case information = "내 프로필"
}

enum ProfileSection: Int {
    case profileInformation
    case myActivity
    case service

    var sectionOption: [String] {
        switch self {
        case .profileInformation:
            return ["내 프로필"]
        case .service:
            return ["1:1 문의하기", "서비스 정보"]
        case .myActivity:
            return ["내가 등록한 상품", "내가 찜한 상품", "예약 중인 상품", "키워드 설정"]
        }
    }
}
