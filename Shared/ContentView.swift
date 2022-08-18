//
//  ContentView.swift
//  Shared
//
//  Created by Euigyom Kim on 2022/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AddItemView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
