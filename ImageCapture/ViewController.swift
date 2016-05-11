//
//  ViewController.swift
//  ImageCapture
//
//  Created by Jan Mísař on 11.05.16.
//  Copyright © 2016 Ackee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .whiteColor()

        let imageView = UIImageView()
        imageView.backgroundColor = .grayColor()

        let takePhotoButton = UIButton()
        takePhotoButton.setTitleColor(.blueColor(), forState: .Normal)
        takePhotoButton.setTitleColor(.grayColor(), forState: .Disabled)
        takePhotoButton.setTitle("Take photo", forState: .Normal)
        takePhotoButton.addTarget(self, action: #selector(ViewController.takePhotoButtonTapped), forControlEvents: .TouchUpInside)

        let chooseFromLibraryButton = UIButton()
        chooseFromLibraryButton.setTitleColor(.blueColor(), forState: .Normal)
        chooseFromLibraryButton.setTitle("Choose from library", forState: .Normal)
        chooseFromLibraryButton.addTarget(self, action: #selector(ViewController.chooseFromLibraryButtonTapped), forControlEvents: .TouchUpInside)

        let shareButton = UIButton()
        shareButton.setTitleColor(.blueColor(), forState: .Normal)
        shareButton.setTitle("Share", forState: .Normal)
        shareButton.addTarget(self, action: #selector(ViewController.shareButtonTapped), forControlEvents: .TouchUpInside)

        let stackView = UIStackView(arrangedSubviews: [imageView, takePhotoButton, chooseFromLibraryButton, shareButton])
        stackView.axis = .Vertical
        view.addSubview(stackView)
        stackView.snp_makeConstraints { make in
            make.center.equalTo(0)
        }

        imageView.snp_makeConstraints { make in
            make.width.height.equalTo(view.snp_width).offset(-40)
        }
        self.imageView = imageView

        // check camera availibility
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) {
            takePhotoButton.enabled = false
        }
    }

    func takePhotoButtonTapped() {

        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .Camera
        pickerController.allowsEditing = true
        // pickerController.showsCameraControls = false

        let overlay = UIView(frame: CGRectMake(0, 0, 300, 100))
        overlay.backgroundColor = .greenColor()

        pickerController.cameraOverlayView = overlay

        self.presentViewController(pickerController, animated: true, completion: nil)
    }

    func chooseFromLibraryButtonTapped() {

        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .PhotoLibrary

        self.presentViewController(pickerController, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        print(info)
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = pickedImage

        picker.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    func shareButtonTapped() {

        guard let image = imageView.image else {
            return
        }

        let text = "Look at my awesome photo!"
        let url = NSURL(string: "http://awesomephotos.com/dvbzwoop1j34")!

        let shareController = UIActivityViewController(activityItems: [image, url, text], applicationActivities: nil)
        self.presentViewController(shareController, animated: true, completion: nil)
    }
}
