//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by juhee on 2022/08/21.
//

import SwiftUI

struct MainListView: View {
    // @EnvironmentObject: view가 생성되는 시점에 공유데이터 목록을 확인 후 store과 동일 타입의 속성이 있다면 속성을 해당 instance로 자동으로 초기화
    @EnvironmentObject var store: MemoStore
    
    // 화면 전환 위해
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label: {
                    MemoCell(memo: memo)
                }
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                // 오른쪽에만 버튼 생성하므로 ToolbarItemGroup에 embed하지 않아도 됨
                Button {
                    showComposer = true
                } label: {
                    // 플러스 버튼 추가
                    Image(systemName: "plus")
                }
            }
            // 바인딩한 속성, 즉 showComposer가 true면 해당 코드를 실행하고 return한 view를 카드모달로 띄운다
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            // preview에서 사용할 custom 공유데이터
            .environmentObject(MemoStore())
    }
}
