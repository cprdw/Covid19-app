//
//  ContentView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection){
            HelpView()
                .tabItem {
                    VStack {
                        Image(systemName: "staroflife")
                        Text("Health")
                    }
            }
            .tag(0)
            InfoView()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle")
                        Text("Info")
                    }
            }
            .tag(1)
            
            Home()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }
            .tag(2)
            FavoritesView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("All")
                    }
            }
            .tag(3)
            
            
            AllDataView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar.fill")
                        Text("World")
                    }
            }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
