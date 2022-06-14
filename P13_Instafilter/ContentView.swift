//
//  ContentView.swift
//  P13_Instafilter
//
//  Created by Jae Cho on 6/12/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var image: Image?
	
    var body: some View {
		 VStack{
			 image?
				 .resizable()
				 .scaledToFit()
		 }
		 .onAppear(perform: loadImage)
    }
	
	func loadImage(){
		image = Image("Example")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
