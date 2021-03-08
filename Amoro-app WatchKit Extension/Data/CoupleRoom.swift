//
//  CoupleRoom.swift
//  CloudKitTest
//
//  Created by Vinícius Pinheiro on 06/03/21.
//

import Foundation
import CloudKit

class CoupleRoom {
    var roomNumber: Int
    var recordID: CKRecord.ID? = nil
    var creatorUserID: CKRecord.ID? = nil
    var container: CKContainer {
        return CKContainer(identifier: "iCloud.Default_Container_For_My_App_2020_11")
    }
    
    init(roomNumber: Int, creatorID: CKRecord.ID? = nil, recordID: CKRecord.ID? = nil) {
        self.roomNumber = roomNumber
        self.creatorUserID = creatorID
        self.recordID = recordID
    }
    
    func createRecord(completionHandler: @escaping (Error?) -> ()) {
        // dar o tipo primitivo
        let record = CKRecord(recordType: "CoupleRoom")
        //popular os campos, e transformar os valores recebidos em CKValue
//        record["text"] = self.text as CKRecordValue
//        record["image"] = self.image as CKRecordValue
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
    
    func readRecords(completionHandler: @escaping ([CoupleRoom]?, Error?)-> ()) {
        // todos os registros que tem no nosso banco de dados
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "CoupleRoom", predicate: predicate)
        // executar a consulta
        let operation = CKQueryOperation(query: query)
        //criando array de categorias, que vamos mandar para nossa closure
        var coupleRoomRecord : [CoupleRoom] = []
        //ler todos os nossos registros e de um por um vai deixando disponivel, para realizar alguma lógica,
        operation.recordFetchedBlock = {record in
            let coupleRoom = CoupleRoom(roomNumber: record["roomNumber"] as! Int, creatorID: record.creatorUserRecordID, recordID: record.recordID )
            // adicionar no nosso array
            coupleRoomRecord.append(coupleRoom)
        }
        // vai ser executado assim que a nossa consulta for realizada, ela também é uma closure
        //o cursor é usado quando a gente tem uma busca mais completa
        operation.queryCompletionBlock = {(cursor, error) in
            // verifica se o erro é nulo a gente pode adicionar os nossos valores da array
            if error == nil {
                completionHandler(coupleRoomRecord, nil)
            } else {
                completionHandler(nil, error)
            }
        }
        // executar, se não der erro
        container.publicCloudDatabase.add(operation)
    }
    

}
