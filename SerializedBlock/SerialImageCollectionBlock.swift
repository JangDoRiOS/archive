//
//  SerialImageCollectionBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialImageCollectionBlock: NSObject {
    
    private var createdDate: Date?
    private var id: String?
    private var modifiedDate: Date?
    private var tagStr: String?
    private var imageIDCollection: NSOrderedSet?
    
    init(from block: ImageCollectionBlock) {
        createdDate = block.createdDate
        id = block.id
        modifiedDate = block.modifiedDate
        tagStr = block.tagStr
        imageIDCollection = block.imageIDCollection
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(tagStr, forKey: "tagStr")
        aCoder.encode(imageIDCollection, forKey: "imageIDCollection")
    }
    
    required init?(coder aDecoder: NSCoder) {
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        id = aDecoder.decodeObject(forKey: "id") as? String
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
        imageIDCollection = aDecoder.decodeObject(forKey: "imageIDCollection") as? NSOrderedSet
    }
    
    func convert(using context: NSManagedObjectContext) -> ImageCollectionBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "ImageCollectionBlock", in: context) else {return nil}
        let imageCollectionBlock = ImageCollectionBlock(entity: entity, insertInto: context)
        imageCollectionBlock.createdDate = createdDate
        imageCollectionBlock.id = id
        imageCollectionBlock.modifiedDate = modifiedDate
        imageCollectionBlock.tagStr = tagStr
        imageCollectionBlock.imageIDCollection = imageIDCollection
        return imageCollectionBlock
    }
    
}
