//
//  GalleryView.swift
//  Africa
//
//  Created by wizz on 11/13/21.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    //Efficient GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOUT
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white,lineWidth: 8)
                    )
            
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding()
                .onChange(of: gridColumn) { _ in
                    gridSwitch()
                }
            ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white,lineWidth: 1))
                                .onTapGesture {
                                    selectedAnimal = animal.image
                                    haptics.impactOccurred()
                                }
                        }
                    }
                    .animation(.easeIn)
                    .onAppear {
                        gridSwitch()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        }
        .padding(.horizontal,10)
        .padding(.vertical,50)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
