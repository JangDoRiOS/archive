//
//  Import.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 31..
//  Copyright © 2018년 Piano. All rights reserved.
//

import CoreData

class Import {
    
    func block(from file: String, using context: NSManagedObjectContext) -> [Block?] {
        var blocks = [Block?]()
        print(file)
        guard let sBlocks = NSKeyedUnarchiver.unarchiveObject(withFile: file) as? [SerialBlock] else {return blocks}
        guard let entity = NSEntityDescription.entity(forEntityName: "Block", in: context) else {return blocks}
        sBlocks.forEach {blocks.append($0.filled(empty: Block(entity: entity, insertInto: context))!)}
        sBlocks.forEach {print($0)}
        try? context.save()
        return blocks
    }
    
}
/*
 /var/mobile/Containers/Data/Application/DDB9FE5C-32A3-4E5B-968A-7F5010F21AA6/Documents/note.blocks
 /private/var/mobile/Containers/Data/Application/DDB9FE5C-32A3-4E5B-968A-7F5010F21AA6/Documents/Inbox/block2-3.blocks
 */
