//
//  SavedView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/11/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var userData: UserData
    var counter = 0
    var body: some View {
       // Group {
//          //  Section (header: Text("Countries:").font(.headline)){
        List {
            ForEach(savedStateList) { val in
            //ForEach(allLocations) { second in
             //   if second.country_name == val.country_name {

                NavigationLink(destination: StateView(state: self.findLocation(name: val.state_name))) {
                    Text(val.state_name)
                        
                    }

              //  }
            //}
            

            }
            .onDelete(perform: self.delete)
            .onMove(perform: self.move)
            
            
        }
        .navigationBarItems(trailing: EditButton())
        
        
        
        
        
                
                
         //   }
            
//            Section (header: Text("States:").font(.headline)){
                

            
       // }
        
        
        
    }
    
    func findLocation(name: String) -> state {
        
        for loc in allStates {
            if loc.state_name == name {
                return loc
            }
        }
        return state(state_name: "", total_cases: "", new_cases: "", total_deaths: "", new_deaths: "", active_cases: "", record_date: "")
    }
    
    func delete1(at offsets: IndexSet) {
           if let first = offsets.first {
               userData.savedCountry.remove(at: first)
           }
           // Set the global variable point to the changed list
           savedCountryList = userData.savedCountry
       }
      
       /*
        -----------------------------
        MARK: - Move Selected Country
        -----------------------------
        */
       func move1(from source: IndexSet, to destination: Int) {
    
           userData.savedCountry.move(fromOffsets: source, toOffset: destination)
          
           // Set the global variable point to the changed list
           savedCountryList = userData.savedCountry
       }
       
       func delete(at offsets: IndexSet) {
             if let first = offsets.first {
                  userData.savedState.remove(at: first)
              }
              // Set the global variable point to the changed list
              savedStateList = userData.savedState
          }
         
          /*
           -----------------------------
           MARK: - Move Selected Country
           -----------------------------
           */
          func move(from source: IndexSet, to destination: Int) {
       
              userData.savedState.move(fromOffsets: source, toOffset: destination)
              
               // Set the global variable point to the changed list
               savedStateList = userData.savedState
          }
}





struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}

struct SavedView2: View {
    @EnvironmentObject var userData: UserData
    var counter = 0
    var body: some View {
       // Group {
//          //  Section (header: Text("Countries:").font(.headline)){
        List {
            ForEach(savedCountryList) { val in
            //ForEach(allLocations) { second in
             //   if second.country_name == val.country_name {

                NavigationLink(destination: CountryView(location: self.findLocation(name: val.country_name))) {
                    item(location: val)
                        
                    }

              //  }
            //}
            

            }
            .onDelete(perform: self.delete)
            .onMove(perform: self.move)
            
            
        }
        .navigationBarItems(trailing: EditButton())
        
        
        
        
        
                
                
         //   }
            
//            Section (header: Text("States:").font(.headline)){
                

            
       // }
        
        
        
    }
    
    func delete(at offsets: IndexSet) {
           if let first = offsets.first {
               userData.savedCountry.remove(at: first)
           }
           // Set the global variable point to the changed list
           savedCountryList = userData.savedCountry
       }
      
       /*
        -----------------------------
        MARK: - Move Selected Country
        -----------------------------
        */
       func move(from source: IndexSet, to destination: Int) {
        print(destination)
        print(source)
           userData.savedCountry.move(fromOffsets: source, toOffset: destination)
          
           // Set the global variable point to the changed list
           savedCountryList = userData.savedCountry
       }
       
    func findLocation(name: String) -> location {
        
        for loc in allLocations {
            if loc.country_name == name {
                return loc
            }
        }
        return location(country_name: "", cases: "", deaths: "", region: "", total_recovered: "", new_deaths: "", new_cases: "", serious_critical: "", active_cases: "", total_cases_per_1m_population: "")
    }
       
}

struct item: View {
    var location: location
    var body: some View {
        Text(location.country_name)
    }
}
