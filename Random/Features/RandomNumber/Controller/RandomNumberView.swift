//
//  RandomNumberView.swift
//  Random
//
//  Created by Andrey Dorofeev on 05.10.2021.
//

import SwiftUI

struct RandomNumberView: View {
    @State private var min: String = "0"
    @State private var max: String = "100"
    
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
            HStack {
                Text("Min:")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                TextField("Minimum number ", value: $min, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Text("Max:")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                TextField("Maximum number ", value: $max, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
            Button("Generate") {
                print("generate")
            }
            Spacer()
        }
    }
}

struct RandomNumberView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}
