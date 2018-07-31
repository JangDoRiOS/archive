//
//  SerialFileBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialFileBlock: NSObject {
    
    private var createdDate: Date?
    private var data: Data?
    private var modifiedDate: Date?
    private var tagStr: String?
    
    init(from block: FileBlock) {
        createdDate = block.createdDate
        data = block.data
        modifiedDate = block.modifiedDate
        tagStr = block.tagStr
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(data, forKey: "data")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(tagStr, forKey: "tagStr")
    }
    
    required init?(coder aDecoder: NSCoder) {
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        data = aDecoder.decodeObject(forKey: "data") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
    }
    
    func convert(using context: NSManagedObjectContext) -> FileBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "FileBlock", in: context) else {return nil}
        let fileBlock = FileBlock(entity: entity, insertInto: context)
        fileBlock.createdDate = createdDate
        fileBlock.data = data
        fileBlock.modifiedDate = modifiedDate
        fileBlock.tagStr = tagStr
        return fileBlock
    }
    
}
