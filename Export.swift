//
//  Export.swift
//  Block
//
//  Created by JangDoRi on 2018. 7. 30..
//  Copyright © 2018년 Piano. All rights reserved.
//

import Foundation

class Export {
    
    func data(from blocks: [Block]) -> URL? {
        var sBlocks = [SerialBlock]()
        blocks.forEach {sBlocks.append(SerialBlock(from: $0))}
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/note.blocks"
        print(path)
        sBlocks.forEach {print($0)}
        guard NSKeyedArchiver.archiveRootObject(sBlocks, toFile: path) else {return nil}
        return URL(fileURLWithPath: path)
    }
    
}
