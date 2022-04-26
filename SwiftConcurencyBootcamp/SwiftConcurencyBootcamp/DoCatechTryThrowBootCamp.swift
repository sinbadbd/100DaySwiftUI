//
//  DoCatechTryThrowBootCamp.swift
//  SwiftConcurencyBootcamp
//
//  Created by Imran on 26/4/22.
//

import SwiftUI


class DoCatechTryThrowBootDataManager{
    
    let isActive: Bool = false
    
    func getTitle() -> (title: String?, error: Error?) { // touple
        if isActive {
            return ("new text comming", nil)
        }else {
            return ("something went to wrong", URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("new Text")
        }else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "new text comming"
        }else {
            throw URLError(.appTransportSecurityRequiresSecureConnection)
        }
    }
}


class DoCatechTryThrowBootCampViewModel: ObservableObject {
    @Published var text: String = "Staring new text.."
    let manager = DoCatechTryThrowBootDataManager()
    
    func fetchTitle(){
        /*
        let updateValue = manager.getTitle()
        if let newValue =  updateValue.title {
            text = newValue
        }else if let err = updateValue.error {
            text = err.localizedDescription
        }*/
        
        
        /*
        let result = manager.getTitle2()
        switch result {
            case .success(let newTitle):
                self.text = newTitle
        case .failure(let err ):
            self.text = err.localizedDescription
        }*/
        
        
        
        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}



struct DoCatechTryThrowBootCamp: View {
    @StateObject var viewModel = DoCatechTryThrowBootCampViewModel()
    var body: some View {
        Text(viewModel.text)
            .frame(width: 250, height: 200, alignment: .center)
            .background(
                Color.blue
            )
            .foregroundColor(.white)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

struct DoCatechTryThrowBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatechTryThrowBootCamp()
    }
}
