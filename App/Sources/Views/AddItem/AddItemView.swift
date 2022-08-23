//
//  AddItemView.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI

struct AddItemView: View {
    @State private var inputedName: String = ""
    @State private var randCountText: String = "100"
    @State private var names: [Gashapon.Name] = []
    @State private var useRandomRollCount = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("이름 추가하기")) {
                    TextField("", text: $inputedName, prompt: Text("추가할 이름 입력"))
                        .onSubmit {
                            addNewName()
                        }
                        .submitLabel(.done)
                        
                    Button("이름 추가하기") { addNewName() }
                }
                
                if names.count > 0 {
                    Section(
                        footer: Text("위 버튼을 누르면 매우 공정하게 랜덤 추첨됩니다.")
                    ) {
                        NavigationLink {
                            ResultView(
                                names: names,
                                rollCount: getRollCount()
                            )
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
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                
                Section(
                    header: Text("롤 카운트 설정"),
                    footer: Text("롤 카운트 랜덤 설정을 한 경우 롤 횟수를 1~100 사이의 숫자로 임의 설정합니다.")
                ) {
                    TextField("\(randCountText)", text: $randCountText, prompt: Text("100"))
                        .foregroundColor(useRandomRollCount ? .gray : Color(UIColor.label))
                        .keyboardType(.numberPad)
                        .disabled(useRandomRollCount)
                    Toggle("롤 카운트 랜덤 설정", isOn: $useRandomRollCount)
                }
            }
        }.navigationTitle("Gashapon")
    }
}

extension AddItemView {
    private func getRollCount() -> Int {
        if useRandomRollCount {
            return Int.random(in: 0...100)
        } else {
            return Int(randCountText) ?? 100
        }
    }
    
    private func addNewName() {
        guard false == inputedName.isEmpty else { return }
        guard false == names.contains(where: { $0.name == inputedName }) else { return }
        names.append(.init(name: inputedName))
        inputedName = ""
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .previewDevice(.init(rawValue: "iPhone 13 mini"))
    }
}
