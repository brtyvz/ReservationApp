//
//  LoginView.swift
//  ReservationApp
//
//  Created by Berat Yavuz on 29.11.2022.
//

import SwiftUI

struct LoginView: View {
    @State var password:String = ""
    @State var no: String = ""
    @State var maxCircleHeight:CGFloat = 0
    var body: some View {
        
        VStack{
            
            GeometryReader{proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                DispatchQueue.main.async {
                    if maxCircleHeight == 0{
                        maxCircleHeight = height
                    }
                }
                return AnyView(
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .offset(x: getReact().width/2, y: -height/1.3)
                        
                        Circle()
                            .fill(Color.black)
                            .offset(x: -getReact().width/2, y: -height/1.5)
                            .rotationEffect(.init(degrees: -5))
                        
                        Circle()
                            .fill(Color.cyan)
                            .offset(y: -height/1.3)
                    }
                )
            }
            .frame(maxHeight:getReact().width)
            VStack {
                Text("Giriş Yap")
                    .font(.title)
                    .fontWeight(.bold)
                    .kerning(1.1)
                    .frame(maxWidth:.infinity,alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8, content:{
                    Text("Öğrenci Numaranız")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    TextField(text: $no) {
                        Text("Öğrenci Numaranız")
                    }
                    .font(.system(size: 20,weight: .semibold))
                    .padding(.top, 5)
                    Divider()
                    
                })
                .padding(.top, 25)
                VStack(alignment: .leading, spacing: 8, content:{
                    Text("Şifreniz")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    SecureField(text: $password) {
                        Text("Şifreniz")
                        
                    }
                    .font(.system(size: 20,weight: .semibold))
                    .padding(.top, 5)
                    Divider()
                    
                })
                .padding(.top, 2)
                
                //forgot password
                
                Button {
                    
                } label: {
                    Text("Şifremi Unuttum")
                        .fontWeight(.bold)
                        
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.top,10)
                
                
                //Next Button
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                    //Shadow
                        .shadow(color:Color.blue.opacity(0.6), radius: 5,x:0,y:0)
                }

                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.top,10)
            }
            .padding()
            //remove unwanted space
            .padding(.top,-maxCircleHeight / 1.7)
            .frame(maxHeight:.infinity,alignment: .top)
        }
      
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func getReact()->CGRect{
        return UIScreen.main.bounds
    }
}
