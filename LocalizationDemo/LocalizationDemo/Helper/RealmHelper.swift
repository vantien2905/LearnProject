//
//  RealmHelper.swift
//  LocalizationDemo
//
//  Created by DINH VAN TIEN on 1/27/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static let shared = RealmHelper()
    private init() {}
    
    var realm: Realm? {
        return try? Realm()
    }
    
    // MARK: CRUD functions
    func dbCreateObject(_ object: Object) {
        do {
            try realm?.write {
                self.realm?.add(object)
            }
        } catch {
            print("Error saving")
        }
    }
    
    func dbDeleteAll() {
        try! realm?.write {
            realm?.deleteAll()
        }
    }
    
    func dbUpdateObject(_ updateBlock: (() -> Void)) {
        try! realm?.write {
            updateBlock()
        }
    }
    
    func dbUpdateWithRealm(_ updateBlock: @escaping ((_ realm: Realm) -> Void)) {
        //        try! realm?.write {
        //            updateBlock(self.realm)
        //        }
    }
    
    func dbDeleteObject(_ object: Object) {
        try! realm?.write {
            self.realm?.delete(object)
        }
    }
    
    func dbDeleteObjects<T: Object>(_ objects: Array<T>) {
        try! realm?.write {
            self.realm?.delete(objects)
        }
    }
    
    func dbAddObject(_ object: Object, update: Bool = false) {
        do {
            try self.realm?.write { [weak self] in
                self?.realm?.add(object, update: true)
            }
        } catch let error {
            print("[ERROR] Got: \(error.localizedDescription)")
        }
        
    }
    
    func dbAddObjects(_ objects: [Object], update: Bool = false) {
        //        do {
        //            try self.realm?.write { [weak self] in
        //                self?.realm?.add(objects, update: true)
        //            }
        //        } catch let error {
        //            print("[ERROR] Got: \(error.localizedDescription)")
        //        }
        try! realm?.write {
            self.realm?.add(objects, update: true)
        }
    }
    
    func dbObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm!.objects(type)
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
