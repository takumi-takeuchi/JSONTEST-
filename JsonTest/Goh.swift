//
//  Goh.swift
//  JsonTest
//
//  Created by Takumi Takeuchi on 2019/02/09.
//  Copyright © 2019年 Takumi Takeuchi. All rights reserved.
//

import Foundation

class Goh : NSObject{
    private var locations_code : String
    private var towns_name_c   : String
    private var towns_name_j   : String
    private var created_at     : Date
    private var updated_at     : Date

    init(
        locations_code : String,
        towns_name_c   : String,
        towns_name_j   : String,
        created_at     : Date,
        updated_at     : Date
    ){
        self.locations_code = locations_code
        self.towns_name_c   = towns_name_c
        self.towns_name_j   = towns_name_j
        self.created_at     = created_at
        self.updated_at     = updated_at
    }
    
    func getLocations_code() -> String { return self.locations_code }
    
    func getTowns_name_c() -> String { return self.towns_name_c }
    
    func getTowns_name_j() -> String { return self.towns_name_j }

    func getCreated_at() -> Date { return self.created_at }

    func getUpdated_at() -> Date { return self.updated_at }
}
