//
//  DetailView.swift
//  SpaceImage
//
//  Created by ODM on 10/7/20.
//

import SwiftUI

struct DetailView: View {
    var image: String
    @State var scale: CGFloat? = 1.0
    @Binding var isFullScreen : Bool
        
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Button(action: {
                        isFullScreen.toggle()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50)
                    })
                    Spacer()
                }
                Spacer()
            }
            
            VStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale!)
                    .gesture(MagnificationGesture()
                                .onChanged{ value in
                                    scale = value.magnitude })
                    .animation(.easeInOut)
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(image: "image", isFullScreen: false )
//    }
//}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
