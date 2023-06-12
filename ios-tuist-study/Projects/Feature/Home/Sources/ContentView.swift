//
//  ContentView.swift
//  ProjectDescriptionHelpers
//
//  Created by jiinheo on 2022/09/25.
//

import SwiftUI
import DesignKit

public struct ContentView: View {
    public init() {}
    public var body: some View {
        VStack(alignment: .leading)  {
            HStack {
                Image.logo
                Image.misoweather
                Spacer()
                Image.location
                Image.person
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("안녕하세요!")
                        .font(.system(size: 20))
                    Text("서울의 유쾌한 막내사자님!🦁")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                }
                Spacer()
            }
            
            HStack {
                
            }
            
        }
        .padding(.leading, 28)
        .padding(.trailing, 28)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
