//
//  FrameworkGridViewModel.swift
//  AppleFrameWork
//
//  Created by Kalash Surendra Choudhary on 07/05/26.
//

import SwiftUI
internal import Combine

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
           isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
