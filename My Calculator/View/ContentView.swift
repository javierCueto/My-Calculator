//
//  ContentView.swift
//  My Calculator
//
//  Created by José Javier Cueto Mejía on 19/06/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String{
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal
    case ac, plusMinus, percent, delete
    
    var title: String {
        switch self {
        case .zero : return "0"
        case .one : return "1"
        case .two : return "2"
        case .three : return "3"
        case .four : return "4"
        case .five : return "5"
        case .six : return "6"
        case .seven : return "7"
        case .eight : return "8"
        case .nine : return "9"
        case .plus : return "plus"
        case .minus : return "minus"
        case .multiply : return "multiply"
        case .plusMinus : return "plus.slash.minus"
        case .percent : return "%"
        case .equals : return "equal"
        case .decimal : return "."
        case .divide : return "divide"
        case .delete : return "delete.left.fill"
        default:
            return "AC"
            
        }
    }
    
    var backgroundColor: Color {
        switch self{
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color("ColorDigits")
        case .ac, .plusMinus, .percent , .delete:
            return Color.blue
        case .equals:
            return Color.white
        default:
            return .orange
        }
    }
    
    
    var arrayColor:[Color]{
        switch self{
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return [Color("ColorButtons"),Color("ColorButtons2"),Color("ColorButtons2"),Color("ColorButtons2")]
        case .ac, .plusMinus, .percent:
            return [Color("ColorButtons"),Color("ColorButtons2"),Color("ColorButtons2"),Color("ColorButtons2")]
        case .equals:
            return [Color("ColorOrange1"),.orange]
        default:
            return [Color("ColorButtons"),Color("ColorButtons2"),Color("ColorButtons2"),Color("ColorButtons2")]
        }
    }
    
    
    var shadownColor: Color{
        switch self{
        case .equals:
            return Color("ColorShadownOrange")
        default:
            return Color("ColorShadown")
        }
    }
    
    var isImage: Bool{
        switch self {
        case .delete,.plus, .minus, .multiply, .plusMinus, .equals, .divide:
            return true
        default:
            return false
        }
    }
    
}

struct ContentView: View {
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .seven, .four , .one, .zero],
        [.plusMinus , .eight, .five, .two, .decimal],
        [.percent , .nine, .six, .three, .equals],
        [.delete, .divide , .multiply, .minus, .plus]
    ]
    
    @State private var digitsCalculation = "0"
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0){
                GeometryReader { geometryCal in
                    VStack(spacing: 0){
                        
                        
                        VStack(){
                            
                            Spacer()
                            HStack(){
                                Spacer()
                                Button(action : {
                                    print("here")
                                }){
                                    Image(systemName: "gear")
                                        .foregroundColor(Color("ColorDigits"))
                                        .padding(.horizontal, (geometry.size.width/5) / 4)
                                }
                            }
                            
                            Spacer()
                            Text("5")
                                .foregroundColor(Color("ColorDigits"))
                                .font(.system(size: 40))
                                .frame(maxWidth:.infinity ,alignment: .bottomTrailing)
                                .padding(.horizontal, (geometry.size.width/5) / 5)
                            
                        }.frame(maxWidth:.infinity ,maxHeight : (geometryCal.size.height/4) * 2)
                         
                        
                        
                        
                        
                        
                        Spacer()
                        
                        Text(self.digitsCalculation)
                            .foregroundColor(Color("ColorDigits"))
                            .font(.system(size: 90))
                            .frame(maxWidth:.infinity ,maxHeight : (geometryCal.size.height/4) * 2, alignment: .bottomTrailing)
                            .padding(.horizontal, (geometry.size.width/5) / 5)
                        
                        
                        
                        
                    }
                }
                Spacer()
                HStack(alignment: .center ,spacing: 0){
                    
                    ForEach(self.buttons, id: \.self){ row in
                        
                        VStack(alignment: .center ,spacing: 0){
                            
                            ForEach(row, id: \.self){ button in
                                
                                Button(action: {
                                    self.digitsCalculation = self.digitsCalculation + button.title
                                    
                                }){
                                    ContentView2(button: button, geometryWidth: geometry.size.width)
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                    }
                    
                }.padding(.bottom, (geometry.size.width/5) / 10)
                
                
            }
            
            
        }
        .background(Color("ColorBackground"))
        .edgesIgnoringSafeArea(.all)
        
    }
    
    
    
}

struct ContentView2: View {
    
    let button: CalculatorButton
    let geometryWidth: CGFloat
    
    @ViewBuilder
    var body: some View {
        if button.isImage {
            
            
            Image(systemName: button.title)
                .font(.title)
                .foregroundColor(button.backgroundColor)
                .frame(width: (geometryWidth/5), height: (geometryWidth/5)  )
                
                .background(LinearGradient(gradient: Gradient(colors: button.arrayColor ), startPoint: .topLeading, endPoint: .bottomTrailing) )
                .cornerRadius((geometryWidth/5))
                .overlay(Capsule().stroke(Color("ColorShadown"), lineWidth: 0.2))
                .padding(.horizontal, (geometryWidth/5) / 10)
                .padding(.bottom, (geometryWidth/5) / 10)
                .shadow(color: button.shadownColor, radius: 7, x: 6, y: 8)
        }else{
            
            
            Text(button.title)
                .font(.title)
                .foregroundColor(button.backgroundColor)
                .frame(width: (geometryWidth/5), height: (geometryWidth/5) )
                
                .background(LinearGradient(gradient: Gradient(colors: button.arrayColor ), startPoint: .topLeading, endPoint: .bottomTrailing) )
                .cornerRadius((geometryWidth/5))
                .overlay(Capsule().stroke(Color("ColorShadown"), lineWidth: 0.2))
                .padding(.horizontal, (geometryWidth/5) / 10)
                .padding(.bottom, (geometryWidth/5) / 10)
                .shadow(color: button.shadownColor, radius: 7, x: 6, y: 8)
        }
        
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
