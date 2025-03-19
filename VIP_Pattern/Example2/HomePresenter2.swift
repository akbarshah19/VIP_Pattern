//
//  HomePresenter.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import Foundation

protocol HomePresentationLogic2 {
    func presentJoke(response: HomeModels2.Response)
}

class HomePresenter2: HomePresentationLogic2 {
    weak var viewController: HomeDisplayLogic2?

    func presentJoke(response: HomeModels2.Response) {
        let viewModel = HomeModels2.ViewModel(message: response.joke)
        DispatchQueue.main.async {
            self.viewController?.displayMessage(viewModel: viewModel)
        }
    }
}
