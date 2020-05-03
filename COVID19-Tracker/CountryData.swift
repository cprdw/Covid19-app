//
//  CountryData.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/7/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import Foundation
import SwiftUI
 

 

/*
***************************************
MARK: - Get Country Flag Image from URL
***************************************
This public function fetches image data from the given URL in an asynchronous manner
under a URLSession, converts it to UIImage, and then returns it as SwiftUI Image.
*/
public func getImageFromUrl(url: String) -> Image {
   
    // ImageUnavailable is provided in Assets.xcassets
    var imageObtainedFromUrl = Image("ImageUnavailable")
 
    let headers = [
        "accept": "image/jpg, image/jpeg, image/png",
        "cache-control": "cache",
        "connection": "keep-alive",
    ]
 
    // Convert given URL string into URL struct
    guard let imageUrl = URL(string: url) else {
        return Image("ImageUnavailable")
    }
 
    let request = NSMutableURLRequest(url: imageUrl,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
 
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
 
    /*
     Create a semaphore to control getting and processing API data.
     signal() -> Int    Signals (increments) a semaphore.
     wait()             Waits for, or decrements, a semaphore.
     */
    let semaphore = DispatchSemaphore(value: 0)
 
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        /*
        URLSession is established and the image file from the URL is set to be fetched
        in an asynchronous manner. After the file is fetched, data, response, error
        are returned as the input parameter values of this Completion Handler Closure.
        */
 
        // Process input parameter 'error'
        guard error == nil else {
            semaphore.signal()
            return
        }
 
        // Process input parameter 'response'. HTTP response status codes from 200 to 299 indicate success.
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            semaphore.signal()
            return
        }
 
        // Unwrap Optional 'data' to see if it has a value
        guard let imageDataFromUrl = data else {
            semaphore.signal()
            return
        }
 
        // Convert fetched imageDataFromUrl into UIImage object
        let uiImage = UIImage(data: imageDataFromUrl)
 
        // Unwrap Optional uiImage to see if it has a value
        if let imageObtained = uiImage {
            // UIImage is successfully obtained. Convert it to SwiftUI Image.
            imageObtainedFromUrl = Image(uiImage: imageObtained)
        }
 
        semaphore.signal()
    }).resume()
 
    /*
     The URLSession task above is set up. It begins in a suspended state.
     The resume() method starts processing the task in an execution thread.
 
     The semaphore.wait blocks the execution thread and starts waiting.
     Upon completion of the task, the Completion Handler code is executed.
     The waiting ends when .signal() fires or timeout period of 10 seconds expires.
    */
 
    _ = semaphore.wait(timeout: .now() + 10)
 
    return imageObtainedFromUrl
}



func getAllCountriesData() {
    let headers = [
        "x-rapidapi-host": "coronavirus-monitor-v2.p.rapidapi.com",
        "x-rapidapi-key": "285d24c184msh805338200c83be8p1c21f0jsn325a58f91567"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://coronavirus-monitor-v2.p.rapidapi.com/coronavirus/cases_by_country.php")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
           let httpResponse = response as? HTTPURLResponse
                
                    guard let jsonDataFromApi = data else {
                               // companyDataDictionaryFromApi will have the initial values set as above
                               semaphore.signal()
                               return
                           }

                           do {

                               let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
                                                options: JSONSerialization.ReadingOptions.mutableContainers)
                    

                            
                            if let jsonObject = jsonResponse as? [String: Any] {
                                allLocationsTime = jsonObject["statistic_taken_at"] as! String
                                if let array = jsonObject["countries_stat"] as? [Any] {
                                    for val in array {
                                        if let country = val as? [String: String] {
                                            allLocations.append(location(country_name: country["country_name"]!, cases: country["cases"]!, deaths: country["deaths"]!, region: country["region"]!, total_recovered: country["total_recovered"]!, new_deaths: country["new_deaths"]!, new_cases: country["new_cases"]!, serious_critical: country["serious_critical"]!, active_cases: country["active_cases"]!, total_cases_per_1m_population: country["total_cases_per_1m_population"]!))
                                        }
                                    }
                                    sortedLocations = allLocations.sorted(by: {$0.country_name < $1.country_name})

                                }
                                
                                
                                
                               } else {
                                   semaphore.signal()
                                   return
                               }
                    }
                           catch {
                            
                    }
                    //print(httpResponse)
                }
            })

            dataTask.resume()
}

