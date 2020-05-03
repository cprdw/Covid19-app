//
//  SymptomsView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI
/*
 - show symptoms with percentages
 - show at risk groups
 - show mortality rates?
 */
struct SymptomsView: View {
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Symptoms:")
                        .bold()
                            .font(.title)
                            .padding(.leading, 20)
                            .padding()
                        Spacer()
                    }
                   
                    symptoms()
                        .font(.title)
                    HStack {
                        Text("At Risk Groups:")
                        .bold()
                            .font(.title)
                            .padding(.leading, 20)
                        Spacer()
                    }
                .padding()
                    
                    atRisk()
                        .padding(.bottom)
                    
                }
                .frame(maxWidth: .infinity)
            }
        //.navigationBarTitle("Health")
        

        
        
    }
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}


struct symptoms: View {
    var body: some View {
        VStack {
            
            VStack (alignment: .leading, spacing: 15){
                
                
                VStack {
                    HStack (spacing: 20){
                        Text(sympts[0])
                            .font(.headline)
                        Spacer()
                        //                            ProgressRing(color1: sympts3[0], color2: sympts3[0], width: 30, height: 30, percent: CGFloat(sympts2[0]), colorPercent: true, show: true)
                        Text("\(sympts2[0])%")
                        .foregroundColor(Color(sympts3[0]))
                    }
                    .padding(.leading)
                    .padding(.top)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -5)
                    ForEach(1 ..< 12) { item in
                        HStack (spacing: 20){
                            Text(sympts[item])
                                .font(.headline)
                            Spacer()
                            //                                ProgressRing(color1: sympts3[item], color2: sympts3[item], width: 30, height: 30, percent: CGFloat(sympts2[item]), colorPercent: true, show: true)
                            Text("\(sympts2[item])%")
                                .foregroundColor(Color(sympts3[item]))
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        Divider().offset(x: 40, y: -5)
                        
                    }
                    
                        
                        
                        
                        
                        
                        
                 
                
            }
        }
            .frame(width: (screen.width) - 50)
            .background(Color("backing"))
            .clipShape(Rectangle())
            .cornerRadius(20)
            .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
}

let sympts = ["Fever", "Dry Cough", "Fatigue", "Wet Cough", "Shortness of Breath", "Bone or Joint Pain", "Sore Throat", "Headache", "Chills","Nausea or Vomiting", "Stuffy Nose", "Diarrhea"]
let sympts2: [Int] = [88, 68, 38, 33, 19, 15, 14, 14, 11, 5, 5, 4]
let sympts3 = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]


struct atRisk: View {
    var body: some View {
        VStack {
            
            VStack (alignment: .leading, spacing: 15){
                
                
                VStack {
                    HStack (spacing: 20){
                        Image(systemName: "bandage.fill")
                            .foregroundColor(.red)
                        Text(groups[0])
                            .font(.headline)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.leading)
                    .padding(.top)
                    .padding(.trailing)
                    
                    Divider().offset(x: 40, y: -5)
                    ForEach(1 ..< 6) { item in
                        HStack (spacing: 20){
                            Image(systemName: groups2[item])
                                .foregroundColor(.red)
                            Text(groups[item])
                                .font(.headline)
                            
                            Spacer()
                            
                            
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        Divider().offset(x: 40, y: -5)
                        
                    }
                    
                        
                        
                        
                        
                        
                        
                 
                
            }
        }
            .frame(width: (screen.width) - 50)
            .background(Color("backing"))
            .clipShape(Rectangle())
            .cornerRadius(20)
            .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
}

let groups = ["Immunocompromised", "Heart Conditions", "Over 65 Years Old", "Severe Obesity or Diabetes", "Kidney or Liver Disease", "Living in Assisted Care"]
let groups2 = ["bandage.fill", "heart.fill", "person.fill", "staroflife.fill", "bandage.fill", "person.3.fill"]

