//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Yonghoon Choi on 5/1/23.
//

import SwiftUI
import AVFAudio


struct ContentView: View {
    //    @State private var messageString = "When Genius bar needs help, they call you!"
    @State private var messageString = " "
    @State private var imageName = ""
    @State private var imageNumber: Int = 0
    @State private var messageNumber: Int = 0
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer! // I am sure we are going to add it later before i use it
    @State private var soundNumber: Int = 0
    @State private var lastSoundNumber: Int = -1
    @State private var soundOn = true
    
    
    
    var body: some View {
        
        VStack (spacing: 0){
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(  maxWidth: .infinity, minHeight:150)
                .padding()
//                .animation(.default, value: messageString)
                .animation(.easeInOut(duration: 0.15), value: messageString)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
                .animation(.easeInOut(duration: 0.5), value: messageString)
            
            Spacer()
            
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("Sound On: ", isOn: $soundOn)
                    .labelsHidden()
                    .onChange(of: soundOn){ _ in
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                Spacer()
                Group {
                    Button("Show Message!", action: {
                        let messages = ["You are Awesome!",
                                        "You Are Great!",
                                        "Fabulous? That's You!",
                                        "You Are Fantastic!",
                                        "You Are a Code Monster!"]
                        //
                        lastMessageNumber = nonRepeatingRandom(lastNumber:lastMessageNumber , upperBound: messages.count-1)
                        
                        messageString = messages[lastMessageNumber]
                        
                        
                        lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                        imageName = "image\(lastImageNumber)"
                       
                        
                        //MARK: Sound part
                        lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                        if soundOn{
                            
                            playsound(soundName: "sound\(lastSoundNumber)")
                        }
                         
                        
                        
                        
                    })
                    .buttonStyle(.borderedProminent)
                    
                    
                }.padding()
            }.padding(20)
                .tint(.accentColor)
        }
        
        
    }
    
    //MARK: Playsound doing here
    func playsound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("🤬Could not read file named \(soundName)")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🤬 error \(error.localizedDescription) creating audio player")
        }
    }
    
    //MARK: Refactored NonRepeatingRandom
    func nonRepeatingRandom(lastNumber: Int, upperBound:Int) -> Int {
        guard upperBound > 1 else {
            print("Error: uppbound is too small \(upperBound)")
            return 0
        }
        var currentNumber: Int
        repeat {
            currentNumber = Int.random(in: 0...upperBound)
        } while currentNumber == lastNumber
        return currentNumber
                    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
