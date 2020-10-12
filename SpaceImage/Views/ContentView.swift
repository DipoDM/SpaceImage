//
//  ContentView.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var spaceDatas = [SpaceData]()
    var body: some View {
        
                ZStack {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                    DisplayedData()
                    
                }
                .onAppear{
                    print("onAppear")
                    self.networkManager.fetchData()
                    print("from view \(spaceDatas)")
                    
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DisplayedData: View {
    @State var isPresent = false
    @ObservedObject var networkManager = NetworkManager()
    //@State var spaceDatas = [Results]()
    //@State var spaceDatas = [SpaceData]()
    
    var body: some View {
        VStack{
            Image(imageData[0].image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture{
                    isPresent.toggle()
                }
                .fullScreenCover(isPresented: $isPresent){
                    DetailView(image: imageData[0].image, isFullScreen: $isPresent)
                }
            
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
        .edgesIgnoringSafeArea(.bottom)
    }
}
