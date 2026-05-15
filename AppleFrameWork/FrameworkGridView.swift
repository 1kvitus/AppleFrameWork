//
//  FrameworkGridView.swift
//  AppleFrameWork
//
//  Created by Kalash Surendra Choudhary on 06/05/26.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView
        {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkName(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                        
                    }
                }
                .navigationTitle(
                    Text("🍎 Frameworks")
                       
                )
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, frameworks: viewModel.selectedFramework!)
                }
            }
        }
            
    }
}



struct FrameworkName: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}
