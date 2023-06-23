import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isButtonPressed = false
    @State private var errorText = ""
    //Save the state
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                    .padding(.bottom, 50)
                HStack{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .padding(.leading)
                        .padding(.bottom)
                    TextField("Login", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing)
                        .padding(.bottom)
                        .autocapitalization(.none)
                }
                HStack{
                    Image(systemName: "lock.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .padding(.leading)
                        .padding(.bottom)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing)
                        .padding(.bottom)
                }
                
                Button(action: {
                    // Checking login and password
                    // There should be a network request here, but for now,
                    // for example, a simple check of the prepared pair
                    if username == "admin" && password == "admin" {
                        isLoggedIn = true
                        errorText = ""
                    } else {
                        errorText = "Wrong login or password!"
                    }
                }) {
                    Text("Enter")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Text(errorText)
                    .foregroundColor(.red)
                    .padding(.top, 20)
                Text("\nlogin - admin, \npassword - admin")
            }
            .padding()
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
