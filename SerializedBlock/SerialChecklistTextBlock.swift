//
//  SerialChecklistTextBlock.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class SerialChecklistTextBlock: NSObject, NSCoding {
    
    private var address: Data?
    private var contact: Data?
    private var createdDate: Date?
    private var event: Data?
    private var frontWhitespaces: String?
    private var highlight: Data?
    private var isSelected: Bool!
    private var link: Data?
    private var modifiedDate: Date?
    private var tagStr: String?
    private var text: String?
    private var textStyleInteger: Int64!
    
    init(from block: ChecklistTextBlock) {
        address = block.address
        contact = block.contact
        createdDate = block.createdDate
        event = block.event
        frontWhitespaces = block.frontWhitespaces
        highlight = block.highlight
        isSelected = block.isSelected
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
        aCoder.encode(isSelected, forKey: "isSelected")
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
        isSelected = aDecoder.decodeObject(forKey: "isSelected") as! Bool
        link = aDecoder.decodeObject(forKey: "link") as? Data
        modifiedDate = aDecoder.decodeObject(forKey: "modifiedDate") as? Date
        tagStr = aDecoder.decodeObject(forKey: "tagStr") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
        textStyleInteger = aDecoder.decodeObject(forKey: "textStyleInteger") as! Int64
    }
    
    func convert(using context: NSManagedObjectContext) -> ChecklistTextBlock? {
        guard let entity = NSEntityDescription.entity(forEntityName: "ChecklistTextBlock", in: context) else {return nil}
        let checklistTextBlock = ChecklistTextBlock(entity: entity, insertInto: context)
        checklistTextBlock.address = address
        checklistTextBlock.contact = contact
        checklistTextBlock.createdDate = createdDate
        checklistTextBlock.event = event
        checklistTextBlock.frontWhitespaces = frontWhitespaces
        checklistTextBlock.highlight = highlight
        checklistTextBlock.isSelected = isSelected
        checklistTextBlock.link = link
        checklistTextBlock.modifiedDate = modifiedDate
        checklistTextBlock.tagStr = tagStr
        checklistTextBlock.text = text
        checklistTextBlock.textStyleInteger = textStyleInteger
        return checklistTextBlock
    }
    
}
