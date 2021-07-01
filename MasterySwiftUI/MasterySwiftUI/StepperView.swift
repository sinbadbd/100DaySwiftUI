    import  SwiftUI
    
    struct StepperView: View {
          @State private var value = 0
          let colors: [Color] = [.orange, .red, .gray, .blue,
                                 .green, .purple, .pink]
 
          func incrementStep() {
              value += 1
              if value >= colors.count { value = 0 }
          }
 
          func decrementStep() {
              value -= 1
              if value < 0 { value = colors.count - 1 }
          }
 
          var body: some View {
              Stepper(onIncrement: incrementStep,
                  onDecrement: decrementStep) {
                  Text("Value: \(value) Color: \(colors[value].description)")
              }
              .padding(5)
              .background(colors[value])
          }
     }
