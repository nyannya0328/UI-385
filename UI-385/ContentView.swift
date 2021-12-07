//
//  ContentView.swift
//  UI-385
//
//  Created by nyannyan0328 on 2021/12/07.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            
            TabView(selection: $currentTab) {
                
                
                Text("A")
                    .tag(Tab.Home)
                
                Text("B")
                    .tag(Tab.Cart)
                
                Text("C")
                    .tag(Tab.Liked)
                
                Text("D")
                    .tag(Tab.Profile)
                
                
                
            }
            
            HStack{
                
               
                    
                   
                TabCardView(title: "A", tab: Tab.Home)
                
                TabCardView(title: "B", tab: Tab.Cart)
                
                TabCardView(title: "C", tab: Tab.Liked)
                
                TabCardView(title: "D", tab: Tab.Profile)
                    
                    
           
                
                
            }
        }
    }
    
    @ViewBuilder
    func TabCardView(title : String,tab : Tab)->some View{
        
        
        Button {
            withAnimation{
                
                currentTab = tab
            }
        } label: {
            VStack(spacing:12){
                
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                
                
                Text(title)
                    .font(.title3)
                    
                    
                
                
            }
            .foregroundColor(currentTab == tab ? .red : .gray.opacity(0.5))
            .frame(maxWidth: .infinity)
        }

        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab : String,CaseIterable{
    
    case Home = "Home"
    case Cart = "Cart"
    case Liked = "Liked"
    case Profile = "Profile"
    
    
}

