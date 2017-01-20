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
		
		store.fetchInterestingPhotos()
	}
}
