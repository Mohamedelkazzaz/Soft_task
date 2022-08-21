//
//  Errors.swift
//  El7arif
//
//  Created by Mohamed Elkazzaz on 12/25/19.
//  Copyright © 2019 Mohamed Elkazzaz. All rights reserved.
//

import UIKit


struct Errors : Codable, Error {
    var errorCode : Int?
    var errorMessage : String?

    enum CodingKeys: String,CodingKey {
           case errorCode = "error_code"
           case errorMessage = "error_message"
       }
}

