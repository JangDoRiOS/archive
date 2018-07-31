//
//  SerialOrderedTextBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialOrderedTextBlock: NSObject, NSCoding {
    
    private var address: Data?
    private var contact: Data?
    private var createdDate: Date?
    private var event: Data?
    private var frontWhitespaces: String?
    private var highlight: Data?
    private var link: Data?
    private var modifiedDate: Date?
    private var num: Int64!
    private var tagStr: String?
    private var text: String?
    private var textStyleInteger: Int64!
    
    init(from block: OrderedTextBlock) {
        address = block.address
        contact = block.contact
        createdDate = block.createdDate
        event = block.event
        frontWhitespaces = block.frontWhitespaces
        highlight = block.highlight
        link = block.link
        modifiedDate = block.modifiedDate
        num = block.num
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
        aCoder.encode(frontWhitespaces, forKey: "frontWhitespaces")
        aCoder.encode(highlight, forKey: "highlight")
        aCoder.encode(link, forKey: "link")
        aCoder.encode(modifiedDate, forKey: "modifiedDate")
        aCoder.encode(num, forKey: "num")
        aCoder.encode(tagStr, forKey: "tagStr")
        aCoder.encode(text, forKey: "text")
        aCoder.encode(textStyleInteger, forKey: "textStyleInteger")
    }
    
    required init?(coder aDecoder: NSCoder) {
        address = aDecoder.decodeObject(forKey: "address") as? Data
        contact = aDecoder.decodeObject(forKey: "contact") as? Data
        createdDate = aDecoder.decodeObject(forKey: "createdDate") as? Date
        event = aDecoder.decodeObject(forKey: "event") as? Data
        frontWhitespaces = aDecoder.decodeObject(forKey: "frontWhitespaces") as? String
        highlight = aDecoder.decodeObject(forKey: "highlight") as? Data
        link = aDecoder.decodeObject(forKey: "link") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        num = aDecoder.decodeObject(forKey: "num") as? Int64
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
        textStyleInteger = aDecoder.decodeObject(forKey: "textStyleInteger") as! Int64
    }
    
    func convert(using context: NSManagedObjectContext) -> OrderedTextBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "OrderedTextBlock", in: context) else {return nil}
        let orderedTextBlock = OrderedTextBlock(entity: entity, insertInto: context)
        orderedTextBlock.address = address
        orderedTextBlock.contact = contact
        orderedTextBlock.createdDate = createdDate
        orderedTextBlock.event = event
        orderedTextBlock.frontWhitespaces = frontWhitespaces
        orderedTextBlock.highlight = highlight
        orderedTextBlock.link = link
        orderedTextBlock.modifiedDate = modifiedDate
        orderedTextBlock.num = num
        orderedTextBlock.tagStr = tagStr
        orderedTextBlock.text = text
        orderedTextBlock.textStyleInteger = textStyleInteger
        return orderedTextBlock
    }
    
}
