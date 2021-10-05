//
//  RandomNumberView.swift
//  Random
//
//  Created by Andrey Dorofeev on 05.10.2021.
//

import SwiftUI

struct RandomNumberView: View {
    var body: some View {
        VStack(spacing: 36.0) {
            Text("Current Random Number")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .offset(y: 36)
            Spacer()
            Text("0")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("Min:")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
            Text("Max:")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
            Spacer()
        }
    }
}

struct RandomNumberView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}