/*
 {"countries_stat":[{"country_name":"","cases":"721","deaths":"13","region":"","total_recovered":"619","new_deaths":"0","new_cases":"0","serious_critical":"10","active_cases":"89","total_cases_per_1m_population":"0"},{"country_name":"USA","cases":"435,941","deaths":"14,865","region":"","total_recovered":"22,941","new_deaths":"77","new_cases":"1,014","serious_critical":"9,281","active_cases":"398,135","total_cases_per_1m_population":"1,317"}
 */

struct location: Codable, Identifiable {
    var id = UUID()
    var country_name: String
    var cases: String
    var deaths: String
    var region: String
    var total_recovered: String
    var new_deaths: String
    var new_cases: String
    var serious_critical: String
    var active_cases: String
    var total_cases_per_1m_population: String

}
var allLocations: [location] = []
var allLocationsTime = ""
var stateLocations: [location] = []
var top5Countries: [location] = []
let semaphore = DispatchSemaphore(value: 0)

func getTotalData() {


    let headers = [
        "x-rapidapi-host": "coronavirus-monitor-v2.p.rapidapi.com",
        "x-rapidapi-key": "285d24c184msh805338200c83be8p1c21f0jsn325a58f91567"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://coronavirus-monitor-v2.p.rapidapi.com/coronavirus/worldstat.php")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
        
            guard let jsonDataFromApi = data else {
                       // companyDataDictionaryFromApi will have the initial values set as above
                       semaphore.signal()
                       return
                   }

                   do {

                       let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
                                        options: JSONSerialization.ReadingOptions.mutableContainers)
            

            
                    if let jsonObject = jsonResponse as? [String: Any] {
                        print("reached here")
                        worldTotal[0] = (worldStat(statistic_taken_at: jsonObject["statistic_taken_at"] as! String, total_deaths: jsonObject["total_deaths"] as! String, total_recovered: jsonObject["total_recovered"] as! String, new_cases: jsonObject["new_cases"] as! String, new_deaths: jsonObject["new_deaths"] as! String, total_cases: jsonObject["total_cases"] as! String))
                        
                        
                        
                       } else {
                           // companyDataDictionaryFromApi will have the initial values set as above
                           semaphore.signal()
                           return
                       }
            }
                   catch {
                    
            }
            //print(httpResponse)
        }
    })

    dataTask.resume()
}

struct worldStat {
    var statistic_taken_at: String
    var total_deaths: String
    var total_recovered: String
    var new_cases: String
    var new_deaths: String
    var total_cases: String
}
var worldTotal: [worldStat] = [worldStat(statistic_taken_at: "", total_deaths: "", total_recovered: "", new_cases: "", new_deaths: "", total_cases: "")]




func getStateData() {
    let headers = [
        "x-rapidapi-host": "coronavirus-monitor-v2.p.rapidapi.com",
        "x-rapidapi-key": "285d24c184msh805338200c83be8p1c21f0jsn325a58f91567"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://coronavirus-monitor-v2.p.rapidapi.com/coronavirus/cases_in_united_states_worldometers_latest.php")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 60.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    print("states")
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
                print("states2")
                    guard let jsonDataFromApi = data else {
                               // companyDataDictionaryFromApi will have the initial values set as above
                               semaphore.signal()
                               return
                           }

                           do {

                               let jsonResponse = try JSONSerialization.jsonObject(with: jsonDataFromApi,
                                                options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                            let numFormatter = NumberFormatter()
                            numFormatter.usesGroupingSeparator = true
                            numFormatter.locale = Locale.current
                    
                            if let jsonObject = jsonResponse as? [Any] {
                                for val in jsonObject {
                                    if let stateF = val as? [String: String] {
                                        print(stateF["state_name"]!)
                                        allStates.append(state(state_name: stateF["state_name"]!, total_cases: stateF["total_cases"]!, new_cases: stateF["new_cases"]!, total_deaths: stateF["total_deaths"]!, new_deaths: stateF["new_deaths"]!, active_cases: stateF["active_cases"]!, record_date: stateF["record_date"]!))
                                    }
                                }
                                
                                sortedStates = allStates.sorted(by: {$0.state_name < $1.state_name})

                                
                               } else {
                                   // companyDataDictionaryFromApi will have the initial values set as above
                                   semaphore.signal()
                                   return
                               }
                    }
                           catch {
                            
                    }
                    //print(httpResponse)
                }
            })

            dataTask.resume()
}
/*
[{"state_name":"USA Total","total_cases":"436969","new_cases":"2042","total_deaths":"14909","new_deaths":"121","active_cases":"397669","record_date":"2020-04-09 15:40:02.438"},{"state_name":"New York","total_cases":"151171","new_cases":"0","total_deaths":"6268","new_deaths":"0","active_cases":"128888","record_date":"2020-04-09 15:40:02.438"}
*/

