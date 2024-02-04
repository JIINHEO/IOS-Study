//
//  OnboardingView.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/4/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요
        onboardingContentView(onboardingViewModel: onboardingViewModel)
        
    }
}

// MARK: - 온보딩 컨텐츠 뷰
private struct onboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    // fiflerpfivate인 이유는 위의 onboardingview에서만 사용될거고, 이 파일 내에서만 사용될거기 때문에.
    // private으로 하면 Init하지 못함
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack {
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            
            Spacer()
            
            StartBtnView()
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

// MARK: - 온보딩 셀 리스트 뷰
private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex = 0
    
    fileprivate init(
        onboardingViewModel: OnboardingViewModel,
        selectedIndex: Int = 0
    ) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    fileprivate var body: some View {
        TabView(selection: $selectedIndex,
                content:  {
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                OnboardingCellView(onboardingContent: onboardingContent)
                    .tag(index)
            }
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        .background(
            selectedIndex % 2 == 0
            ? Color.customSky
            : Color.customBackgroundGreen
        )
        .clipped()
    }
}


// 스위프트UI는 블록쌓기라 하위뷰들을 쪼개줌

// MARK: - 오보딩 셀 뷰
private struct OnboardingCellView: View {
    private var onboardingContent: OnboardingContent
    
    fileprivate init(onboardingContent: OnboardingContent) {
        self.onboardingContent = onboardingContent
    }
    
    fileprivate var body: some View {
        VStack {
            Image(onboardingContent.imageFileName)
                .resizable()
                .scaledToFit()
            
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                        .frame(height: 46)
                    
                    Text(onboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(onboardingContent.subTitle)
                        .font(.system(size: 16))
                }
                
                Spacer()
            }
            .background(Color.customWhite)
            .cornerRadius(10)
        }
        .shadow(radius: 10)
    }
}

// MARK: - 시작하기 버튼 뷰
private struct StartBtnView: View {
    fileprivate var body: some View {
        Button(action: {}) {
            HStack {
                Text("시작하기")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.blue)
                
                Image("startHome")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
            }
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    OnboardingView()
}
