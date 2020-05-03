//
//  InfoView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds


struct InfoView: View {
    
    @State var show = [false, false, false, false, false, false, false, false, false, false]
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {

            VStack (spacing: 25){

                    
                    
                    InfoCard(title: "What is coronavirus disease 2019 (COVID-19)?", answer: "Coronavirus disease 2019 (COVID-19) is a respiratory illness that can spread from person to person. The virus that causes COVID-19 is a novel coronavirus that was first identified during an investigation into an outbreak in Wuhan, China.")
                    
                    InfoCard(title: "Can people in the U.S. get COVID-19?", answer: "Yes. COVID-19 is spreading from person to person in parts of the United States. Risk of infection with COVID-19 is higher for people who are close contacts of someone known to have COVID-19, for example healthcare workers, or household members. Other people at higher risk for infection are those who live in or have recently been in an area with ongoing spread of COVID-19.", height: screen.width / 1.5)
                    
                    secondGroup()
                    VStack {
                        Text("Information Gathered From:")
                        .bold()
                            .padding(.top, 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))

                        NavigationLink(destination:
                            WebView(url: "https://www.cdc.gov")
                                .navigationBarTitle(Text("CDC Website"), displayMode: .inline) )
                            {
                                VStack {
                                    Text("Centers for Disease Control")
                                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                    Text("Tap for more info")
                                        .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                                    Image("CDC")
                                        .renderingMode(.original)
                                    .resizable()
                                        .frame(width: 150, height: 75)
                                }

                            }
                        .padding(.bottom)
                       
                    }
                    
                    }
                    .frame(maxWidth: .infinity)
            .navigationBarTitle(Text("COVID-19 Information").foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))))

            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct InfoCard: View {
    var title: String
    var answer: String
    var height = screen.width / 2
    @State var show = false
    var body: some View {
        VStack (spacing: 20){
            Text("\(title)")
                .bold()
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                .multilineTextAlignment(.center)

            
            if show {
                Text("\(answer)")
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            }

        }
    .padding()
        .frame(width: (screen.width) - 30)
        .onTapGesture {
            self.show.toggle()
        }
        .background(Color("backing"))
        .clipShape(Rectangle())
        .cornerRadius(10)
        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

struct secondGroup: View {
    var body: some View {
        VStack (spacing: 25){
        InfoCard(title: "How does COVID-19 spread?", answer: "The virus that causes COVID-19 probably emerged from an animal source, but is now spreading from person to person. The virus is thought to spread mainly between people who are in close contact with one another (within about 6 feet) through respiratory droplets produced when an infected person coughs or sneezes. It also may be possible that a person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes, but this is not thought to be the main way the virus spreads.", height: screen.width / 1.5)
                
                InfoCard(title: "What are the symptoms of COVID-19?", answer: "Patients with COVID-19 have had mild to severe respiratory illness with symptoms of\n• fever \n• cough \n• shortness of breath", height: screen.width / 2)
            
            InfoCard(title: "What are severe complications from this virus?", answer: "Some patients have pneumonia in both lungs, multi-organ failure and in some cases death.", height: screen.width / 3)
        
        InfoCard(title: "How can I help protect myself?", answer: "People can help protect themselves from respiratory illness with everyday preventive actions.\n• Avoid close contact with people who are sick.\n• Avoid touching your eyes, nose, and mouth withunwashed hands.\n• Wash your hands often with soap and water for at least 20 seconds. Use an alcohol-based hand sanitizer that contains at least 60% alcohol if soap and water are not available.", height: screen.width / 3)
        
        
        
        
        InfoCard(title: "If you are sick, to keep from spreading respiratory illness to others, you should", answer: "• Stay home when you are sick.\n• Cover your cough or sneeze with a tissue, then throw thetissue in the trash.\n• Clean and disinfect frequently touched objectsand surfaces.", height: screen.width / 2)
        
        InfoCard(title: "What should I do if I recently traveled from an area with ongoing spread of COVID-19?", answer: "If you have traveled from an affected area, there may be restrictions on your movements for up to 2 weeks. If you develop symptoms during that period (fever, cough, trouble breathing), seek medical advice. Call the office of your health care provider before you go, and tell them about your travel and your symptoms. They will give you instructions on how to get care without exposing other people to your illness. While sick, avoid contact with people, don’t go out and delay any travel to reduce the possibility of spreading illness to others.", height: screen.width / 1.2)

        InfoCard(title: "Is there a vaccine?", answer: "There is currently no vaccine to protect against COVID-19. The best way to prevent infection is to take everyday preventive actions, like avoiding close contact with people who are sick and washing your hands often.", height: screen.width / 3)

        InfoCard(title: "Is there a treatment?", answer: "There is no specific antiviral treatment for COVID-19. People with COVID-19 can seek medical care to help relieve symptoms.", height: screen.width / 3)
        }
    }
}
