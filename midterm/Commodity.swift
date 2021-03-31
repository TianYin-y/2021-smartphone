

import Foundation

class Commodity{
    var state : String = ""
    var total : Int = 0
    var positive : Int = 0
    
    
    init(state: String, total: Int, positive: Int) {
        self.state = state
        self.total = total
        self.positive = positive
    }
}

