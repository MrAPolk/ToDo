//
//  ToDoInputView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 07/10/2020.
//

import SwiftUI

struct ToDoInputView: View {
    
    var addToDo: ((_ text: String)->Void)
    
    @State private var text = ""
    @State private var displayPopUp = false;
    @State private var popUpMessage = ""
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                TextField("I want to...", text: $text)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(4.0)
                Button("+", action: plusTapped)
                    .font(.largeTitle)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.gray)
            }.padding([.top, .leading])
            Spacer()
            if displayPopUp {
                CustomTextView(text: popUpMessage)
                    .onAppear(perform: hidePopUp)
            }
        }
        .navigationBarTitle("Add To Do", displayMode: .inline)
    }
    
    private func plusTapped() {
        guard !text.isEmpty else {
            displayPopUp(with: "Can not add empty To Do.")
            return
        }
        addToDo(text)
        text = ""
        displayPopUp(with: "To Do Added.")
    }
    
    private func displayPopUp(with message: String) {
        popUpMessage = message
        withAnimation {
            displayPopUp = true
        }
    }
    
    private func hidePopUp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                displayPopUp = false
            }
        }
    }
}

struct ToDoInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoInputView(addToDo: {_ in })
    }
}
