//
//  FirebaseCollectionReference.swift
//  SweetIsland
//
//  Created by Kirill on 12.06.2020.
//  Copyright © 2020 Kirill. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
