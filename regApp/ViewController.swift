//
//  ViewController.swift
//  regApp
//
//  Created by Maksim on 13.01.26.
//

import UIKit

class ViewController: UIViewController {

    private let builder = ViewBuilder.shared
    private var contentView = UIView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appPurple
        
        setBannerImage()
        setContentView()
        setEmailTextView()
    }

    private func setBannerImage() {
        let bannerImage = builder.bannerImage
        view.addSubview(bannerImage)
        
        NSLayoutConstraint.activate([
            bannerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48)
        ])
    }
    
    private func setContentView() {
        contentView = builder.contentView
        view.addSubview(self.contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func setEmailTextView() {
        let emailStack = builder.createInputView(textField: emailTextField, placeholder: "Email Adress")
        let passwordStack = builder.createInputView(textField: passwordTextField, placeholder: "Password")
        contentView.addSubview(emailStack)
        contentView.addSubview(passwordStack)
        
        NSLayoutConstraint.activate([
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 20),
            passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
        ])
    }

}

