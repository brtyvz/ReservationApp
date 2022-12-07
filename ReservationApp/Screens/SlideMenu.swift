//
//  HomeView.swift
//  ReservationApp
//
//  Created by Berat Yavuz on 7.12.2022.
//

import SwiftUI

struct SlideMenu: View {
    @State private var isShowing = false
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                  if isShowing{
                      SideMenuView(isShowing: $isShowing)
                    }
                    HomeView2()
                        .cornerRadius(isShowing ? 30 : 10)
                        .offset(x: isShowing ? 290 : 0, y: isShowing ? 44 : 0)
                        .scaleEffect(isShowing ? 0.8 : 1)
                        .navigationBarItems(leading:Button(action: {
                            
                            withAnimation(.spring()){
                                isShowing.toggle()
                            }
                            
                        }, label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                        }) )
                        .navigationTitle("Home")
                }
                .onAppear{
                    isShowing = false
                }
            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}


struct HomeView2: View {
    var body: some View {
        ZStack {
            Color(.white)
            Text("Hello,ıjnj!")
                .padding()
        }
        
    }
}

