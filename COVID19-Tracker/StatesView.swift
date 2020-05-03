//
//  StatesView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/8/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

struct StatesView: View {
    var body: some View {
                    
                            Form {
                                Group {
                                    Section (header: Text("Saved:").font(.headline)){
                                        NavigationLink(destination: StatesView()) {
                                            Text("United States")
                                        }
                                    }
                                }
                                
                                
                            
                    }
                .navigationBarTitle("United States")
                }
            }
        

struct StatesView_Previews: PreviewProvider {
    static var previews: some View {
        StatesView()
    }
}
