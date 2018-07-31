//
//  SerialBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import Foundation

class SerialBlock: NSObject, NSCoding {
    
    private var createdDate: Date?
    private var modifiedDate: Date?
    private var order: Double!
    private var typeInteger: Int64!
    
    private var sChecklistTextBlock: SerialChecklistTextBlock?
    private var sCommentBlock: SerialComment?
    private var sDrawingBlock: SerialDrawingBlock?
    private var sFileBlock: SerialFileBlock?
    private var sImageCollectionBlock: SerialImageCollectionBlock?
    private var sOrderedTextBlock: SerialOrderedTextBlock?
    private var sPlainTextBlock: SerialPlainTextBlock?
    private var sUnOrderedTextBlock: SerialUnOrderedTextBlock?
    
    init(from block: Block) {
        createdDate = block.createdDate
        modifiedDate = block.modifiedDate
        order = block.order
        typeInteger = block.typeInteger
        
        if let checklist = block.checklistTextBlock {
            sChecklistTextBlock = SerialChecklistTextBlock(from: checklist)
        }
        if let comment = block.commentBlock {
            sCommentBlock = SerialComment(from: comment)
        }
        if let drawing = block.drawingBlock {
            sDrawingBlock = SerialDrawingBlock(from: drawing)
        }
        if let file = block.fileBlock {
            sFileBlock = SerialFileBlock(from: file)
        }
        if let imageCollection = block.imageCollectionBlock {
            sImageCollectionBlock = SerialImageCollectionBlock(from: imageCollection)
        }
        if let orderedText = block.orderedTextBlock {
            sOrderedTextBlock = SerialOrderedTextBlock(from: orderedText)
        }
        if let plain = block.plainTextBlock {
            sPlainTextBlock = SerialPlainTextBlock(from: plain)
        }
        if let unOrderedText = block.unOrderedTextBlock {
            sUnOrderedTextBlock = SerialUnOrderedTextBlock(from: unOrderedText)
        }
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(order, forKey: "order")
        aCoder.encode(typeInteger, forKey: "typeInteger")
        aCoder.encode(sPlainTextBlock, forKey: "sPlainTextBlock")
    }
    
    required init?(coder aDecoder: NSCoder) {
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        order = aDecoder.decodeObject(forKey: "order") as? Double
        typeInteger = aDecoder.decodeObject(forKey: "typeInteger") as? Int64
        sPlainTextBlock = aDecoder.decodeObject(forKey: "sPlainTextBlock") as? SerialPlainTextBlock
    }
    
    func filled(empty block: Block) -> Block? {
        guard let context = block.managedObjectContext else {return nil}
        block.createdDate = createdDate
        block.modifiedDate = modifiedDate
        block.order = order
        block.typeInteger = typeInteger
        block.checklistTextBlock = sChecklistTextBlock?.convert(using: context)
        block.commentBlock = sCommentBlock?.convert(using: context)
        block.commentBlock?.block = block
        block.drawingBlock = sDrawingBlock?.convert(using: context)
        block.fileBlock = sFileBlock?.convert(using: context)
        block.imageCollectionBlock = sImageCollectionBlock?.convert(using: context)
        block.orderedTextBlock = sOrderedTextBlock?.convert(using: context)
        block.plainTextBlock = sPlainTextBlock?.convert(using: context)
        block.unOrderedTextBlock = sUnOrderedTextBlock?.convert(using: context)
        return block
    }
    
}
