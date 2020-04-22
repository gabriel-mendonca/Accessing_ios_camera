//
//  ViewController.swift
//  Accessing_ios_camera
//
//  Created by Gabriel Mendonça on 17/04/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContraint()
        view.backgroundColor = UIColor.lightGray
    }
    
    func setupContraint () {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        let top = image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leanding = image.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let Trailing = image.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let heigth = image.heightAnchor.constraint(equalToConstant: 400)
        NSLayoutConstraint.activate([top,leanding,Trailing,heigth])
        
        
        buttonCamera.translatesAutoresizingMaskIntoConstraints = false
        let buttonleanding = buttonCamera.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        let buttonTrailing = buttonCamera.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        let buttonBottom = buttonCamera.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        let buttonHeight = buttonCamera.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([buttonleanding, buttonTrailing, buttonBottom, buttonHeight])
        
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        let btnLeft = buttonDelete.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        let btnRidht = buttonDelete.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        let btnBottom = buttonDelete.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        let btnHeight = buttonDelete.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([btnLeft, btnRidht, btnBottom, btnHeight])
        
        
        
    }
    
    lazy var image: UIImageView = {
        var imagem = UIImageView()
        view.addSubview(imagem)
        return imagem
    }()
    
    lazy var buttonCamera: UIButton = {
        var button = UIButton()
        button.setTitle("Add image", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: #selector(accessCamera), for: .touchUpInside)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        view.addSubview(button)
        return button
    }()
    
    lazy var buttonDelete: UIButton = {
        var btnDelete = UIButton()
        btnDelete.setTitle("Delete image", for: .normal)
        btnDelete.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btnDelete.setTitleColor(UIColor.lightGray, for: .normal)
        btnDelete.backgroundColor = UIColor.black
        btnDelete.clipsToBounds = true
        btnDelete.layer.cornerRadius = 10
        btnDelete.addTarget(self, action: #selector(DeleteImage), for: .touchUpInside)
        view.addSubview(btnDelete)
        
        return btnDelete
    }()
    
    
    @objc func accessCamera(_ sender: UIButton) {
        
        ChooseImage().imagePicker(self){ imagem in
            self.image.image = imagem
            self.image.isHidden = false
        }
        
    }
    
    @objc func DeleteImage(_ sender: UIButton) {
        
        image.isHidden = true
        
    }
    
}



