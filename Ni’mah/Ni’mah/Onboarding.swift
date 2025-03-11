
import SwiftUI

// Define Onboarding Step
struct OnboardingStep {
    let title: String
    let description: String
}

// Onboarding Steps Data
private let onboardingSteps = [
    OnboardingStep(title: "Welcome to نعمة!", description: "Ready to give your \nfood scraps a second life?"),
    OnboardingStep(title: "Reborn from Scraps!", description: "Turn food scraps into rich compost\n that brings new life to your garden."),
    OnboardingStep(title: "Buy & Sell, Keep It Green!", description: "Got compost to share or need\n eco-friendly products?\n Let’s keep the cycle going!"),
    OnboardingStep(title: "Ready for a Greener Future?", description: "Composting, buying, selling\nit all starts now. Let’s make the\n world better, together!")
]

struct Onboarding: View {
    @State private var currentStep = 0
    
    init() {
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.oliveGreen // Active dot color
        pageControl.pageIndicatorTintColor = UIColor(named: "OliveGreen")?.withAlphaComponent(0.4) // Olive Green with 40% opacity
        
        // Enlarge dots using preferredIndicatorImage
        if let dotImage = UIImage(systemName: "circle.fill") {
            pageControl.preferredIndicatorImage = dotImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 10)) // Adjust size
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.alabaster.edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x:160, y:-50)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.top, 50)
                    
                    // Onboarding Steps with Swipe Support
                    TabView(selection: $currentStep) {
                        ForEach(0..<onboardingSteps.count, id: \.self) { index in
                            VStack() {
                                if index == 0 {
                                    
                                    // Page 1: Keep original text style
                                    Text(onboardingSteps[index].title)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 24, weight: .bold))
                                        .offset(x: -60, y: 180)
                                        
                                    
                                    Text(onboardingSteps[index].description)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 20))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 250)
                                        .offset(x: -40, y: 188)
                                }
                                if index == 1  {
                                  
                                    
                                    Text(onboardingSteps[index].title)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 24, weight: .bold))
                                        .offset(x: -60, y: 180)
                                    
                                    Text(onboardingSteps[index].description)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 20))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 400)
                                        .offset(x: -20, y: 188)
                                    ZStack {
                                        Image("today")
                                            .resizable()
                                            .frame(width: 130, height: 200)
                                            .offset(x:133, y:-111)
                                      
                                    }
                                }
                                if index == 2  {
                                    
                                    Text(onboardingSteps[index].title)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 24, weight: .bold))
                                        .offset(x: -30, y: 180)
                                    
                                    Text(onboardingSteps[index].description)
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 20))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 400)
                                        .offset(x: -40, y: 188)
                                    ZStack {
                                        Image("tommorow")
                                            .resizable()
                                            .frame(width: 220, height: 200)
                                            .offset(x:-90, y:-130)
                                      
                                    }
                                }
                                if index == 3  {
                                    
                                    Group {
                                        Text("Ready for a ") .foregroundColor(.oliveGreen)
                                             +
                                        Text("Greener").foregroundColor(.forestGreen)
                                             +
                                        Text(" Future? ") .foregroundColor(.oliveGreen)
                                    }
                                    .foregroundColor(.oliveGreen)
                                    .font(.system(size: 24))
                                    .offset(x: -28, y: 180)
                                    Text("Composting, buying, selling\nit all starts now. Let’s make the\n world better, together!")
                                        .foregroundColor(.oliveGreen)
                                        .font(.system(size: 20))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 400)
                                        .offset(x: -40, y: 188)
                                }
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 20)
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    
                    // Navigation Buttons
                    HStack {
                        // Skip Button
                        Button(action: {
                            currentStep = onboardingSteps.count - 1
                        }) {
                            Text("Skip")
                                .foregroundColor(.pumpkin)
                                .font(.system(size: 16))
                                .frame(width: 70, height: 40)
                        }
                        .offset(x:10, y:-170)
                        .opacity(currentStep == onboardingSteps.count - 1 ? 0 : 1) // Hide on last step
                        
                        Spacer()
                        
                        ZStack {
                            Image("line")
                                .resizable()
                                .frame(width: 81, height: 77)
                                .offset(x:9, y:-170)
                            
                            // Only show the navigation link for the last step
                            if currentStep == onboardingSteps.count - 1 {
                                NavigationLink(destination: LoginView()) {
                                    Text("I'm Ready")
                                        .foregroundColor(.pumpkin)
                                        .font(.system(size: 16))
                                        .frame(width: 120, height: 40)
                                }
                                .offset(x:10, y:-170)
                            } else {
                                Button(action: {
                                    if currentStep < onboardingSteps.count - 1 {
                                        currentStep += 1
                                    }
                                }) {
                                    Text("Next")
                                        .foregroundColor(.pumpkin)
                                        .font(.system(size: 16))
                                        .frame(width: 120, height: 40)
                                }
                                .offset(x:10, y:-170)
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct LoginView: View {
    var body: some View {
        Login()
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboarding()
}
