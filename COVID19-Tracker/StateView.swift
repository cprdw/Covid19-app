//
//  StateView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/9/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct StateView: View {
    let state: state
    @State var showAdded = false
    @EnvironmentObject var userData: UserData
    @State var contains = false
    var mult2: Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        
        let fatal = formatter.number(from: state.total_deaths)
        let total = formatter.number(from: state.total_cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
        print("number is \(number)")
        print("fatal is \(fatal!.doubleValue)")
        print("total is \(total!.doubleValue)")

        return number
    }

    var body: some View {
           // ProgressRing(color1: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), color2: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), width: 200, height: 200, percent: 20, colorPercent: true, show: true)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (alignment: .leading, spacing: 15){
                     
//                    HStack {
//                        PieChartView(data: [1002304, 352304, 230400], title: "All Data", style: mystyle, dropShadow: false)
//                            .padding(.leading, screen.width / 5)
//
//                    }
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .frame(width: screen.width / 1.2, height: 20)


                    RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                    .frame(width: (screen.width / 1.2) * CGFloat(mult2), height: 20)
                    firstSetState(state: state)
                    secondSetState(state: state)

                    
                }
                    .frame(maxWidth: .infinity)
                    .alert(isPresented: $showAdded, content: { self.alert })
                .navigationBarTitle(Text(state.state_name))
                .navigationBarItems(trailing: Button(action: {
                    
                    if !self.contains {
                        self.contains.toggle()
                        savedStateList.append(self.state)
                        self.userData.savedState.append(self.state)
                    }
                    self.showAdded.toggle()
                    
                }){
                    Text(contains ? "" : "Save")
                        .font(.headline)
                })
            }
        .onAppear {
            for val in self.userData.savedState {
                if val.state_name == self.state.state_name {
                    self.contains.toggle()
                }
            }
        }
            
        

    }
    var alert: Alert {
        
        return Alert(title: Text("Save Successful"),
              message: Text("\(self.state.state_name) has been added to you State list!"),
              dismissButton: .default(Text("Okay")) )
    }
}

//struct StateView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateView(state: allLocations[0])
//    }
//}



struct firstSetState: View {
    let state: state
    var numFormatter: NumberFormatter {
        var num = NumberFormatter()
        num.numberStyle = .decimal
        num.usesGroupingSeparator = true
        num.groupingSeparator = ","
        print(num.string(from: 12000))
        return num
    }

    var body: some View {
        VStack (alignment: .leading, spacing: 15){
            
            Text("Total Cases:")
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            

            HStack (spacing: 20){
                Text("\(numFormatter.string(from: NSNumber(value: (state.total_cases as! NSString).doubleValue))!)")
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
                    
                
                
                Text("\(numFormatter.string(from: NSNumber(value: (state.total_deaths as! NSString).doubleValue))!)")
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
            
            
           
        }
        
        
    }
}

struct secondSetState: View {
    let state: state
    var numFormatter: NumberFormatter {
        var num = NumberFormatter()
        num.numberStyle = .decimal
        num.usesGroupingSeparator = true
        num.groupingSeparator = ","
        print(num.string(from: 12000))
        return num
    }
    var mortPercentage: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let fatal = formatter.number(from: state.total_deaths)
        let total = formatter.number(from: state.total_cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
        
        return String(format: "%.3f", number)
    }
    var body: some View {
        VStack {
            
            VStack (alignment: .leading, spacing: 15){
                
        
                Text("Additional Information")
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                VStack {
                    HStack (spacing: 20){
                       Text("Active Cases:")
                        .font(.headline)
                        Spacer()
                        Text("\(numFormatter.string(from: NSNumber(value: (state.active_cases as NSString).doubleValue)) ?? "0")")

                     }
                        .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40)
                    HStack (spacing: 20){
                       Text("New Cases:")
                        .font(.headline)

                        Spacer()
                        Text("\(numFormatter.string(from: NSNumber(value: (state.new_cases as NSString).doubleValue)) ?? "0")")

                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40)
                    HStack (spacing: 20){
                       Text("New Fatalities:")
                        .font(.headline)

                        Spacer()
                        Text("\(numFormatter.string(from: NSNumber(value: (state.new_deaths as NSString).doubleValue)) ?? "0")")

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
