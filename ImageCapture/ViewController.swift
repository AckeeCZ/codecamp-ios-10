//
//  ViewController.swift
//  ImageCapture
//
//  Created by Jan Mísař on 11.05.16.
//  Copyright © 2016 Ackee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .whiteColor()

        let imageView = UIImageView()
        imageView.backgroundColor = .grayColor()

        let takePhotoButton = UIButton()
        takePhotoButton.setTitleColor(.blueColor(), forState: .Normal)
        takePhotoButton.setTitle("Take photo", forState: .Normal)
        takePhotoButton.addTarget(self, action: #selector(ViewController.takePhotoButtonTapped), forControlEvents: .TouchUpInside)

        let chooseFromLibraryButton = UIButton()
        chooseFromLibraryButton.setTitleColor(.blueColor(), forState: .Normal)
        chooseFromLibraryButton.setTitle("Choose from library", forState: .Normal)
        chooseFromLibraryButton.addTarget(self, action: #selector(ViewController.chooseFromLibraryButtonTapped), forControlEvents: .TouchUpInside)

        let stackView = UIStackView(arrangedSubviews: [imageView, takePhotoButton, chooseFromLibraryButton])
        stackView.axis = .Vertical
        view.addSubview(stackView)
        stackView.snp_makeConstraints { make in
            make.center.equalTo(0)
        }

        imageView.snp_makeConstraints { make in
            make.width.height.equalTo(view.snp_width).offset(-40)
        }
        self.imageView = imageView
    }

    func takePhotoButtonTapped() {
        print("take")
    }

    func chooseFromLibraryButtonTapped() {
        print("choose")
    }
}
