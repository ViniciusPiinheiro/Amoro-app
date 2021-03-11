//
//  Message.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 05/03/21.
//

import Foundation
import UIKit
import CloudKit



class Message {
    var image: String
    var text: String
    var roomNumber:Int
    var creatorUserID: CKRecord.ID? = nil
    var recordID : CKRecord.ID? = nil
    var zoneID: CKRecordZone.ID?
    
    var container : CKContainer {
        return CKContainer(identifier: "iCloud.br.com.AmoroApp")
        
    }
    
    init(image: String, text: String, roomNumber:Int, creatorID: CKRecord.ID? = nil, recordID: CKRecord.ID? = nil) {
        self.image = image
        self.text = text
        self.roomNumber = roomNumber
        self.creatorUserID = creatorID
        self.recordID = recordID
    }
    
    func createRecord(completionHandler: @escaping (Error?) -> ()) {
        // dar o tipo primitivo
        let record = CKRecord(recordType: "Message")
        //popular os campos, e transformar os valores recebidos em CKValue
        record.setValue(self.text, forKey: "text")
        record.setValue(self.image, forKey: "image")
        record.setValue(self.roomNumber, forKey: "roomNumber")
        // salvar nossos record em nosso banco publico
        container.publicCloudDatabase.save(record) {_, error in
            if let error = error {
                completionHandler(error)
            } else {
                completionHandler(nil)
                
            }
        }
    }
    
    
    func readRecords(completionHandler: @escaping ([Message]?, Error?)-> ()) {
        // todos os registros que tem no nosso banco de dados
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Message", predicate: predicate)
        // executar a consulta
        let operation = CKQueryOperation(query: query)
        //criando array de categorias, que vamos mandar para nossa closure
        var messageRecords : [Message] = []
        //ler todos os nossos registros e de um por um vai deixando disponivel, para realizar alguma lógica,
        operation.recordFetchedBlock = {record in
            let message = Message(image: record["image"] as! String, text: record["text"] as! String, roomNumber: record["roomNumber"] as! Int, creatorID: record.creatorUserRecordID, recordID: record.recordID)
            // adicionar no nosso array
            messageRecords.append(message)
        }
        // vai ser executado assim que a nossa consulta for realizada, ela também é uma closure
        //o cursor é usado quando a gente tem uma busca mais completa
        operation.queryCompletionBlock = {(cursor, error) in
            // verifica se o erro é nulo a gente pode adicionar os nossos valores da array
            if error == nil {
                completionHandler(messageRecords, nil)
            } else {
                completionHandler(nil, error)
            }
        }
        // executar, se não der erro
        container.publicCloudDatabase.add(operation)
    }
    
    func deleteRecordWithId(completionHandler: @escaping (Error?)-> ()) {
        container.publicCloudDatabase.delete(withRecordID: self.recordID!) { (_, error) in
            if error == nil {
                completionHandler(nil)
            } else {
                completionHandler(error)
            }
        }
    }
    
    
    func updateRecordWithId(text: String, image: String, completionHandler: @escaping (Error?)-> ()){
        container.publicCloudDatabase.fetch(withRecordID: self.recordID!) {
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
    
    
//    func createZone(completion: @escaping (Error?) -> Void) {
//        let recordZone = CKRecordZone(zoneID: self.zoneID!)
//        let operation = CKModifyRecordZonesOperation(recordZonesToSave: [recordZone], recordZoneIDsToDelete: [])
//        operation.modifyRecordZonesCompletionBlock = { _, _, error in
//            guard error == nil else {
//                completion(error)
//                return
//            }
//            completion(nil)
//        }
//        operation.qualityOfService = .utility
//        let container = CKContainer.default()
//        let db = container.privateCloudDatabase
//        db.add(operation)
//    }
//Crie a assinatura do CloudKit que usaremos para receber notificações de mudanças.

//    public let subscriptionID = "iCloud.br.com.AmoroApp"
//    private let subscriptionSavedKey = "iCloud.br.com.AmoroApp"
    
    // registrar para receber push Notifications
    
    func setupCloudKitSubscription(completionHandler: @escaping (Error?)-> ()) {
      
        
        
        let subscription = CKQuerySubscription(recordType: "Message", predicate: NSPredicate(value: true), options: [.firesOnRecordCreation, .firesOnRecordUpdate, .firesOnRecordDeletion])
        let notificationInfo = CKSubscription.NotificationInfo()
        notificationInfo.shouldSendContentAvailable = true
        notificationInfo.alertLocalizationArgs = ["image"]
        notificationInfo.alertLocalizationArgs = ["text"]
        notificationInfo.alertActionLocalizationKey = "seu_amor_mandou_uma_mensagem"
        notificationInfo.shouldBadge = true
        
        subscription.notificationInfo = notificationInfo
        
        container.publicCloudDatabase.save(subscription) {savedSubscription, error in
            if let error = error {
                completionHandler(error)
            } else {
                UserDefaults.standard.set(savedSubscription!.subscriptionID, forKey: "subscriptionID")
                completionHandler(nil)
            }
        }
    }
}


