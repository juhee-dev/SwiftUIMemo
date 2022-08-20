//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by juhee on 2022/08/21.
//

import SwiftUI

struct MemoCell: View {
    // @ObservedObject: 메모가 update될 때마다 view가 새로 update됨
    @ObservedObject var memo: Memo
    var body: some View {
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
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
    }
}
