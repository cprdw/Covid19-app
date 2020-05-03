//
//  FavoritesView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @State var showState = 0
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack {
                
                Picker(selection: $showState, label: Text("")) {
                    Text("Country").tag(0)
                    
                    Text("State").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
                
                
                if showState == 0 {
                    HStack {
                        Text("Saved:")
                        .padding()
                        
                        Spacer()
                    }
                    VStack {
                        SavedView2()
                    }
                    .frame(width: (screen.width) - 50)
                    .background(Color("backing"))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
                    
                    HStack {
                        Text("All:")
                        .padding()
                        
                        Spacer()
                    }

                    List(1 ..< sortedLocations.count) { val in
                        NavigationLink(destination: CountryView(location: sortedLocations[val])) {
                            Text(sortedLocations[val].country_name)
                        }
                        
                        
                        
                    }
                    
                    
                    
                }
                else {
                    HStack {
                        Text("Saved:")
                        .padding()
                        
                        Spacer()
                    }

                    VStack {
                        SavedView()
                    }
                    .frame(width: (screen.width) - 50)
                    .background(Color("backing"))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
                    
                    HStack {
                        Text("All:")
                        .padding()
                        
                        Spacer()
                    }

                    List {
                        ForEach(0 ..< sortedStates.count) { val in
                            NavigationLink(destination: StateView(state: sortedStates[val])) {
                                Text(sortedStates[val].state_name)
                            }
                            
                        }
                    }
                    
                    
                }
                
                
                
                
                
                
            }
            .navigationBarTitle("All Locations")
            .navigationBarItems(trailing: EditButton())
            
            
            
        }
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

struct countryOption: View {
    @Binding var savedCountries: [location]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Form {
            Group {
                Section (header: Text("Saved:").font(.headline)){
                    //                    List (0 ..< userData.savedCountry.count) { val in
                    //                        ForEach(0 ..< allLocations.count) { second in
                    //                            if allLocations[second].country_name == self.savedCountries[val].country_name {
                    //                                NavigationLink(destination: CountryView(location: allLocations[second], savedCountries: self.$savedCountries)) {
                    //                            Text(self.savedCountries[val].country_name)
                    //                        }
                    //                            }
                    //                    }
                    //
                    //                    }
                    
                    List(0 ..< userData.savedCountry.count) { val in
                        Text(self.userData.savedCountry[val].country_name)
                        
                    }
                }
            }
            
            Group {
                Section (header:
                    Text("All").font(.headline)
                ){
                    List(1 ..< sortedLocations.count) { val in
                        NavigationLink(destination: CountryView(location: sortedLocations[val])) {
                            Text(sortedLocations[val].country_name)
                        }
                    }
                }
            }
            
        }
        
        
    }
}

struct stateOption: View {
    @Binding var savedStates: [state]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Form {
            
            Group {
                Section (header:
                    Text("All").font(.headline)
                ){
                    ForEach(0 ..< sortedStates.count) { val in
                        NavigationLink(destination: StateView(state: sortedStates[val])) {
                            Text(sortedStates[val].state_name)
                        }
                        
                    }
                    
                    
                }
            }
            
        }
        
    }
}

