//
//  ResultView.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI
import Combine

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var names: [Gashapon.Name]
    @State var rollCount: Int
    @State var remainCycle: Int = 0
    
    @State private var animate = false
    @State private var currentSelection: Int = -1
    @State private var presentAlert = false
    
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common)
    @State private var cancellableTimer: Cancellable? = nil
    
    private let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "dice.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                    Text("\(remainCycle) / \(rollCount)")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.leading, 6)
                }
                .padding()
                .foregroundColor(.green)
                
                LazyVGrid(columns: columns) {
                    ForEach(Array(names.enumerated()), id: \.element) { index, item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(currentSelection == index ? .blue : .clear)
                            Text("\(item.name)")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(
                                    currentSelection == index ? .white : .gray
                                )
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 15)
                    }
                }
                
                Spacer()
                
                Button {
                    remainCycle = rollCount
                    timer = Timer.publish(every: 0.1, on: .main, in: .common)
                    cancellableTimer = timer.connect()
                } label: {
                    HStack {
                        Image(systemName: currentSelection == -1 ? "play" : "repeat")
                        Text(currentSelection == -1 ? "????????????" : "?????? ????????????")
                    }
                }
                .padding(.top)
            }
        }
        .onAppear(perform: {
            remainCycle = rollCount
        })
        .alert(
            Text("???????????????!"),
            isPresented: $presentAlert,
            actions: {
                Button("??????") {
                    presentationMode.wrappedValue.dismiss()
                }
            },
            message: {
                if currentSelection > 0 {
                    Text("\(names[currentSelection].name)?????? ?????????????????????.")
                } else {
                    Text("?????? ????????? ????????? ???????????????.")
                }
            }
        )
        .onReceive(timer) { _ in
            DispatchQueue.main.async {
                remainCycle = remainCycle - 1
                
                if remainCycle <= 0 {
                    cancellableTimer?.cancel()
                    presentAlert = true
                }
                
                currentSelection = (0..<names.count).randomElement()!
            }
        }
        .navigationTitle("Result")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView(
                names: [
                    .init(name: "??????1"),
                    .init(name: "??????2"),
                    .init(name: "??????3"),
                    .init(name: "??????4"),
                    .init(name: "??????5")
                ],
                rollCount: 100
            )
        }
        .previewDevice(.init(rawValue: "iPhone 13 mini"))
    }
}
