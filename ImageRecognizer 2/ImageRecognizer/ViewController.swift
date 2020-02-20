//
//  ViewController.swift
//  ImageRecognizer
//
//  Created by Barry Hubler on 2/20/20.
//  Copyright © 2020 Barry Hubler. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var resnetModel = Resnet50()
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        if let image = imageView.image {
            classifyPicture(image:image)
        }
        
    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker,animated: true,completion: nil)
    }
    @IBAction func albumTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated:true,completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageView.image = image
            classifyPicture(image:image)
        }
    }
    
    func classifyPicture(image:UIImage){
        if let model = try? VNCoreMLModel(for: resnetModel.model){
            let request = VNCoreMLRequest(model:model){(request,error) in
                if let results = request.results as? [VNClassificationObservation]{
                    //print(results)
                    
                    //for result in results{
                    //    print(result.identifier + "," + String(result.confidence))
                    //}
                    
                    let result = results[0]
                    self.navBar.topItem?.title = result.identifier
                    
                }
            }
            if let imageData = image.jpegData(compressionQuality:1.0){
                let handler = VNImageRequestHandler(data:imageData,options:[:])
                try? handler.perform([request])
            }
        }
    }
    
    
    
    
    
    
    
    
    


}

