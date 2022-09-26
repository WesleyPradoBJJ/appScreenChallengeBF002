//
//  ViewController.swift
//  appScreenChallengeBF002
//
//  Created by Wesley Prado on 26/09/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0/255, green: 152/255, blue: 234/255, alpha: 1.0)// Main view background's color.
        configLabel()
        configTextField()
        configButton()
        registerButton.isEnabled = false
    }
    
    
    func configLabel(){
        titleLabel.text = "AppScreenChallenge02"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white
        
        subtitleLabel.text = "Tela de Cadastro 02"
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .boldSystemFont(ofSize: 18)
        subtitleLabel.textColor = .black
        
        nameLabel.text = "Nome:"
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.textColor = .black
        
        adressLabel.text = "Endereço:"
        adressLabel.textAlignment = .left
        adressLabel.font = .boldSystemFont(ofSize: 15)
        adressLabel.textColor = .black
        
        passwordLabel.text = "Senha:"
        passwordLabel.textAlignment = .left
        passwordLabel.font = .boldSystemFont(ofSize: 15)
        passwordLabel.textColor = .black
        
        confirmPasswordLabel.text = "Confirmar senha:"
        confirmPasswordLabel.textAlignment = .left
        confirmPasswordLabel.font = .boldSystemFont(ofSize: 15)
        confirmPasswordLabel.textColor = .black
    }
    
    
    func configTextField(){
        nameTextField.placeholder = "Por favor, digite seu nome."
        nameTextField.textColor = UIColor.black
        nameTextField.delegate = self
        
        adressTextField.placeholder = "Por favor, digite seu endereço."
        adressTextField.textColor = UIColor.black
        adressTextField.delegate = self
        
        passwordTextField.placeholder = "Por favor, digite sua senha."
        passwordTextField.textColor = UIColor.black
        passwordTextField.delegate = self
        
        confirmPasswordTextField.placeholder = "Por favor, confirme sua senha."
        confirmPasswordTextField.textColor = UIColor.black
        confirmPasswordTextField.delegate = self
    }
    
    
    func configButton (){
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.backgroundColor = .white
        registerButton.layer.borderWidth = 2
        registerButton.layer.cornerRadius = 10
        
    }
    
    //Does the text field border color should immediately turn blue  when the keyboard rises?
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextFieldDidBeginEditing-ok")
        textField.layer.borderColor = UIColor.blue.cgColor
        switch textField {
        case nameTextField:
            nameTextField.layer.borderColor = UIColor.blue.cgColor
            
        case adressTextField:
            adressTextField.layer.borderColor = UIColor.blue.cgColor
            
        case passwordTextField:
            passwordTextField.layer.borderColor = UIColor.blue.cgColor
            
        default:
            break
        }
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextFieldDidEndEditing-ok")
        if textField.text == ""{
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderWidth = 0
        }
        
        //Validação do botão
        if passwordTextField.text != confirmPasswordTextField.text{
            registerButton.isEnabled = false
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            confirmPasswordTextField.layer.borderWidth = 2
            confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            registerButton.isEnabled = true
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Cadastro realizado com sucesso!")
        textField.resignFirstResponder()
        return true
    }
}
    



