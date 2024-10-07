//
//  ViewController.swift
//  ProtocolOrientedLoginCheck
//
//  Created by Barış Dilekçi on 6.10.2024.
//

import UIKit

class RootViewController: UIViewController, RootViewModelProtocol {

    private var viewModel : RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkLogin()
        view.backgroundColor = .red
    }

    func showLoginScreen() {
        let loginAppViewController = LoginViewController()
        navigationController?.present(loginAppViewController, animated: true)
    }
    
    func showMainScreen() {
        let mainAppViewController = MainViewController()
        navigationController?.present(mainAppViewController, animated: true)
    }
}

