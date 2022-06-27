//
//  ImageSaver.swift
//  P13_Instafilter
//
//  Created by Jae Cho on 6/18/22.
//

import Foundation
import SwiftUI

class ImageSaver: NSObject {
	var successHandler: (() -> Void)?
	var errorHandler: ((Error) -> Void)?
	
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}
	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
		if let error = error {
			errorHandler?(error)
		}else{
			successHandler?()
		}
	}
}
