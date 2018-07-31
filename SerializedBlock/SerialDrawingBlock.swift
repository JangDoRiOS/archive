//
//  SerialDrawingBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialDrawingBlock: NSObject {
    
    private var createdDate: Date?
    private var imageData: Data?
    private var modifiedDate: Date?
    private var tagStr: String?
    
    init(from block: DrawingBlock) {
        createdDate = block.createdDate
        imageData = block.imageData
        modifiedDate = block.modifiedDate
        tagStr = block.tagStr
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(imageData, forKey: "imageData")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(tagStr, forKey: "tagStr")
    }
    
    required init?(coder aDecoder: NSCoder) {
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        imageData = aDecoder.decodeObject(forKey: "imageData") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
    }
    
    func convert(using context: NSManagedObjectContext) -> DrawingBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "DrawingBlock", in: context) else {return nil}
        let drawingBlock = DrawingBlock(entity: entity, insertInto: context)
        drawingBlock.createdDate = createdDate
        drawingBlock.imageData = imageData
        drawingBlock.modifiedDate = modifiedDate
        drawingBlock.tagStr = tagStr
        return drawingBlock
    }
    
}
