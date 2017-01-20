//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Justin Purnell on 1/20/17.
//  Copyright © 2017 Justin Purnell. All rights reserved.
//

import Foundation

enum Method: String {
	case interestingPhotos = "flickr.interestingness.getList"
}


struct FlickrAPI {
	
	private static let baseURLString = "https://api.flickr.com/services/rest"
	private static let apiKey = "a6d819499131071f158fd740860a5a88"
	
	private static func flickrURL(method: Method, parameters: [String:String]?) -> URL {
		var components = URLComponents(string: baseURLString)!
		
		var queryItems = [URLQueryItem]()
		
		let baseParams = [
			"method": method.rawValue,
			"format": "json",
			"nojsoncallback": "1",
			"api_key": apiKey
		]
		
		for (key, value) in baseParams {
			let item = URLQueryItem(name: key, value: value)
			queryItems.append(item)
		}
		
		if let additionalParams = parameters {
			for (key, value) in additionalParams {
				let item = URLQueryItem(name: key, value: value)
				queryItems.append(item)
			}
		}
		
		components.queryItems = queryItems
		
		return components.url!
	}
	
	static func photos(fromJSON: data: Data) -> PhotosResult {
		do {
			let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
			var finalPhotos = [Photo]()
			return .success(finalPhotos)
		} catch let error {
			return .failure(error)
		}
	}
	
	static var interestingPhotosURL: URL {
		return flickrURL(method: .interestingPhotos, parameters: ["extras":"url_h,date_taken"])
	}

}
