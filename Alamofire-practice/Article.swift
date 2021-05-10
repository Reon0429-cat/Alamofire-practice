//
//  Article.swift
//  Alamofire-practice
//
//  Created by 大西玲音 on 2021/05/10.
//

import Foundation

struct Article: Codable {
    let title: String
    let user: User
}

struct User: Codable {
    let id: String
}
