//
//  Error.swift
//  NetwokComponent
//
//  Created by Arun Thakkar on 05/05/21.
//


import Foundation
public enum WebError<CustomError>: Error {
    case noInternetConnection
    case custom(CustomError)
    case unauthorized
    case other
}
