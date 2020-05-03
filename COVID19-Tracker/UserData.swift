//
//  UserData.swift
//  COVID19-Tracker
//
//  Created by Chester de Wolfe on 4/11/20.
//  Copyright © 2020 Chester de Wolfe. All rights reserved.
//

import Foundation

final class UserData: ObservableObject {
    @Published var savedCountry = savedCountryList
    @Published var savedState = savedStateList


}
