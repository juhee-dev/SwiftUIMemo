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
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                // VStack: 수직으로 정렬
                // alignment: .leading: 왼쪽 정렬
                VStack(alignment: .leading) {
                    Text(memo.content)
                        .font(.body)
                        // 메모 내용을 한줄만 보여주고 나머지는 생략 처리
                        .lineLimit(1)
                    
                    Text(memo.insertDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
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
