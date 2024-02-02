//
//  UserListViewModel.swift
//  TestApp
//
//  Created by Shaiju on 08/01/24.
//

import UIKit

class UserListViewModel {
    
    private let networkManager = NetworkManager()
    
    public func getUserList(
        completion: @escaping (Result<[Users], Error>) -> ())  {
            networkManager.getUserdetails { (result) in
                switch result {
                case .success(let result):
                    completion(.success(result.users!))
                case .failure(let error):
                    completion(.failure(error))
                    
            }
        }
    }
}

