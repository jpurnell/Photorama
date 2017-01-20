//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Justin Purnell on 1/20/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
	
	@IBOutlet var imageView: UIImageView!
	var store: PhotoStore!
	
	override func viewDidLoad() {
		 super.viewDidLoad()
		
		store.fetchPhotos(.interestingPhotos) {
			(photosResult) -> Void in
			switch photosResult {
			case let .success(photos):
				print("Successfully found \(photos.count) photos.")
				if let firstPhoto = photos.first {
					self.updateImageView(for: firstPhoto)
				}
			case let .failure(error):
				print("Error fetching interesting photos: \(error)")
			}
		}
	}
	
	func updateImageView(for photo: Photo) {
		store.fetchImage(for: photo) {
			(imageResult) -> Void in
			
			switch imageResult {
			case let .success(image):
				self.imageView.image = image
			case let .failure(error):
				print("Error downloading image: \(error)")
			}
		}
	}
}
