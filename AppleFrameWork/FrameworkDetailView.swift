//
//  DetailView.swift
//  AppleFrameWork
//
//  Created by Kalash Surendra Choudhary on 06/05/26.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    var frameworks: Framework
    var body: some View {
        VStack(spacing: 15){
            HStack{
                Spacer()
                Button {
                    isShowingDetailView =  false
                }label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                }
            }
            
    
            FrameworkName(framework: frameworks)
            Text(frameworks.description)
            Button {
               isShowingSafariView = true
            }label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.top, 40)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: frameworks.urlString)!)
        })
        .padding()
    }
}


#Preview {
    FrameworkDetailView(isShowingDetailView: .constant(false), frameworks: MockData.frameworks[0]
                        
    )
}
