//
//  Categories.swift
//  Amoro-app WatchKit Extension
//
//  Created by andrea dantas on 03/03/21.
//

import Foundation
import CloudKit

class Categories {
    var image: String
    var text: String
    var RecordID : CKRecord.ID? = nil
    
    var container : CKContainer {
        return CKContainer(identifier: "iCloud.br.com.AmoroApp")
    }
    
    init(image: String, text: String, RecordID: CKRecord.ID? = nil) {
        self.image = image
        self.text = text
        self.RecordID = RecordID
    }
    
    func createRecord(completionHandler: @escaping (Error?) -> ()) {
        // dar o tipo primitivo
        let record = CKRecord(recordType: "Categories")
        //popular os campos, e transformar os valores recebidos em CKValue
        record["text"] = self.text as CKRecordValue
        record["image"] = self.image as CKRecordValue
        // salvar nossos record em nosso banco publico
        container.publicCloudDatabase.save(record) {_, error in
            if let error = error {
                completionHandler(error)
            } else {
                completionHandler(nil) }
        }
    }
    
    
    func readRecords(completionHandler: @escaping ([Categories]?, Error?)-> ()) {
        // todos os registros que tem no nosso banco de dados
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Categories", predicate: predicate)
        // executar a consulta
        let operation = CKQueryOperation(query: query)
        //criando array de categorias, que vamos mandar para nossa closure
        var categoriesRecords : [Categories] = []
        //ler todos os nossos registros e de um por um vai deixando disponivel, para realizar alguma lógica,
        operation.recordFetchedBlock = {record in
            let categories = Categories(image: record["image"] as! String, text: record["text"] as! String, RecordID: record.recordID)
            // adicionar no nosso array
            categoriesRecords.append(categories)
        }
        // vai ser executado assim que a nossa consulta for realizada, ela também é uma closure
        //o cursor é usado quando a gente tem uma busca mais completa
        operation.queryCompletionBlock = {(cursor, error) in
            // verifica se o erro é nulo a gente pode adicionar os nossos valores da array
            if error == nil {
                completionHandler(categoriesRecords, nil)
            } else {
                completionHandler(nil, error)
            }
        }
        // executar, se não der erro
        container.publicCloudDatabase.add(operation)
    }
    
    func deleteRecordWithId(completionHandler: @escaping (Error?)-> ()) {
        container.publicCloudDatabase.delete(withRecordID: self.RecordID!) { (_, error) in
            if error == nil {
                completionHandler(nil)
            } else {
                completionHandler(error)
            }
        }
        
        func updateRecordWithId(text: String, image: String, completionHandler: @escaping (Error?)-> ()){
            container.publicCloudDatabase.fetch(withRecordID: self.RecordID!) {
                (record, error) in
                guard let record = record, error == nil else {
                    completionHandler(error!)
                    return
                }
                
                record["image"] = image as CKRecordValue
                record["text"] = text as CKRecordValue
                
                self.container.publicCloudDatabase.save(record) {_, error in
                    if let error = error {
                        completionHandler(error)
                    } else {
                        completionHandler(nil)}
                }
            }
        }
    }
    
}


extension Categories {
    static let cuteOption = Categories(image: "Sample", text: "Cute")
    static let comicOption = Categories(image: "Sample", text: "Comic")
    static let pokeOption = Categories(image: "Sample", text: "Poke")
    static let hotOption = Categories(image: "Sample", text: "Hot")
}