struct state: Codable, Identifiable {
    var id = UUID()
    var state_name: String
    var total_cases: String
    var new_cases: String
    var total_deaths: String
    var new_deaths: String
    var active_cases: String
    var record_date: String
}

var allStates: [state] = []




fileprivate let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
 
/*
 ******************************
 MARK: - Read Country Data File
 ******************************
 */
public func readLocationDataFile() {
   
    let locationDataFilename = "LocationData.json"
   
    // Obtain URL of the country data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = documentDirectory.appendingPathComponent(locationDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Country data file exists in the document directory
 
        savedCountryList = loadFromDocumentDirectory(locationDataFilename)
        print("CountryData is loaded from document directory")
       
    } catch {
        // Country data file does not exist in the document directory; Load it from the main bundle.
       
        savedCountryList = loadFromMainBundle(locationDataFilename)
        print("CountryData is loaded from main bundle")
    }
}
 
func loadFromDocumentDirectory<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    // Obtain the URL of the JSON file in the document directory on the user's device
    let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent(filename)
   
    guard let file = urlOfJsonFileInDocumentDirectory
        else {
            fatalError("Unable to find \(filename) in document directory.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from document directory:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadFromMainBundle<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
   
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Unable to find \(filename) in main bundle.")
    }
   
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from main bundle:\n\(error)")
    }
   
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}
 
/*
 *****************************************************
 MARK: - Write Country Data File to Document Directory
 *****************************************************
 */
public func writeLocationDataFile() {
 
    // Obtain the URL of the JSON file in the document directory on the user's device
    let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent("LocationData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(savedCountryList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded country data to document directory!")
        }
    } else {
        fatalError("Unable to encode country data!")
    }
}

var savedCountryList: [location] = []

func addCountryValues () {
    var count = 0
    for val in savedCountryList {
        for country in allLocations {
            if val.country_name == country.country_name {
                savedCountryList[count] = country
            }
        }
        count += 1
    }
}
var savedStateList: [state] = []

public func readStateDataFile() {
   
    let statesDataFilename = "StatesData.json"
   
    // Obtain URL of the country data file in document directory on user's device
    let urlOfJsonFileInDocumentDirectory = documentDirectory.appendingPathComponent(statesDataFilename)
 
    do {
        _ = try Data(contentsOf: urlOfJsonFileInDocumentDirectory)
       
        // Country data file exists in the document directory
 
        savedStateList = loadFromDocumentDirectory(statesDataFilename)
       
    } catch {
        // Country data file does not exist in the document directory; Load it from the main bundle.
       
        savedStateList = loadFromMainBundle(statesDataFilename)
    }
}

public func writeStateDataFile() {
 
    // Obtain the URL of the JSON file in the document directory on the user's device
    let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent("StatesData.json")
 
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(savedStateList) {
        do {
            try encoded.write(to: urlOfJsonFileInDocumentDirectory!)
        } catch {
            fatalError("Unable to write encoded country data to document directory!")
        }
    } else {
        fatalError("Unable to encode country data!")
    }
}
