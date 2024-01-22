//
//  ContentView.swift
//  Profile
//
//  Created by Ashly Ruiz on 1/19/24.
//

import SwiftUI

// Data model object
struct ContextItem: Identifiable {
    var id = UUID() // Generate a unique identifier for each item
    var title: String
    var imageName: String
    var description: String
}

struct ContentView: View {
    // Sample data for context items
    let contextItems: [ContextItem] = [
        ContextItem(title: "Background Information", imageName: "background", description: "Arthur Read, is an anthropomorphic brown aardvark who lives in the fictional town of Elwood City. He is a third-grade student at Lakewood Elementary School. Arthur is an animated edutainment television series for children ages 4 to 8, the show revolves around the lives of Arthur Read,his friends and family, and their daily interactions with each other."),
        ContextItem(title: "Friends and Family", imageName: "friends", description: "Arthur's family includes two home-working parents, his father David (a chef) and his mother Jane (an accountant), his two younger sisters, Dora Winifred (D.W.), who is in preschool, and Kate, who is still an infant, and his dog Pal.   Arthur's closest friends include Buster, Francine, Muffy, Binky, Brain, and Sue Ellen. They all come from diverse ethnic and socioeconomic backgrounds"),
        ContextItem(title: "Fun Facts", imageName: "fun", description: "Developed by Kathy Waugh for PBS and produced by WGBH. Aired its first episode on October 7, 1996. It was the longest-running children's animated series in the U.S. and is the third longest-running animated series in the U.S., behind South Park and The Simpsons.")
    ]

    @State private var selectedContextItem: ContextItem?

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("arthur")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                    .padding()

                ForEach(contextItems) { item in
                    NavigationLink(destination: DetailView(contextItem: item)) {
                        Text(item.title) // Display the title of each context item
                            .font(.headline)
                            .padding()
                            .background(Color.mint)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .id(item.id) // Use unique identifier for each item
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Arthur", displayMode: .inline)
        }
    }
}

struct DetailView: View {
    var contextItem: ContextItem

    var body: some View {
        VStack {
            Image(contextItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)

            Text(contextItem.description)
                .padding()
                .multilineTextAlignment(.center)

            Spacer()
        }
        .navigationBarTitle(contextItem.title, displayMode: .inline) // Dynamically display the selected context item's title
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    private var backButton: some View {
        Button(action: {
            // Dismiss the detail view
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(.blue)
        }
    }

    @Environment(\.presentationMode) var presentationMode
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

