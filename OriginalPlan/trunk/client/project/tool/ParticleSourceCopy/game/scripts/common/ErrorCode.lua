--[[--
     错误码定义以及对应的提示信息
]]

local ErrorCode = {}

ErrorCode.error = {
    [4] = "您的元宝不足，囧",
    [5] = "铜币不足，快去招财或炼宝吧",
    [8] = "晶魄不足，高级摘星师可以获得晶魄",
    [12] = "抱歉啊，您的荣誉不足",
         
    [4294967293] = "系统异常",
    [-1] = "系统异常"
}

return ErrorCode