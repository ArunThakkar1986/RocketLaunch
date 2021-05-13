//
//  CustomError.swift
//  WeatherApp
//
//  Created by Arun Thakkar on 3/10/21.

//

import Foundation

// MARK: - CustomError
struct CustomError: Error, Decodable {
    var message: String
}
