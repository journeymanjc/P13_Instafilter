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
	@State private var filterIntensity: Double = 0.5
	
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	
	@State private var currentFilter = CIFilter.sepiaTone()
	let context = CIContext()
	
	@State private var showingFilterSheet = false
	
	var body: some View{
		NavigationView{
			VStack{
				ZStack{
					Rectangle()
						.fill(.secondary)
					Text("Tap to select a picture")
						.foregroundColor(.white)
						.font(.headline)
					
					image?
						.resizable()
						.scaledToFit()
				}
				.onTapGesture {
					showingImagePicker = true
				}
				
				HStack{
					Text("Intensity")
					Slider(value: $filterIntensity)
						.onChange(of: filterIntensity) { _ in
							applyProcessing()
						}
				}
				.padding()
				
				HStack{
					Button("Change Filter") {
						//Change filter
						showingFilterSheet = true
					}
					
					Spacer()
					Button("Save", action: save)
				}
			}
			.navigationTitle("Instafilter")
		}
		.padding([.horizontal, .bottom])
		
		.onChange(of: inputImage) { _ in loadImage()  }
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker(image: $inputImage)
		}
		.confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
			// dialog here
		}
	}
	
	func save(){
		
	}
	
	func applyProcessing(){
		currentFilter.intensity = Float(filterIntensity)
		guard let outputImage = currentFilter.outputImage else { return }
		
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
		}
	}
	
	func loadImage(){
		guard let inputImage = inputImage else {
			return
		}
		let beginImage =  CIImage(image: inputImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
