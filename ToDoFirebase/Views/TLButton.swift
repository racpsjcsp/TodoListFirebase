//
//  TLButton.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 03/07/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    .bold()
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", color: .pink) {
            // Action
        }
    }
}
