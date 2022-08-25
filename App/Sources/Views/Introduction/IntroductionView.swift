//
//  IntroductionView.swift
//  App
//
//  Created by Euigyom Kim on 2022/08/22.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 6) {
                Spacer()
                Image(systemName: "dice")
                    .resizable()
                    .frame(width: 64, height: 64, alignment: .leading)
                Text("Gashapon")
                    .font(.headline)
                    .padding(.vertical)
                Text("오른쪽 사이드바를 열어 추첨할 무언가를 입력해 주세요.")
                    .font(.subheadline)
                Text("추첨은 공정한 방식으로 이루어집니다.")
                    .font(.subheadline)
                Spacer()
            }
            Spacer()
        }
        .foregroundColor(.gray)
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
