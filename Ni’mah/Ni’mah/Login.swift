import SwiftUI

struct Login: View {
    @State private var phoneNumber: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.alabaster
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hey, welcome in!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.forestGreen)
                        .padding(.top, 160)
                        .offset(x: -50)
                    
                    Text("Sign up with your number and let’s get composing!")
                        .font(.system(size: 12))
                        .foregroundColor(.oliveGreen.opacity(0.8))
                        .offset(y: 7)
                    
                    VStack {
                        TextField("", text: $phoneNumber, prompt: Text("+966 5XXXXXX")
                            .foregroundColor(.gray)
                            .font(.system(size: 14)))
                            .keyboardType(.numberPad)
                            .offset(x: 16, y: 0)
                            .frame(width: 300, height: 40)
                            .background(RoundedRectangle(cornerRadius: 6)
                                .stroke(showError ? Color.red : Color.oliveGreen, lineWidth: 1))
                            .background(Color.alabaster)
                            .cornerRadius(6)
                            .onChange(of: phoneNumber) { _ in
                                validatePhoneNumber()
                            }
                    }
                    .offset(x: 6, y: 10)
                    
                    Button(action: {
                        validatePhoneNumber()
                    }) {
                        Text("Sign up")
                            .frame(width: 300, height: 35)
                            .background(Color.oliveGreen)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    .offset(x: 6, y: 10)
                    .padding(.top, 10)

                   
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.forestGreen)
                            .font(.system(size: 14))
                        
                        // Ensure `NavigationLink` wraps the button for login
                        NavigationLink(destination: Loginn()) {
                            Text("Log in")
                                .foregroundColor(.pumpkin)
                                .font(.system(size: 14))
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.top, 10)
                    .offset(y: 10)
                    
                    Spacer()
                }
                .padding()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func validatePhoneNumber() {
        let trimmedNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        showError = trimmedNumber.count != 10
    }
}
struct Loginn_Previews: PreviewProvider {
    static var previews: some View {
        Loginn()
    }
}


struct Loginn: View {
    @State private var phoneNumber: String = ""
    @State private var showError: Bool = false
    @State private var password = ""
    @State private var wrongPassword = 0
    @State private var isPasswordVisible = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.alabaster
                    .ignoresSafeArea()

                VStack {
                    Text("Hey, welcome in!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.forestGreen)
                        .padding(.top, 160)
                        .offset(x: -50)

                    Text("Log in with your number and let’s get composing!")
                        .font(.system(size: 12))
                        .foregroundColor(.oliveGreen.opacity(0.8))
                        .offset(y: 7)

                    // Phone Number Field
                    VStack {
                        TextField("", text: $phoneNumber, prompt: Text("+966 5XXXXXX")
                            .foregroundColor(.gray)
                            .font(.system(size: 14)))
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 16)
                            .frame(width: 300, height: 40)
                            .background(RoundedRectangle(cornerRadius: 6)
                                .stroke(showError ? Color.red : Color.oliveGreen, lineWidth: 1))
                            .background(Color.alabaster)
                            .cornerRadius(6)
                            .onChange(of: phoneNumber) { _ in
                                validatePhoneNumber()
                            }
                    }
                    .offset(y: 10)

                    // Password Field
                    VStack {
                        HStack {
                            if isPasswordVisible {
                                TextField("", text: $password, prompt: Text("Enter your password")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14)))
                            } else {
                                SecureField("", text: $password, prompt: Text("Enter your password")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14)))
                            }

                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 10)
                        }
                        .padding(.horizontal, 16)
                        .frame(width: 300, height: 40)
                        .background(RoundedRectangle(cornerRadius: 6)
                            .stroke(wrongPassword == 2 ? Color.red : Color.oliveGreen, lineWidth: 1))
                        .background(Color.alabaster)
                        .cornerRadius(6)
                    }
                    .offset(y: 10)

                    Button(action: {
                        validatePhoneNumber()
                    }) {
                        Text("Sign up")
                            .frame(width: 300, height: 35)
                            .background(Color.oliveGreen)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                    .offset(y: 10)
                    .padding(.top, 10)

                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private func validatePhoneNumber() {
        let trimmedNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        showError = trimmedNumber.count != 10
    }
}




struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
