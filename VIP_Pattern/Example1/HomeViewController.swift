//
//  HomeViewController.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayMessage(viewModel: HomeModels.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .red
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Message", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)

        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        interactor?.fetchMessage(request: HomeModels.Request())
    }

    func displayMessage(viewModel: HomeModels.ViewModel) {
        label.text = viewModel.message
    }
}
