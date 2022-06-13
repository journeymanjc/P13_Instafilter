//
//  ContentView.swift
//  P13_Instafilter
//
//  Created by Jae Cho on 6/12/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var blurAmount = 0.0 {
		didSet{
			//DOES NOT WORK
			print("New value is \(blurAmount)")
		}
	}
	
    var body: some View {
		 VStack{
			 Text("Hello, World!")
				 .blur(radius: blurAmount)
			 Slider(value: $blurAmount, in: 0...20)
				 .onChange(of: blurAmount) { newValue in
					 //WORKS!
					 print("New value is \(newValue)")
				 }
			 Button("Randmon Blur") {
				 blurAmount = Double.random(in: 0...20)
			 }
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
