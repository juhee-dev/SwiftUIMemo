//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by juhee on 2022/08/23.
//

import SwiftUI

struct ComposeView: View {
    // MemoStore 속성으로 메모 저장
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    // context를 binding
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // 입력한 내용이 content에 자동 저장됨. 반대로 content에 값을 저장하면 TextEditor에서 보여짐
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // navigationBarLeading: 왼쪽
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                // navigationBarTrailing: 오른쪽
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        // 메모 저장소에 저장
                        store.insert(memo: content)
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            // MemoStore를 custom 공유 데이터로 선언
            .environmentObject(MemoStore())
    }
}
