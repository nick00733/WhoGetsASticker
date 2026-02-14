import SwiftUI

struct ContentView: View {
    
    @State private var winningMessage = ""
    @State private var posters: [String] = []
    @State private var name = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            
            Text("Who Gets a Sticker?")
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                
                Button("Clear") {
                    posters.removeAll()
                    name = ""
                    winningMessage = ""
                    textFieldIsFocused = false
                }
                .tint(.red.opacity(0.8))
                
                Spacer()
                
                Button("Pick a Winner") {
                    winningMessage = "This Week's Winner is:\n\(posters.randomElement() ?? "No one")"
                    textFieldIsFocused = false
                    name = ""
                    }
                }
                .tint(.green.opacity(0.8))
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .bold()
            .disabled(posters.isEmpty)
            
            Image("sticker")
                .resizable()
                .scaledToFit()
            
            Text(winningMessage)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .frame(height: 160)
                .minimumScaleFactor(0.5)
            
            // Add Poster Section
            HStack {
                TextField("enter name", text: $name)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    }
                    .autocorrectionDisabled()
                    .focused($textFieldIsFocused)
                
                Button {
                    if !name.isEmpty {
                        posters.append(name)
                        name = ""
                        textFieldIsFocused = false
                    }
                } label: {
                    Image(systemName: "plus")
                }
                .bold()
            }
            .font(.title2)
            
            Spacer()
            
            Text("This Week's Posters Are:")
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
            Text(posters.isEmpty ? "No Posters This Week" : posters.joined(separator: ", "))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
