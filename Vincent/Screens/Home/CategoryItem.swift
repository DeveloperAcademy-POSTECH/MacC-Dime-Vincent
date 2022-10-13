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
