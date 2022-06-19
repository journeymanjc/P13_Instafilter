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
	
	var body: some View{
		VStack{
			image?
				.resizable()
				.scaledToFit()
			
			Button("Select Image"){
				showingImagePicker = true
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker()
		}

	}
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
