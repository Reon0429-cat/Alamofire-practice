//
//  APIClient.swift
//  Alamofire-practice
//
//  Created by 大西玲音 on 2021/05/10.
//

import Alamofire

typealias ResultHandler<T> = (Result<T, APIError>) -> Void

struct APIClient {
    
    func request(handler: @escaping ResultHandler<[Article]>) {
        AF.request("https://qiita.com/api/v2/items")
            .responseJSON { response in
                guard let data = response.data else {
                    handler(.failure(.invalidResponse))
                    return
                }
                do {
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                    handler(.success(articles))
                } catch {
                    handler(.failure(.unknown(error)))
                }
            }
    }
}
