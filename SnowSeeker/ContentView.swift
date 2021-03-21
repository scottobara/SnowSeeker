//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Scott Obara on 21/3/21.
//

import SwiftUI

struct ThisListView: View {
    var body: some View {
        List(1..<100) { i in
            NavigationLink(destination: Text("New secondary \(i)")) {
                Text("Row \(i)")
                }
        }
        .listStyle(SidebarListStyle())
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Sidebar")
            ThisListView()
                .navigationBarTitle("List")
            NavigationLink(destination: Text("New secondary")) {
                    Text("Hello, World!")
                }
                .navigationBarTitle("Primary")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
