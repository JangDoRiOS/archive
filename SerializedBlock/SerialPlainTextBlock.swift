//
//  SerialPlainTextBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialPlainTextBlock: NSObject, NSCoding {
    
    private var address: Data?
    private var contact: Data?
    private var createdDate: Date?
    private var event: Data?
    private var highlight: Data?
    private var link: Data?
    private var modifiedDate: Date?
    private var tagStr: String?
    private var text: String?
    private var textStyleInteger: Int64!
    
    init(from block: PlainTextBlock) {
        address = block.address
        contact = block.contact
        createdDate = block.createdDate
        event = block.event
        highlight = block.highlight
        link = block.link
        modifiedDate = block.modifiedDate
        tagStr = block.tagStr
        text = block.text
        textStyleInteger = block.textStyleInteger
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(address, forKey: "address")
        aCoder.encode(contact, forKey: "contact")
        aCoder.encode(createdDate, forKey: "createdDate")
        aCoder.encode(event, forKey: "event")
        aCoder.encode(highlight, forKey: "highlight")
        aCoder.encode(link, forKey: "link")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(tagStr, forKey: "tagStr")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(textStyleInteger, forKey: "textStyleInteger")
    }
    
    required init?(coder aDecoder: NSCoder) {
        address = aDecoder.decodeObject(forKey: "address") as? Data
        contact = aDecoder.decodeObject(forKey: "contact") as? Data
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        event = aDecoder.decodeObject(forKey: "event") as? Data
        highlight = aDecoder.decodeObject(forKey: "highlight") as? Data
        link = aDecoder.decodeObject(forKey: "link") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
        textStyleInteger = aDecoder.decodeObject(forKey: "textStyleInteger") as? Int64
    }
    
    func convert(using context: NSManagedObjectContext) -> PlainTextBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "PlainTextBlock", in: context) else {return nil}
        let plainTextBlock = PlainTextBlock(entity: entity, insertInto: context)
        plainTextBlock.address = address
        plainTextBlock.contact = contact
        plainTextBlock.createdDate = createdDate
        plainTextBlock.event = event
        plainTextBlock.highlight = highlight
        plainTextBlock.link = link
        plainTextBlock.modifiedDate = modifiedDate
        plainTextBlock.tagStr = tagStr
        plainTextBlock.text = text
        plainTextBlock.textStyleInteger = textStyleInteger
        return plainTextBlock
    }
    
}
