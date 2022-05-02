//
//  PortfolioDataService.swift
//  Crypto
//
//  Created by Imran on 12/4/22.
//

import Foundation
import CoreData

class PortfolioDataService  {

    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var saveEntities: [PortfolioEntity] = []
    
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { [self] _ , error in
            guard error != nil else {
                print("Loading: \(error?.localizedDescription ?? "")")
                return
            }
            getPortfolio()
        }
    }
    
    public func updateCoin(coin: CoinModel, amount: Double){
        if let entity = saveEntities.first(where: { $0.coinID == coin.id }){
            if amount > 0 {
                update(entity: entity, amount:  amount)
            }else{
                delete(entity: entity)
            }
        }else{
            add(coin: coin, amount: amount)
        }
    }
    
    
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do{
            saveEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("\(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double){
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChange()
    }
    
    private func update(entity: PortfolioEntity, amount: Double){
        entity.amount = amount
        applyChange()
    }
    
    private func delete(entity: PortfolioEntity){
        container.viewContext.delete(entity)
        applyChange()
    }
    
    private func save(){
        do {
            try container.viewContext.save()
        }catch let error {
            print("Error saving core data: \(error.localizedDescription)")
        }
    }
    
    private func applyChange(){
        save()
        getPortfolio()
    }
    
    
    
}
