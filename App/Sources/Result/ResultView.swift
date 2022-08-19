//
//  ResultView.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI

struct ResultView: View {
    @State var names: [Gashapon.Name]
    
    @State private var animate = false
    @State private var currentSelection: Int = -1
    @State private var remainCycle: Int = 100
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(Array(names.enumerated()), id: \.element) { index, item in
                        HStack {
                            Text("\(item.name)")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(
                                    currentSelection == index ? .blue : .gray
                                )
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    Color(currentSelection == index ? .blue : .gray),
                                    lineWidth: 3
                                )
                        })
                        .padding(.horizontal, 15)
                    }
                }
            }
            
            Text("Remain Cycle: \(remainCycle)")
        }
        .onReceive(timer) { _ in
            DispatchQueue.main.async {
                remainCycle = remainCycle - 1
                
                if remainCycle <= 0 {
                    timer.upstream.connect().cancel()
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
            ResultView(names: [
                .init(name: "안녕1"),
                .init(name: "안녕2"),
                .init(name: "안녕3"),
                .init(name: "안녕4"),
                .init(name: "안녕5")
            ])
        }
    }
}
