import Foundation

// CREATE BLOCK CLASS
class Block {
    
    var hash = String()
    var prevHash = String()
    var data = String()
    var index = Int()
    
    func creatHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

// CREATE CHAIN CLASS
class BlockChain {

    var chain = [Block]()

    func createGenesisBlock(data:String) {
        let gBlock = Block()
        gBlock.hash = gBlock.creatHash()
        gBlock.prevHash = "nil - first block"
        gBlock.index = 0
        gBlock.data = data
        
        chain.append(gBlock)
    }
    
    func addBlock(data:String) {
        let newBlock = Block()
        newBlock.hash = newBlock.creatHash()
        newBlock.data = data
        newBlock.index = chain.count
        newBlock.prevHash = chain[chain.count - 1].hash
        chain.append(newBlock)
    }
}

//
var myBlock = BlockChain()
myBlock.createGenesisBlock(data: "From:A; To:B; $15")
print(myBlock.chain[0].data)