//
//  SerialComment.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialComment: NSObject, NSCoding {
    
    private var content: String?
    private var createdDate: Date?
    private var id: String?
    private var modifiedDate: Date?
    
    init(from block: Comment) {
        content = block.content
        createdDate = block.createdDate
        id = block.id
        modifiedDate = block.modifiedDate
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(content, forKey: "content")
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        content = aDecoder.decodeObject(forKey: "content") as? String
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        id = aDecoder.decodeObject(forKey: "id") as? String
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
    }
    
    func convert(using context: NSManagedObjectContext) -> Comment? {
        guard let entity = NSEntityDescription.entity(forEntityName: "Comment", in: context) else {return nil}
        let comment = Comment(entity: entity, insertInto: context)
        comment.content = content
        comment.createdDate = createdDate
        comment.id = id
        comment.modifiedDate = modifiedDate
        return comment
    }
    
}
