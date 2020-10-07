//
//  DetailView.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import SwiftUI

struct DetailView: View {
    var image: String
    @State var scale: CGFloat = 1.0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50)
                    })
                    
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                Image(image)
                    .resizable()
                    //.aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture()
                                .onChanged{ value in
                                    scale = value.magnitude })
                    .animation(.easeInOut)
                
                Spacer()
            }
                
        }
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "image")
    }
}


//UIScreen.main.bounds.width
