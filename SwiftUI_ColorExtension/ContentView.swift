//
//  ContentView.swift
//  SwiftUI_ColorExtension
//
//  Created by 김선중 on 2021/04/08.
//

import SwiftUI

extension Color {
    
    //핵스(HEX) 코드 활용
    init(hex: String) {
        let scanner = Scanner(string: hex) // 문자열 파서 역할을 하는 클래스
        _ = scanner.scanString("#") // scanString은 iOS 13부터 지원.
        
        var rgb: UInt64 = 0
        //문자열을 Int64 타입으로 변환해 rgb 변수에 저장. 변환할 수 없다면 0을 반환함
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0   // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0    // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0    // 우측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
        
    }
    
    //원하는 컬러 생성
    static let peach = Color(hex: "#ff8882")
    static let ivory = Color(hex: "f8ede3")
    static let brown = Color(hex: "897853")
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("서근개발블로그")
                .foregroundColor(.brown)
                .fontWeight(.bold)
                .font(.title)
            
            Circle()
                .foregroundColor(.ivory)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.peach, lineWidth: 10))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
