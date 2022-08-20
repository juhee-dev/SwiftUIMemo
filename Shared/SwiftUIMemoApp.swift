//
//  SwiftUIMemoApp.swift
//  Shared
//
//  Created by juhee on 2022/08/21.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    // 메모 저장소를 모든 view에서 사용할 수 있도록 공유데이터 속성으로 선언
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
