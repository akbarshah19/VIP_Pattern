//
//  HomePresenter.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import Foundation

protocol HomePresentationLogic {
    func presentMessage(response: HomeModels.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?

    func presentMessage(response: HomeModels.Response) {
        let viewModel = HomeModels.ViewModel(message: response.message)
        viewController?.displayMessage(viewModel: viewModel)
    }
}
