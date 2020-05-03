//
//  CountryView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct CountryView: View {
    let location: location
    @EnvironmentObject var userData: UserData
    @State var contains = false
    @State var showAlert = false
    var body: some View {

            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .leading, spacing: 15){


                    firstSetCountry(location: location)
                    secondSetCountry(location: location)

                    
                }
                    .frame(maxWidth: .infinity)
                .navigationBarTitle(Text(location.country_name))
                .onAppear {
                    for val in self.userData.savedCountry {
                        if val.country_name == self.location.country_name {
                            self.contains.toggle()
                        }
                    }
                }
                    .alert(isPresented: $showAlert, content: { self.alert })

                .navigationBarItems(trailing: Button(action: {
                    
                    if !self.contains {
                        self.contains.toggle()
                        savedCountryList.append(self.location)
                        self.userData.savedCountry.append(self.location)
                    }
                    self.showAlert.toggle()

                    
                }){
                    Text(contains ? "" : "Save")
                        .font(.headline)
                })
            }
        

    }
    var alert: Alert {
        
        return Alert(title: Text("Save Successful"),
              message: Text("\(self.location.country_name) has been added to you Country list!"),
              dismissButton: .default(Text("Okay")) )
    }
}

//struct CountryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryView(location: allLocations[0])
//    }
//}



struct firstSetCountry: View {
    let location: location
    var mult1: Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        if location.total_recovered != "N/A" {
        let fatal = formatter.number(from: location.total_recovered)
        let total = formatter.number(from: location.cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
            

        return number
        }
        return 0
    }
    
    var mult2: Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        
        let fatal = formatter.number(from: location.deaths)
        let total = formatter.number(from: location.cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
        print("number is \(number)")
        print("fatal is \(fatal!.doubleValue)")
        print("total is \(total!.doubleValue)")

        return number
    }
    var body: some View {
        VStack (alignment: .leading, spacing: 15){
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.orange)
                .frame(width: screen.width / 1.2, height: 20)
            
            RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                .frame(width: (screen.width / 1.2) * CGFloat(mult1), height: 20)

            RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .frame(width: (screen.width / 1.2) * CGFloat(mult2), height: 20)
            Text("Total Cases:")
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            

            HStack (spacing: 20){
                Text("\(location.cases)")
                .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))

                    .font(.title)
                    .padding(.leading, 10)
                .padding(.trailing, 10)

            }
            .frame(width: (screen.width) - 50, height: 75)
            .background(Color("backing"))
            .clipShape(Rectangle())
            .cornerRadius(10)
            .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
            
            

            Text("Fatalities:")
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            HStack (spacing: 20){
                    
                
                
                Text("\(location.deaths)")
                .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))

                    .font(.title)
                    .padding(.leading, 10)
                .padding(.trailing, 10)

            }
            .frame(width: (screen.width) - 50, height: 75)
            .background(Color("backing"))
            .clipShape(Rectangle())
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            
            if location.total_recovered != "N/A" {
            Text("Recovered:")
                
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            HStack (spacing: 20){
                    
                
                
                Text("\(location.total_recovered)")
                .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))

                    .font(.title)
                    .padding(.leading, 10)
                .padding(.trailing, 10)

            }
            .frame(width: (screen.width) - 50, height: 75)
            .background(Color("backing"))
            .clipShape(Rectangle())
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
        }
        
    }
}

struct secondSetCountry: View {
    let location: location
    var mortPercentage: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let fatal = formatter.number(from: location.deaths)
        let total = formatter.number(from: location.cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
        
        return String(format: "%.3f", number)
    }
    
    var popPercentage: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let total = formatter.number(from: location.cases)
        let number = total!.doubleValue / 1000000
        
        return String(format: "%.3f", number)
        
    }
    var body: some View {
        VStack {
            
            VStack (alignment: .leading, spacing: 15){
                
        
                Text("Additional Information")
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                VStack {
                    VStack {
                        HStack (spacing: 20){
                           Text("Active Cases:")
                            .font(.headline)
                            Spacer()
                            Text(location.active_cases)

                         }
                            .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                        
                        Divider().offset(x: 40)
                        HStack (spacing: 20){
                           Text("New Cases:")
                            .font(.headline)

                            Spacer()
                            Text(location.new_cases)

                         }
                        .padding(.leading)
                        .padding(.trailing)
                        Divider().offset(x: 40)
                        HStack (spacing: 20){
                           Text("Critical Cases:")
                            .font(.headline)

                            Spacer()
                            Text(location.serious_critical)

                         }
                        .padding(.leading)
                        .padding(.trailing)
                        Divider().offset(x: 40)
                        
                         HStack (spacing: 20){
                            Text("Mortality:")
                             .font(.headline)
                             Spacer()
                             Text("\(mortPercentage)%")

                          }
                             .padding(.top)
                         .padding(.leading)
                         .padding(.trailing)
                         Divider().offset(x: 40)
                    }
                    
                    
                    HStack (spacing: 20){
                       Text("Infected Population:")
                        .font(.headline)
                        Spacer()
                        Text("\(popPercentage)%")

                     }
                        .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40)
                    
                    HStack (spacing: 20){
                       Text("Cases Per 1M Population:")
                        .font(.headline)

                        Spacer()
                        Text(location.total_cases_per_1m_population)

                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40)
                    
                    
                }
                .frame(width: (screen.width) - 50)
                 .background(Color("backing"))
                 .clipShape(Rectangle())
                 .cornerRadius(10)
                 .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                 
                
            }
        }
    }
}
