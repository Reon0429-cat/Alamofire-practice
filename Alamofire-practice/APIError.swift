//
//  APIError.swift
//  Alamofire-practice
//
//  Created by 大西玲音 on 2021/05/10.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case unknown(Error)
}
