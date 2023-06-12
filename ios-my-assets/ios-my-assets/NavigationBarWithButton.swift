//
//  NavigationBarWithButton.swift
//  ios-my-assets
//
//  Created by 허지인 on 2021/12/07.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight:  .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산 추가 버튼 tapped")
                    }, label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                )
                    .accentColor(.black)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
                    .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black))
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                let apperance = UINavigationBarAppearance()
                apperance.configureWithOpaqueBackground()
                apperance.backgroundColor =
                UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance()
                    .standardAppearance = apperance
                UINavigationBar.appearance().compactAppearance = apperance
                UINavigationBar.appearance().scrollEdgeAppearance = apperance
            }
    }
}
extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
               .navigationBarWithButtonStyle("내 자산")
        }
    }
}
