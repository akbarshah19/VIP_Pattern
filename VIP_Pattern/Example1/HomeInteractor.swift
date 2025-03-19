//
//  HomeInteractor.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import Foundation

protocol HomeBusinessLogic {
    func fetchMessage(request: HomeModels.Request)
}

class HomeInteractor: HomeBusinessLogic {
    var presenter: HomePresentationLogic?

    func fetchMessage(request: HomeModels.Request) {
        let message = "Hello from VIP!"
        let response = HomeModels.Response(message: message)
        presenter?.presentMessage(response: response)
    }
}
