 //
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Yonghoon Choi on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = " "
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Image(systemName: "2.circle")
                        .resizable()
                        .scaledToFit()
                    
                    Image(systemName: "swift")
                    
                Text(messageString)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                   
                //                .background(.yellow)
                }
                HStack {
                    Button("Awesome!", action: {
                        messageString="You Are Awesome!"
                    })
                    .buttonStyle(.borderedProminent)
                    Button("Great!" ) {
                        // this is the action performed when the button is pressed
                        messageString = "You are Great!"
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
                Rectangle()
                    
                
            }.foregroundColor(.gray)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
