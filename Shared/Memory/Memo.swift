//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by juhee on 2022/08/21.
//

import Foundation
import SwiftUI

// Identifiable: data를 list에 쉽게 binding하기 위해
// ObservableObject: 메모를 편집할 때 view를 자동으로 update하기 위해
class Memo: Identifiable, ObservableObject {
    // Identifiable이 요구하는 속성
    let id: UUID
    // @Published: 새로운 값을 저장할 때마다 binding되어있는 UI가 자동으로 update
    // 메모를 저장
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
