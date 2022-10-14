//
//  CategoryItem.swift
//  Vincent
//
//  Created by Taehwan Kim on 2022/10/13.
//

import Foundation

// MARK: 데이터가 Closed Set인것을 감안하여 Heap의 Reference Counting overhead 발생을 방지하였습니다.

enum CategoryType: String {
    case twoDimensionalArt = "평면예술"
    case digitalDrawing = "디지털드로잉"
    case canvas = "캔버스"
    case pottery = "도예예술"
    case metalArt = "금속예술"
    case textileFashion = "섬유패션"
    case artBooks = "예술서적"
    case draftingSupplies = "제도용품"
}

struct CategoryItem:Hashable {
    let name: CategoryType
    let imageName: String
    
    init?(name: String, imageName: String) {
        guard let name = CategoryType(rawValue: name) else { return nil }
        self.name = name
        self.imageName = imageName
    }
}

// MARK: 아래의 Extension으로 Category의 데이터를 생성합니다. UI를 담당하는 요소이기 때문에 적절한 imageName의 수정이 있다면 수정되어도 상관없을듯 합니다.

extension CategoryItem {
    static let list = [
        CategoryItem(name: "평면예술", imageName: "note.text"),
        CategoryItem(name: "디지털드로잉", imageName: "note.text"),
        CategoryItem(name: "캔버스", imageName: "note.text"),
        CategoryItem(name: "도예예술", imageName: "note.text"),
        CategoryItem(name: "금속예술", imageName: "note.text"),
        CategoryItem(name: "섬유패션", imageName: "note.text"),
        CategoryItem(name: "예술서적", imageName: "note.text"),
        CategoryItem(name: "제도용품", imageName: "note.text")
    ]
}
