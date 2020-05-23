-------------------------------------------------------
-- @class enum
-- @name EPackType
-- @description 背包类型
-- @usage 
EPackType = {
		PACK_TYPE_INVALID = 0,			----- 无效
		PACK_TYPE_BAG = 1,			----- 背包
		PACK_TYPE_EQUIP = 2,			----- 装备
		PACKET_TABLE_TYPE_NUMBER = 3,			----- 背包类型数目
};

-------------------------------------------------------
-- @class enum
-- @name EBagOperateType
-- @description 背包操作类型
-- @usage 
EBagOperateType = {
		BAG_OPERATE_TYPE_INVALID = 0,			----- 无效操作类型
		BAG_OPERATE_TYPE_DROP = 1,			----- 丢弃
		BAG_OPERATE_TYPE_USE = 2,			----- 使用
		BAG_OPERATE_TYPE_SELL = 3,			----- 出售
		BAG_OPERATE_TYPE_PACK_UP = 4,			----- 整理
		BAG_OPERATE_TYPE_REQ_ALL = 5,			----- 请求背包所有道具
};

-------------------------------------------------------
-- @class enum
-- @name ESexType
-- @description 性别
-- @usage 
ESexType = {
		INVALID_SEX_TYPE = 0,			----- 无效性别
		SEX_TYPE_MALE = 1,			----- 男
		SEX_TYPE_FEMALE = 2,			----- 女
};

-------------------------------------------------------
-- @class enum
-- @name EDir2
-- @description 方向
-- @usage 
EDir2 = {
		DIR2_INVALID = 0,			----- 无效值
		DIR2_LEFT = 1,			----- 左
		DIR2_RIGHT = 2,			----- 右
};

