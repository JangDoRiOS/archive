//
//  SerialUnOrderedTextBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialUnOrderedTextBlock: NSObject {
    
    private var address: Data?
    private var contact: Data?
    private var createdDate: Date?
    private var event: Data?
    private var frontWhitespaces: String?
    private var highlight: Data?
    private var key: String?
    private var link: Data?
    private var modifiedDate: Date?
    private var tagStr: String?
    private var text: String?
    private var textStyleInteger: Int64!
    
    init(from block: UnOrderedTextBlock) {
        address = block.address
        contact = block.contact
        createdDate = block.createdDate
        event = block.event
        frontWhitespaces = block.frontWhitespaces
        highlight = block.highlight
        key = block.key
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
        aCoder.encode(frontWhitespaces, forKey: "frontWhitespaces")
        aCoder.encode(highlight, forKey: "highlight")
        aCoder.encode(key, forKey: "key")
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
        frontWhitespaces = aDecoder.decodeObject(forKey: "frontWhitespaces") as? String
        highlight = aDecoder.decodeObject(forKey: "highlight") as? Data
        key = aDecoder.decodeObject(forKey: "key") as? String
        link = aDecoder.decodeObject(forKey: "link") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
        textStyleInteger = aDecoder.decodeObject(forKey: "textStyleInteger") as! Int64
    }
    
    func convert(using context: NSManagedObjectContext) -> UnOrderedTextBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "UnOrderedTextBlock", in: context) else {return nil}
        let unOrderedTextBlock = UnOrderedTextBlock(entity: entity, insertInto: context)
        unOrderedTextBlock.address = address
        unOrderedTextBlock.contact = contact
        unOrderedTextBlock.createdDate = createdDate
        unOrderedTextBlock.event = event
        unOrderedTextBlock.frontWhitespaces = frontWhitespaces
        unOrderedTextBlock.highlight = highlight
        unOrderedTextBlock.key = key
        unOrderedTextBlock.link = link
        unOrderedTextBlock.modifiedDate = modifiedDate
        unOrderedTextBlock.tagStr = tagStr
        unOrderedTextBlock.text = text
        unOrderedTextBlock.textStyleInteger = textStyleInteger
        return unOrderedTextBlock
    }
    
}
