//
//  ImagePicker.swift
//  P13_Instafilter
//
//  Created by Jae Cho on 6/15/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	@Binding var image: UIImage?
	
	class Coordinator: NSObject, PHPickerViewControllerDelegate {
		func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
			//Tell the picker to go away
			picker.dismiss(animated: true)
			//Exit if no selection was made
			guard let provider = results.first?.itemProvider else { return }
			//If this has an image we ca use, use it
			if provider.canLoadObject(ofClass: UIImage.self) {
				provider.loadObject(ofClass: UIImage.self){ image, _ in
					self.parent.image = image as? UIImage
				}
			}
		}
		
		var parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
	}
	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration()
		config.filter = .images
		
		let picker = PHPickerViewController(configuration: config)
		//This line added to assign a delegate
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
		
	}
	//SwiftUI will automatically call this func.
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}
