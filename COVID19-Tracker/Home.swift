//
//  Home.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/8/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Image(systemName: "hand.raised")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .padding(.leading)
                        
                        VStack {
                            
                            HStack {
                                Text("Tracker")
                                    .font(.headline)
                                    .padding(.trailing, 100)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationBarTitle(Text("COVID-19")
                    .bold())
                    HStack {
                        Text("What can we do?")
                            .font(.headline)
                        
                    }
                    bullets()
                    
                    
                    
                    additonalInfo()
                    Text("Share")
                        .font(.headline)
                        .padding()
                    shareMessage()
                    .font(.subheadline)
                        

                    questionsMessage()
                    .font(.subheadline)
                        .padding()

                    Text("Powered By Data From:")
                        .padding(.top, 30)
                        .font(.headline)
                    NavigationLink(destination:
                        WebView(url: "https://coronavirus.jhu.edu/data")
                             )
                        {
                            Text("Johns Hopkins University")
                        }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct additonalInfo: View {
    var body: some View {
        VStack {
            Text("Additional Information: ")
                .font(.headline)
            .padding()
            
            NavigationLink(destination: WebView(url: "https://coronavirus.jhu.edu/map.html").navigationBarTitle(Text("JHU Website"), displayMode: .inline)) {
                HStack {
                   
                    
                    Text("Johns Hopkins University Map")
                        .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.leading)


                    Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding()
                }
                .frame(width: (screen.width) - 50, height: 50)
                .background(Color("backing"))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            }
            
            NavigationLink(destination: WebView(url: "https://www.cdc.gov/coronavirus/2019-ncov/index.html").navigationBarTitle(Text("CDC Website"), displayMode: .inline)) {
                HStack {
                    
                    Text("The Centers for Disease Control")
                        .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                        .padding(.leading)

                    Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding()
                }
                .frame(width: (screen.width) - 50, height: 50)
                .background(Color("backing"))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            }
            
            NavigationLink(destination: WebView(url: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019").navigationBarTitle(Text("WHO Website"), displayMode: .inline)) {
                
                HStack {
                    
                    
                    Text("World Health Organization")
                        .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.leading)


                    Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding()
                }
                .frame(width: (screen.width) - 50, height: 50)
                .background(Color("backing"))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            }
            
            NavigationLink(destination: WebView(url: "https://www.nih.gov/health-information/coronavirus").navigationBarTitle(Text("NIH Website"), displayMode: .inline)) {
                HStack {
                   
                    
                    Text("National Institutes of Health")
                        .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.leading)


                    Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding()
                }
                .frame(width: (screen.width) - 50, height: 50)
                .background(Color("backing"))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            }
            
            
            
            NavigationLink(destination: WebView(url: "https://www.nhs.uk/conditions/coronavirus-covid-19/").navigationBarTitle(Text("NHS Website"), displayMode: .inline)) {
                HStack {
                    
                    
                    Text("National Health Service (UK)")
                        .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding(.leading)


                    Spacer()
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .padding()
                }
                .frame(width: (screen.width) - 50, height: 50)
                .background(Color("backing"))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            }
        }
        
    }
}


struct bullets: View {
    var body: some View {
        VStack (alignment: .leading){
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Text("Continue Social Distancing")
                    .font(.subheadline)
                
            }
            .padding(.top)
            HStack {
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Text("Wash your hands regularly with\nsoap and water")
                    .font(.subheadline)
                
                
            }
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Text("Avoid touching your eyes, nose,\nand mouth with unwashed hands")
                    .font(.subheadline)
                
            }
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Text("Check in with friends and family\nto raise morale during these trying times")
                    .font(.subheadline)
                
            }
            .padding(.bottom)
        }
        .frame(width: (screen.width) - 50, height: 220)
        .background(Color("backing"))
        .clipShape(Rectangle())
        .cornerRadius(10)
        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

struct shareMessage: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("If you found the information helpful please share with those around you to increase the spread of awareness and to #FlattenTheCurve")
            .padding()
                .multilineTextAlignment(.center)
        }
        .frame(width: (screen.width) - 50, height: 120)
        .background(Color("backing"))
        .clipShape(Rectangle())
        .cornerRadius(10)
        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

struct questionsMessage: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Please feel free to email the developer at de.wolfeapps@gmail.com with any questions regarding the app")
            .padding()
            .multilineTextAlignment(.center)

        }
        .frame(width: (screen.width) - 50, height: 100)
        .background(Color("backing"))
        .clipShape(Rectangle())
        .cornerRadius(10)
        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
