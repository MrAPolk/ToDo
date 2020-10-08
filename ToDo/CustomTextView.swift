//
//  CustomTextView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 08/10/2020.
//

import SwiftUI

struct CustomTextView: View {
    var text = ""
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .background(Color.gray)
            .cornerRadius(5)
            .padding()
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView(text: "Hello World!")
    }
}
