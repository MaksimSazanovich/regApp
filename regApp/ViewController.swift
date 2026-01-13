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
    private var passwordStack = UIStackView()
    private var forgotButton = UIButton()
    private var signInButton = UIButton()
    private var orText = UILabel()
    private var buttonsStack = UIStackView()
    private var signUpStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appPurple
        
        setBannerImage()
        setContentView()
        setEmailTextView()
        setForgotButton()
        
        setSignInButton()
        setOrlabel()
        
        setAuthButtons()
        setSugnUpStack()
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
        ])
    }
    
    private func setEmailTextView() {
        let emailStack = builder.createInputView(textField: emailTextField, placeholder: "Email Adress")
        passwordStack = builder.createInputView(textField: passwordTextField, placeholder: "Password", isPassword: true)
        contentView.addSubview(emailStack)
        contentView.addSubview(passwordStack)
        
        NSLayoutConstraint.activate([
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor , constant: 20),
            passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
        ])
    }
    
    private func setForgotButton() {
        forgotButton = builder.forgotPasswordButton
        contentView.addSubview(forgotButton)
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo:  passwordStack.bottomAnchor, constant: 7),
            forgotButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34)
        ])
    }

    private func setSignInButton() {
        signInButton = builder.signButton
        contentView.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
        ])
    }
    
    private func setOrlabel() {
        orText = builder.orText
        contentView.addSubview(orText)
        
        NSLayoutConstraint.activate([
            orText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orText.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30)
        ])
    }
    
    private func setAuthButtons() {
        buttonsStack = builder.createAuthStack()
        contentView.addSubview(buttonsStack)
        
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: orText.bottomAnchor, constant: 30),
            buttonsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            buttonsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
        ])
    }
    
    private func setSugnUpStack() {
        signUpStack = builder.signUpStack
        contentView.addSubview(signUpStack)
        
        NSLayoutConstraint.activate([
            signUpStack.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 30),
            signUpStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