-------------------------------------------------------
-- @class enum
-- @name EGameRetCode
-- @description 游戏中的返回码
-- @usage 
EGameRetCode = {
		[0] = "操作成功",
		[1] = "操作失败, 请重试",
		[200] = "进入游戏失败",
		[201] = "登录失败",
		[202] = "创建角色失败, 达到角色数上限",
		[203] = "创建角色失败",
		[204] = "无法找到地图服务器",
		[205] = "无法找到角色",
		[206] = "无法删除角色, 至少需要保留一名角色",
		[207] = "角色名含有非法字符，请重新取名",
		[208] = "无法找到对应的地图",
		[209] = "已经选择角色登陆, 请等待服务器加载数据",
		[210] = "名字重复",
		[211] = "创建角色失败, 请重试",
		[212] = "删除角色失败, 请重试",
		[213] = "正在处理其他请求, 请稍候",
		[214] = "请求失败, 请重试",
		[215] = "登陆失败, 请重试",
		[216] = "角色已被封",
		[217] = "服务器正在维护",
		[218] = "账号或密码错误",
		[219] = "无法修改名字",
		[220] = "角色名已被占用，请重试",
		[221] = "账号已经被注册",
		[222] = "账号注册失败，请重试",
		[223] = "无法修改密码",
		[224] = "账号或密码错误",
		[300] = "角色已经死亡",
		[301] = "角色不在线，请尝试重新登录",
		[302] = "角色不存在，请尝试重新登录",
		[303] = "角色无法移动，请尝试重新登录",
		[304] = "目标已经死亡",
		[305] = "金币不足",
		[306] = "元宝不足，请充值",
		[400] = "操作物品失败",
		[401] = "背包的目标位置已经有物品了",
		[402] = "物品已锁定",
		[403] = "物品已锁定",
		[404] = "背包空间不足",
		[405] = "物品不存在",
		[407] = "拆分数目不正确",
		[410] = "无法装备此物品",
		[411] = "性别不符",
		[412] = "等级不足",
		[413] = "职业不符",
		[414] = "当前地图不能使用该物品",
		[415] = "该物品已过期",
		[416] = "背包空间不足",
		[417] = "背包格子数已达到最大",
		[418] = "死亡状态不能使用该物品",
		[419] = "战斗状态不能使用该物品",
		[420] = "当前状态不能使用该物品",
		[421] = "背包整理时间未到",
		[500] = "背包已满",
		[501] = "背包类型错误，请尝试重新登录",
		[502] = "背包内不存在该道具",
		[503] = "此类型的道具无法使用",
		[504] = "删除目标道具失败",
		[505] = "扣除目标道具失败",
		[506] = "出售目标道具失败",
		[507] = "背包空格已达到最大",
		[508] = "道具冷却中，请稍后重试",
		[509] = "添加道具失败，请稍后重试",
		[510] = "扩充格子失败，请稍后重试",
		[511] = "添加失败，请稍后重试",
		[512] = "元宝不足",
		[512] = "添加失败，请稍后重试",
		[600] = "等级不够",
		[601] = "道具数目不足",
		[900] = "GM失败",
		[901] = "GM命令格式不对",
		[902] = "没有输入GM关键名字",
		[903] = "没有找到该GM命令",
		[904] = "GM命令参数不对",
		[905] = "没有对应的GM权限",
		[1000] = "添加Buff失败",
		[1001] = "Buff不能共存",
		[1002] = "不存在此Buff",
		[1003] = "已经存在高等级Buffer",
		[1100] = "正在战斗中",
		[1200] = "技能无法使用",
		[1201] = "当前状态无法使用技能",
		[1202] = "职业不符合",
		[1203] = "距离不够",
		[1204] = "内力不够",
		[1205] = "无法使用该技能(策划填写错误)",
		[1206] = "目标已经死亡",
		[1207] = "目标不存在",
		[1208] = "无法使用该技能(策划填写错误)",
		[1209] = "您处于死亡状态, 无法释放技能",
		[1215] = "不能攻击该目标",
		[1216] = "无法攻击同阵营玩家",
		[1217] = "技能被阻碍, 无法释放",
		[1220] = "技能正在冷却中",
		[1221] = "无法对对方使用此技能(判断不够, 导致释放了错误的技能)",
		[1222] = "对方正在安全区内",
		[1223] = "对方处于新手保护期",
		[1224] = "新手期不同等级不能PK",
		[1225] = "和平模式不能攻击其他玩家",
		[1226] = "帮派模式不能攻击同帮派的玩家",
		[1210] = "技能已经满级",
		[1211] = "学习技能, 金钱不够",
		[1212] = "学习技能, 经验不够",
		[1213] = "学习技能, 等级不够",
		[1214] = "学习技能, 技能数达到最大",
		[1218] = "学习技能, 没有技能书",
		[1219] = "学习技能, 前置技能等级不满足",
		[1300] = "角色等级不足",
		[1301] = "发言间隔时间太短，请稍后重试",
		[1302] = "没有任何聊天内容",
		[1303] = "不可发送空格",
		[1304] = "操作失败，请重试",
		[1305] = "非法的GM命令",
		[1306] = "聊天内容不可超过100个字符",
		[1307] = "已被禁言",
		[1400] = "任务失败，请重试",
		[1401] = "不存在该任务，请重试",
		[1402] = "未达到任务领取等级",
		[1403] = "未完成当前任务，请完成后重试",
		[1404] = "背包空间不足，请清理背包后重试",
		[1405] = "已经接取过此任务，请重试",
		[1406] = "该任务已经完成",
		[1407] = "进入关卡所需道具不足",
		[1408] = "请完成任务后重试",
		[1700] = "切换地图失败",
		[1701] = "无法找到传送点，请重试",
		[1702] = "不在传送点区域内，请移动至传送点重试",
		[1703] = "等级不足",
		[1704] = "地图无效，请重试",
		[1705] = "正在向目标地图移动，请稍候",
		[1706] = "切换至目标地图失败，请重试",
		[1707] = "正在开启副本, 请稍候",
		[1708] = "正在切换地图, 请稍候",
		[1709] = "当前地图无法传送",
		[1710] = "无法找到目标地图",
		[1711] = "目标地图位置不可行走",
		[1712] = "目标地图无法找到",
		[1713] = "无法进入副本",
		[1800] = "物品操作失败",
		[1801] = "物品已经绑定",
		[1802] = "物品已经加锁",
		[1803] = "物品已经过期",
		[1804] = "该物品为任务物品",
		[1805] = "物品不存在",
		[1807] = "创建物品失败",
		[1808] = "物品操作失败(在物品配置表中没有找到该物品)",
		[1809] = "出战宠物才能使用",
		[1810] = "物品不能丢弃",
		[1811] = "物品冷却中",
		[1900] = "夺宝下注数目已满，请等待揭奖",
		[1901] = "夺宝卡不足",
		[1902] = "夺宝下注数目不对",
		[1903] = "时间未到无法领取免费金币",
		[1904] = "少于2000金币才能领取免费金币",
		[1905] = "金币不足",
		[1906] = "已经领取过奖励",
		[1907] = "您已经使用过此兑换码",
		[1908] = "非法的兑换码",
		[1909] = "未到使用时间",
		[1910] = "您已经使用过相同类型的兑换码",
		[1911] = "此兑换码已经被使用",
		[1912] = "无法领取每日签到奖励",
		[20000] = "含有非法字符",
		[40000] = "地图重复",
		[40001] = "地图无法添加",
		[40002] = "人数已经达到上限",
		[40003] = "服务器重复注册",
		[52000] = "世界服务器错误",
		[52001] = "世界服务器操作数据库出错",
		[52002] = "地图服务器无法找到",
		[52003] = "充值超时",
		[52004] = "角色不存在",
		[52005] = "正在切线",
		[52006] = "正处于请求状态",
		[52007] = "正在充值中",
		[52008] = "用户对象不存在",
		[52009] = "角色未进入游戏",
};

