//
//  AllDataView.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct AllDataView: View {
    var mult1: Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let fatal = formatter.number(from: worldTotal[0].total_recovered)
        let total = formatter.number(from: worldTotal[0].total_cases)
        let number = fatal!.doubleValue / (total!.doubleValue)

        return number
    }
    
    var mult2: Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        
        let fatal = formatter.number(from: worldTotal[0].total_deaths)
        let total = formatter.number(from: worldTotal[0].total_cases)
        let number = fatal!.doubleValue / (total!.doubleValue)
        print("number is \(number)")
        print("fatal is \(fatal!.doubleValue)")
        print("total is \(total!.doubleValue)")

        return number
    }
    
    @State var totalInfo: [String] = ["", "", "", "", "", ""]
    var body: some View {
        NavigationView {
           // ProgressRing(color1: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), color2: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), width: 200, height: 200, percent: 20, colorPercent: true, show: true)
            
            ScrollView(.vertical, showsIndicators: false) {
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
                    firstSet(totalInfo: self.$totalInfo)
                    VStack (alignment: .center){
                        Button(action: {
                            getTotalData()
                            self.totalInfo = [worldTotal[0].total_cases, worldTotal[0].total_deaths, worldTotal[0].total_recovered, "", "", ""]
                        }) {
                            Text("Reload")
                        }
                        .frame(width: (screen.width / 2) - 50, height: 50)
                        .background(Color("backing"))
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
                        .padding(.leading, screen.width / 4)
                        .padding(.top)
                    }
                    secondSet()
                        .font(.title)
                    newsOutlets()

                    
                }
                    .frame(maxWidth: .infinity)
                .navigationBarTitle(Text("COVID-19 World Data"))
                
            }
            .frame(maxWidth: .infinity)
        }

    }
}

struct AllDataView_Previews: PreviewProvider {
    static var previews: some View {
        AllDataView()
    }
}

struct singleOutlet: View {
    @State var name = "CNN"
    @State var url = "https://www.cnn.com/interactive/2020/health/coronavirus-us-maps-and-cases/"
    @State var color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
    var body: some View {
        NavigationLink(destination:
                        WebView(url: url).navigationBarTitle(Text("\(name) Website"), displayMode: .inline))
                    {
                        VStack {
                           
                            HStack {
                                Color(color)
                                .frame(width: 20)
                                Spacer()
                                Text(name)
                                    .font(.title)
                                .foregroundColor(Color(color))
        Spacer()
                                Image(systemName: "chevron.right")
                                .foregroundColor(Color(color))
                                    .padding(.trailing)

                            }

                        
                        }
                        .frame(width: (screen.width / 2) - 50, height: 75)
                        .background(Color("backing"))
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .shadow(color: Color("shadow").opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color("shadow").opacity(0.2), radius: 10, x: 0, y: 10)
                    }
    }
}

struct newsOutlets: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15){
            
            Text("News Sources:")
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            
            HStack {
                singleOutlet()
                    .padding()
                    singleOutlet(name: "BBC",url: "https://www.bbc.com/news/coronavirus", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))

                .padding()
            }
            
            HStack {
                singleOutlet(name: "Fox",url: "https://www.foxnews.com/category/health/infectious-disease/coronavirus", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
                    .padding()
                    singleOutlet(name: "NBC",url: "https://www.nbcnews.com", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                .padding()
            }
            
            HStack {
                singleOutlet(name: "NYT",url: "https://www.nytimes.com/2020/04/09/us/coronavirus-live-updates.html", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                    .padding()
                singleOutlet(name: "TWP",url: "https://www.washingtonpost.com/coronavirus/", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
                .padding()
            }
        
        }
    }
}

struct firstSet: View {
    @Binding var totalInfo: [String]
    var some: String {
        getTotalData()
        return ""
    }
    var body: some View {
        VStack (alignment: .leading, spacing: 15){
//            HStack {
//                MultiLineChartView(data: [([1300,1350,1390], GradientColors.orange), ([70,78,94], GradientColors.green), ([230,250,290], GradientColors.prplPink)], title: "Last Month")
//                MultiLineChartView(data: [([2,1,3], GradientColors.orange), ([2,0,4], GradientColors.green), ([5,6,3], GradientColors.prplPink)], title: "Last Week")
//            }
            
            Text("Total Cases:")
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            

            HStack (spacing: 20){
                Text(totalInfo[0] == "" ? worldTotal[0].total_cases : totalInfo[0])
                .bold()
                    .foregroundColor(.orange)

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
                    
                
                
                Text(totalInfo[1] == "" ? worldTotal[0].total_deaths : totalInfo[1])
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
            
            
            Text("Recovered:")
                
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            HStack (spacing: 20){
                    
                
                
                Text(totalInfo[2] == "" ? worldTotal[0].total_recovered : totalInfo[2])
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

struct secondSet: View {
    var body: some View {
        VStack {
            
            VStack (alignment: .leading, spacing: 15){
                
                Text("Top Countries:")
                 .font(.title)
                 .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                Text("Number of Cases")
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                VStack {
                    HStack (spacing: 20){
                        Text("1. \(allLocations[1].country_name)")
                        .font(.headline)
                        Spacer()
                        Text("\(allLocations[1].cases)")

                     }
                        .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -10)
                    HStack (spacing: 20){
                       Text("2. \(allLocations[2].country_name)")
                       .font(.headline)
                       Spacer()
                       Text("\(allLocations[2].cases)")

                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -10)
                    HStack (spacing: 20){
                       Text("3. \(allLocations[3].country_name)")
                       .font(.headline)
                       Spacer()
                       Text("\(allLocations[3].cases)")
                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -10)

                    
                    HStack (spacing: 20){
                       Text("4. \(allLocations[4].country_name)")
                       .font(.headline)
                       Spacer()
                       Text("\(allLocations[4].cases)")
                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -10)

                    HStack (spacing: 20){
                       Text("5. \(allLocations[5].country_name)")
                       .font(.headline)
                       Spacer()
                       Text("\(allLocations[5].cases)")
                     }
                    .padding(.leading)
                    .padding(.trailing)
                    Divider().offset(x: 40, y: -10)
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
