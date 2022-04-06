//
//  ProgrammaticallyPerformNavigation.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

struct ProgrammaticallyPerformNavigation: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isActive = true
        }
    }
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                
                NavigationLink(
                    destination: DetailView(),
                    isActive: $isActive,
                    label: {
                        EmptyView()
                    }
                )
                
                VStack {
                    
   
                
                    
                    Form {
                        
                        TextField("User name", text: $username)
                        SecureField("Password", text: $password)
                        HStack {
                            Spacer()
                            Button("Login") {
                                login()
                            }
                            .buttonStyle(PlainButtonStyle())
                            Spacer()
                        
                        }
                        
                        
                    }
                    .navigationTitle("Login")
                    
                }
                
            }
  


        }
    
    

        
    }
    


    
}

fileprivate struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarHidden(true)
    }
}


struct ProgrammaticallyPerformNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticallyPerformNavigation()
    }
}
