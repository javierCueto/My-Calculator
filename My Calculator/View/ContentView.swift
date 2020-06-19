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
    case ac, plusMinus, percent
    
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
        case .plus : return "+"
        case .minus : return "-"
        case .multiply : return "x"
        case .plusMinus : return "+/-"
        case .percent : return "%"
        case .equals : return "="
        case .decimal : return "."
        case .divide : return "/"
        default:
            return "AC"
            
        }
    }
    
    var backgroundColor: Color {
        switch self{
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .seven, .four , .one, .zero],
        [.plusMinus , .eight, .five, .two, .decimal],
        [.percent , .nine, .six, .three, .equals],
        [.divide , .multiply, .minus, .plus]
    ]
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0){
                
                Spacer()
                
                
                
                HStack(alignment: .center ,spacing: 0){
                    
                    ForEach(self.buttons, id: \.self){ row in
                        
                        VStack(alignment: .center ,spacing: 0){
                            
                            ForEach(row, id: \.self){ button in
                                
                                Button(action: {
                                    
                                }){
                                    
                                    Text(button.title)
                                        .frame(width: (geometry.size.width/5), height: self.buttonHeight(button: button, height: geometry.size.width)  )
                                        
                                        .background(Color.white)
                                        .cornerRadius((geometry.size.width/5))
                                        .padding(.horizontal, (geometry.size.width/5) / 10)
                                        .padding(.vertical, (geometry.size.width/5) / 10)
                                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                    
                                    
                                    
                                    
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                    }
                    
                }.padding(.bottom, (geometry.size.width/5) / 10)
                
                
            }
            
            
        }
        
    }
    
    
    func buttonHeight(button: CalculatorButton, height: CGFloat) -> CGFloat{
        if button == .plus{
            
            return (((height/5 )) * 2) + ((height/5 ) / 5)
        }
        return (height/5)
    }
    
    func  buttonIsPlus(button: CalculatorButton) -> Bool{
        if button == .plus{
            return true
        }
        return false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
