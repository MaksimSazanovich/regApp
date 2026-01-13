//
//  ViewBuilder.swift
//  regApp
//
//  Created by Maksim on 13.01.26.
//

import UIKit

class ViewBuilder {
    
    static let shared = ViewBuilder()
    private init() {}
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 178).isActive = true
        image.heightAnchor.constraint(equalToConstant: 178).isActive = true
        image.image = .baner
        return image
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            print("Forgot Password?")
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    lazy var signButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            print("Sign")
        }))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.backgroundColor = .appYellow
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var orText: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpStack: UIStackView = {
        let stack = UIStackView()
        
        let text = UILabel()
        text.text = "Don't have an account?"
        text.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            print("Sign Up")
        }))
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.appYellow, for: .normal)
        
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(text)
        stack.addArrangedSubview(button)
        
        return stack
    }()
    
    func createInputView(textField: UITextField, placeholder: String, isPassword: Bool = false) -> UIStackView {
        
        lazy var eyeButton: UIButton = {
            let button = UIButton(primaryAction: eyeButtonAction)
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            return button
        }()
        
        lazy var eyeButtonAction = UIAction { _ in
            textField.isSecureTextEntry.toggle()
            
            if textField.isSecureTextEntry {
                eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
            else {
                eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
        
        lazy var textView: UIView = {
            
            let text = UILabel()
            text.translatesAutoresizingMaskIntoConstraints = false
            text.text = placeholder
            text.font = .systemFont(ofSize: 12, weight: .semibold)
            text.textColor = .gray
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(text)
            view.heightAnchor.constraint(equalTo: text.heightAnchor).isActive = true
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
            
            return view
        }()
        
        lazy var fieldView:  UIView = {
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.isSecureTextEntry = isPassword
            view.addSubview(textField)
            
            view.backgroundColor = .appGray
            view.layer.cornerRadius = 15
            
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.heightAnchor.constraint(equalToConstant: 50),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            ])
            
            if isPassword {
                view.addSubview(eyeButton)
                
                NSLayoutConstraint.activate([
                    eyeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    eyeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }

            return view
        }()
        
        lazy var vStack: UIStackView = {
            
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 7
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(textView)
            stack.addArrangedSubview(fieldView)
            return stack
        }()
       
        
        return vStack
        
    }
    
    func createAuthStack() -> UIStackView {
        
        let icons: [UIImage] = [.google, .apple, .facebook]
        
        let hStack = UIStackView()
        
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        icons.forEach { icon in
            hStack.addArrangedSubview(createAuthButton(icon: icon))
        }
        
        return hStack
    }
    
    private func createAuthButton(icon: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .appGray
        button.layer.cornerRadius = 15
        
        button.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
        
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 60),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        return button
    }
    
}
