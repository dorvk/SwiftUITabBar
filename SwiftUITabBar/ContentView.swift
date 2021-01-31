//
//  ContentView.swift
//  SwiftUITabBar
//
//  Created by Doruk Çoban on 30.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    @State var shouldShowModal = false
    
    let tabBarImages = ["person", "lasso", "plus.app.fill", "pencil", "gear"]
    
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                Spacer()
                
                    .sheet(isPresented: $shouldShowModal, content: {
                        
                        PresentedView(isPresented: $shouldShowModal)
                        
                })
                
                TabView(title: "Page \(selectedIndex)")

            }
            
            Spacer()
            
            Divider()
            
            HStack {
                
                ForEach(0..<5) { num in
                    
                    Button(action: {
                        
                        guard num != 2 else {
                        
                        shouldShowModal.toggle()
                            
                        return }
 
                        selectedIndex = num
                        
                    }, label: {
                        
                        Spacer()
                        
                        Image(systemName: tabBarImages[num])
                            
                            .font(.system(size: num == 2 ? 48 : 24, weight: .bold))
                            
                            .foregroundColor(num == 2 ? .red : selectedIndex == num ? .black : .gray)

                            Spacer()
                        
                    })
                    
                }
                
            }
            
        }
        
    }
    
    
    
}


struct PresentedView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        NavigationView {

            ScrollView {
                
                
                    
            }

            .navigationBarItems(leading: Button(action: {
                                        
                self.isPresented.toggle()
                
            }, label: {
                
                Text("Back")
                    
            }))
            
        }
        
    }
    
}



struct TabView: View {
    
    let title: String
    
    init(title: String) {
        
        self.title = title
        
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                    
            }

            .navigationTitle(title)
        
            
        }
        
    }
    
}





struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
    
}


