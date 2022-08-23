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
    
    // 여기에 memo가 전달되면 편집모드, 그렇지 않으면 쓰기모드
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    // context를 binding
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // 입력한 내용이 content에 자동 저장됨. 반대로 content에 값을 저장하면 TextEditor에서 보여짐
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모편집" : "새 메모")
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
                        if let memo = memo {
                            // 메모 편집
                            store.update(memo: memo, content: content)
                        } else {
                            // 새 메모를 저장소에 저장
                            store.insert(memo: content)
                        }
                        
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
