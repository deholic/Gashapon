//
//  ContentView.swift
//  Gashapon
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AddItemView()
                .navigationBarTitleDisplayMode(.inline)
            IntroductionView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.init(rawValue: "iPhone 13 Pro"))
            ContentView()
                .previewDevice(.init(rawValue: "iPad mini (6th generation)"))
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
