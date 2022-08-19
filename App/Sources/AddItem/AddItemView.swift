//
//  AddItemView.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI

struct AddItemView: View {
    @State private var inputedName: String = ""
    @State private var names: [Gashapon.Name] = []
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("이름 추가하기")) {
                    TextField("", text: $inputedName, prompt: Text("추가할 이름 입력"))
                    Button("이름 추가하기") {
                        guard false == inputedName.isEmpty else { return }
                        guard false == names.contains(where: { $0.name == inputedName }) else { return }
                        names.append(.init(name: inputedName))
                        inputedName = ""
                    }
                }
                
                if names.count > 0 {
                    Section(
                        footer: Text("위 버튼을 누르면 매우 공정하게 랜덤 추첨됩니다.")
                    ) {
                        NavigationLink {
                            ResultView(names: names)
                        } label: {
                            Button("추첨하기") {}
                        }
                    }
                    
                    Section(header: Text("추가된 이름")) {
                        ForEach(names) { item in
                            HStack {
                                Text("\(item.name)")
                                Spacer()
                                Button(role: .destructive) {
                                    names.removeAll(where: { $0.id == item.id })
                                } label: {
                                    Image(systemName: "xmark")
                                }
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Gashapon")
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
