const mongoose = require("mongoose");

const stock= new mongoose.Schema({
    No:{
        type:String
    },
    Symbol:{
        type: String
    },
    Conf:{
        type:String
    },
    Open:{
        type:String
    },
    High:{
        type:String
    },
    Low:{
        type:String
    },
    Close:{
        type:String
    },
    VWAP:{
        type:String
    },
    Vol:{
        type:String
    },
    Prev_Close:{
        type:String
    },
    Turnover:{
        type:String
    },
    Trans:{
        type:String
    },
    Diff:{
        type:String
    },
    Range:{
        type:String
    },
    Diff_Perc:{
        type:String
    },
    Range_Perc:{
        type:String
    },
    VWAP_Perc:{
        type:String
    },
    OneTwenty_Days:{
        type:String
    },
    OneEighty_Days:{
        type:String
    },
    FiftyTwo_Weeks_High:{
        type:String
    },    
    FiftyTwo_Weeks_Low:{
        type:String
    }

});



module.exports=mongoose.model('Stock',stock);