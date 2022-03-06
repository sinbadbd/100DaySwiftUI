//
//  Home.swift
//  AppleBedTime
//
//  Created by Imran Mia on 9/2/22.
//

import SwiftUI

struct Home: View {
    
    @State var startAngle: Double = 0
    
    // 0.5 * 360 = 180
    @State var toAngle: Double = 180
    
    @State var startProgess: CGFloat = 0
    @State var topProgress: CGFloat = 0.5
    
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Today")
                        .font(.title.bold())
                    Text("Good morning! Justine")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Image("spiderman")
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
                
            }
            SleepTimeSlider()
                .padding(.top, 50)
            
            Button {
                
            } label: {
                Text("Start Sleep")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 40)
                    .background(Color("Blue"), in : Capsule())
                    
            }.font(.callout)
            .padding(.top, 45)
            
            HStack(spacing: 25){
                VStack(alignment: .leading, spacing: 8){
                    Label {
                        Text("Bed time")
                            .foregroundColor(.black)
                    }icon: {
                        Image(systemName: "moon.fill")
                            .foregroundColor(Color("Blue"))
                    }.font(.callout)
                    
                    Text(getTime(angle: startAngle).formatted(date: .omitted, time: .shortened))
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                VStack(alignment: .leading, spacing: 8){
                    Label {
                        Text("Weakup")
                            .foregroundColor(.black)
                    }icon: {
                        Image(systemName: "sleep.fill")
                            .foregroundColor(Color("Blue"))
                    }.font(.callout)
                    
                    Text(getTime(angle: toAngle).formatted(date: .omitted, time: .shortened))
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.top, 20)

        }
        .padding()
        // moving to top without Spacer
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    func SleepTimeSlider() -> some View {
        GeometryReader{ proxy in
            
            let width = proxy.size.width
            
            ZStack {
                
                // MARK: Clock Design
                
                ZStack {
                    ForEach(1...60, id: \.self) { index in
                        Rectangle()
                            .fill( index % 5 == 0 ? .black : .gray)
                            .frame(width: 2, height: index % 5 == 0 ? 10 : 5)
                            .offset(y: (width - 60) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 6))
                    }
                    
                    let texts = [6,9,12,3]
                    ForEach(texts.indices, id:\.self) { index in
                        Text("\(texts[index])")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .rotationEffect(.init(degrees: Double(index) * -90))
                            .offset(y: (width - 90) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 90))
                    }
                }
                
                Circle()
                    .stroke(.black.opacity(0.06), lineWidth: 40)
                
                let reverseRoration = (startProgess > topProgress ) ? -Double((1 - startProgess) * 360) : 0
                
                Circle()
                    .trim(from: startProgess > topProgress ? 0 : startProgess, to: topProgress + (-reverseRoration / 360))
                    .stroke(Color("Blue"), style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
                    .rotationEffect(.init(degrees: reverseRoration))
                
                // Slide Buttons
                Image(systemName: "moon.fill")
                    .font(.callout)
                    .foregroundColor(Color("Blue"))
                    .frame(width: 30, height: 30)
                    .rotationEffect(.init(degrees: 90))
                    .rotationEffect(.init(degrees: -startAngle))
                    .background(.white, in: Circle())
                    //moving to roght and rotating
                    .offset(x: width / 2)
                    .rotationEffect(.init(degrees: startAngle))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                onDrag(value: value, fromSlider: true)
                            })
                    )
                    .rotationEffect(.init(degrees: -90))
               
                Image(systemName: "alarm")
                    .font(.callout)
                    .foregroundColor(Color("Blue"))
                    .frame(width: 30, height: 30)
                    .rotationEffect(.init(degrees: 90))
                    .rotationEffect(.init(degrees: -toAngle))
                    .background(.white, in: Circle())
                    //moving to roght and rotating
                    .offset(x: width / 2)
                    //.rotationEffect(.init(degrees: -90))
                    .rotationEffect(.init(degrees: toAngle))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                print(value)
                                onDrag(value: value)
                            })
                    )
                    .rotationEffect(.init(degrees: -90))
                
                // MARK
                VStack(spacing: 8) {
                    Text("\(getTimeDateDiff().0)hr")
                        .font(.largeTitle.bold())
                    Text("\(getTimeDateDiff().0)min")
                        .foregroundColor(.gray)
                }
                .scaleEffect(1.1)
                
            }
        }.frame(width: screenBounds().width / 1.6, height: screenBounds().width / 1.6)
    }
    
    func onDrag(value: DragGesture.Value, fromSlider: Bool = false ){
        //mark: converting transalation into angle
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        // remove the button radius
        
        let radians = atan2(vector.dy - 15, vector.dx - 15)
        var angle = radians * 180 / .pi
        if angle < 0 { angle = 360 + angle }
        
        let progess = angle / 360
        
        if fromSlider {
            self.startAngle = angle
            self.startProgess = progess
        }else {
            self.toAngle = angle
            self.topProgress = progess
        }
        
    }
    
    func getTime(angle: Double) ->Date {
        let progress = angle / 30
        
        let hour = Int(progress)
        
        let remainder = (progress.truncatingRemainder(dividingBy: 1) * 12).rounded()
        
        var minute = remainder * 5
        minute = (minute > 55 ? 55 : minute)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        if let date = formatter.date(from: "\(hour): \(Int(minute)):00"){
            return date
        }
        return .init()
    }
    
    func getTimeDateDiff() -> (Int, Int){
        let calender = Calendar.current
        
        let result = calender.dateComponents([.hour, .minute], from: getTime(angle: startAngle), to: getTime(angle: toAngle))
        return (result.hour ?? 0, result.minute ?? 0)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View  {
    func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}


