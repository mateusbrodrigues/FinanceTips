//
//  APIService.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 23/11/24.
//

import Foundation
import Alamofire

struct APIService {
    func getGoals(completion: @escaping([GoalType]?, Error?) -> Void) {
        AF.request("https://private-61b6e-dm126mock.apiary-mock.com/goals")
            .responseDecodable(of: [GoalType].self) { response in
                switch response.result {
                case .success(let goals):
                    completion(goals, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    func createGoal(_ goal: GoalType, completion: @escaping (Bool, Error?) -> Void) {
        let parameters: [String: Any] = [
            "icone": goal.icone,
            "titulo": goal.titulo,
            "descricao": goal.descricao
        ]
        
        AF.request("https://private-61b6e-dm126mock.apiary-mock.com/goals", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                if let error = response.error {
                    completion(false, error)
                } else {
                    completion(true, nil)
                }
            }
    }
}
