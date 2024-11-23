//
//  APIService.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 23/11/24.
//

import Foundation
import Alamofire

struct APIService{
    func getGoals(completion: @escaping([GoalType]?,Error?)-> Void){
        AF.request("https://private-5d057e-dm126api1.apiary-mock.com/goals").responseDecodable(of:[GoalType].self){
            response in switch response.result{
                case .success(let goals): completion(goals,nil)
                default:break
            }
        }
    }
}
