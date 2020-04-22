//
//  EscolherImagem.swift
//  Accessing_ios_camera
//
//  Created by Gabriel Mendonça on 17/04/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class ChooseImage: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose an option", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var returnPicker : ((UIImage) -> ())?;
    
    
    func imagePicker(_ viewController: UIViewController, _ retorno: @escaping ((UIImage) -> ())) {
        
    returnPicker = retorno
        
        self.viewController = viewController
        
        let camera = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let gallery = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        
        picker.delegate = self
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera(){
        
        alert.dismiss(animated: true, completion: nil)
        
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController?.present(picker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "You do not have camera", preferredStyle: .actionSheet)
            let cancelar = UIAlertAction(title: "Cancel", style: .cancel){
                UIAlertAction in
            }
            alert.addAction(cancelar)
            self.viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController?.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("An image was expected, but the following was given: \(info)")
            
        }
        
    returnPicker?(image)
    }
}
