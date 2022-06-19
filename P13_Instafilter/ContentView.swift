//
//  ContentView.swift
//  P13_Instafilter
//
//  Created by Jae Cho on 6/12/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
	
	@State private var image: Image?
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	var body: some View{
		VStack{
			image?
				.resizable()
				.scaledToFit()
			
			Button("Select Image"){
				showingImagePicker = true
			}
			Button("Save Image") {
				guard let inputImage = inputImage else { return }
				
				let imageSaver = ImageSaver()
				imageSaver.writeToPhotoAlbum(image: inputImage)
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker(image: $inputImage)
		}
		.onChange(of: inputImage) { _ in
			loadImage()
		}
	}
	
	func loadImage() {
		guard let inputImage = inputImage else {
			return
		}
		image = Image(uiImage: inputImage)
		//first param is the image to save.
		//Second param is the object that should be notified about the result of the save.
		//Thirs param method on the object that should be run.
		//Fourth param is data that will be passed back to us when the completion method is called.
		UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
	}
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
