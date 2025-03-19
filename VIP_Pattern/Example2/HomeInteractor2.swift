//
//  HomeInteractor2.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import Foundation

protocol HomeBusinessLogic2 {
    func fetchJoke(request: HomeModels2.Request)
}

class HomeInteractor2: HomeBusinessLogic2 {
    var presenter: HomePresentationLogic2?

    func fetchJoke(request: HomeModels2.Request) {
        let urlString = "https://official-joke-api.appspot.com/jokes/random"
        guard let url = URL(string: urlString) else {
            presenter?.presentJoke(response: HomeModels2.Response(joke: "Invalid URL"))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.presenter?.presentJoke(response: HomeModels2.Response(joke: "Error: \(error.localizedDescription)"))
                return
            }

            guard let data = data else {
                self.presenter?.presentJoke(response: HomeModels2.Response(joke: "No data received"))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                let jokeText = "\(decodedData.setup) \(decodedData.punchline)"
                self.presenter?.presentJoke(response: HomeModels2.Response(joke: jokeText))
            } catch {
                self.presenter?.presentJoke(response: HomeModels2.Response(joke: "Failed to parse joke"))
            }
        }

        task.resume()
    }
}
