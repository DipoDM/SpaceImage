//
//  ContentView.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView{
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack{
                        NavigationLink(
                            destination: DetailView(image: imageData[0].image),
                            label: {
                                Image(imageData[0].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            })
                        
                        
                        
                        ScrollView(showsIndicators: false){
                            
                            Text(imageData[0].title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 10)
                            
                            Text(imageData[0].description)
                                .font(.headline)
                                .fontWeight(.medium)
                            
                            HStack(alignment: .firstTextBaseline) {
                                Text("Date:")
                                
                                Text(imageData[0].date)
                                    .padding(.vertical)
                            }
                            
                            HStack(alignment: .firstTextBaseline) {
                                Text("Image credit and copyright:")
                                
                                Text(imageData[0].copy_right)
                                    .padding(.bottom)
                            }
                        }
                    }
                    .padding()
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
