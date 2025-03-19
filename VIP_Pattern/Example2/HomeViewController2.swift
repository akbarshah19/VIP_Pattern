//
//  HomeViewController2.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import UIKit

protocol HomeDisplayLogic2: AnyObject {
    func displayMessage(viewModel: HomeModels2.ViewModel)
}

class HomeViewController2: UIViewController, HomeDisplayLogic2 {
    var interactor: HomeBusinessLogic2?
//    var router: HomeRoutingLogic2?

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Random Joke", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor2()
        let presenter = HomePresenter2()
//        let router = HomeRouter2()
        
        viewController.interactor = interactor
//        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
//        router.viewController = viewController
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        interactor?.fetchJoke(request: HomeModels2.Request())
    }

    func displayMessage(viewModel: HomeModels2.ViewModel) {
        label.text = viewModel.message
    }
}
