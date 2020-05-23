--
--
local pairs = pairs
local ipairs = ipairs
local table = table
local FightEngine = FightEngine
local MagicCache = game_require("view.fight.magic.MagicCache")
local MagicAutoTrigger = game_require("view.fight.common.MagicAutoTrigger")
local TargetSearchDelegate = game_require("view.fight.common.TargetSearchDelegate")
local Magic = class("Magic",function()
							return display.newNode()
						end)

local TEST_MAGIC = -1
function Magic:ctor()
	self.totalTime = 0
	self.isHide = false
	self:retain()
end

function Magic:setGlobalID(gId)
	self.gId = gId
end

function Magic:init(magicId,creature,target)
	if TEST_MAGIC == magicId then
		print("magic____create___",TEST_MAGIC)
	end
	local info = FightCfg:getMagic(magicId)
	self.info = info
	self.magicId = magicId

	if self.info.range then
		self.atkRange = Range.new(self.info.range)
	end
--	info.res = "effect/dropBomb"
	if info.res then
		FightCache:retainAnima(info.res)  --缓存资源
		self.magicEf = Effect:createWithResName(info.res)
		self.magicEf:retain()
		if FightDirector:isShowMagic() then --不显示特效
			self:addChild(self.magicEf)
		end

		local animaInfo = AnimationMgr:getAnimaInfo(info.res)
		self.actionName = animaInfo:getActionName(0)
		local aInfo = animaInfo:getActionInfo(self.actionName)
		local index = string.find(self.actionName,"_")
		if index then
			self.actionName = string.sub(self.actionName,1,index-1)
		end

		if info.fTime then
			self.fTime = info.fTime
		elseif aInfo.frequency  and aInfo.frequency > 0  then
			self.fTime = math.floor(1000/aInfo.frequency)
		else
			self.fTime = FightCommon.animationDefaultTime
		end

		local totalFrame = aInfo:getFrameLength()  --总共多少帧
		self.effectReversal = aInfo.hasReversal

		self.animationTime = totalFrame * self.fTime  -- 乘以每帧时间   可配置

		if info.totalFrame then
			self.totalTime = info.totalFrame * self.fTime --持续时间
		else
			self.totalTime = self.animationTime
		end
		-- print("动画 方向。。。",self.hasReversal,info.res)
	end

	local r1,r2
	if info.pId then
		r1,r2 = self:hasReverse()
		self.hasReversal = r1
	end

	local d = self:_getDirection(creature,target)
	self:initDirection(d)
	--info.pId = nil
	if info.pId then
		-- info.pId = 6
		local pId = info.pId[1]
		local pId2 = info.pId[2]

		if r1 then
			pId = self:getDirectionPId(pId)
		end

		if r2 then
			pId2 = self:getDirectionPId(pId2)
		end

		-- print("特效 id。。。。",pId)
		if pId >0 then
			self.particle = ParticleMgr:CreateParticleSystem(pId,true)
		end
		if TEST_MAGIC == magicId then
			print("magic____create___particle:",TEST_MAGIC,self.particle,pId)
		end
		if self.particle then
		 	self.particle:SetMansualUpdate(true)
		 	self.particle:retain()
		 	if FightDirector:isShowMagic() then
				self:addChild(self.particle)
				local scale = (self.info.scale or 10000)/10000
				self.particle:SetParticleSystemScale(scale,scale,scale)
				--self:setScale(scale)
		 	end

		 	if not info.res then
		 		self.fTime = info.fTime or FightCommon.animationDefaultTime

		 		self.particleSpeed = FightCommon.animationDefaultTime/self.fTime

		 		if info.totalFrame then
					self.totalTime = info.totalFrame * self.fTime --持续时间
		 		else
		 			self.totalTime = self.particle:GetCycleTotalTime()*1000 /self.particleSpeed
		 		end
		 		self.animationTime = self.totalTime
		 	end
		end
	end

	if (not self.particle) and (not self.magicEf) then
		self.fTime = info.fTime or FightCommon.animationDefaultTime
		self.totalTime = self.fTime * (info.totalFrame or 0)
		self.animationTime = self.totalTime
	end
	if creature then
		self._targetSearchDelegate = TargetSearchDelegate.new(creature.cInfo.career,creature.cInfo.team,creature.cInfo.atkScope)
	end
end


function Magic:_getDirection(creature,target)
	local posType = self.info.parent
	local parent

	if posType == 1 or posType == 3 then
		parent = creature
	elseif posType == 2 or posType == 4 then
		parent = target
	end
	if parent and (self.hasReversal or  self.effectReversal) then
		if self.info.direction == 1 then
			return parent:getAtkDirection()
		else
			return parent:getDirection()
		end
	end
	return Creature.RIGHT
end

function Magic:initDirection( direction )
	self.direction = direction
	if self.hasReversal then
		local s = self:getMagicScaleX()
		self:setScaleX(s)
	elseif self.effectReversal then
		local s = self:getMagicScaleX()
		self.magicEf:setScaleX(s)
	end
end

function Magic:setParams(creature,target,skillInfo,skillParams,skillGid,hookObj,isHide )
	-- print("播放 magic。。。",magicId)
	self.skillGid = skillGid or self.gId
	self.creature = creature
	self.hookObj = hookObj
	if self.creature then
		self.creature:retain()
	end
	self.target = target
	if target and target.retain then
		self.target:retain()
	end

	self.level = skillParams.level or 1
	self.skillParams = skillParams
	self.skillInfo = skillInfo
	if skillInfo then
		self.skillId = skillInfo.id
	end

	local d = self:_getDirection(creature,target)
	-- if d ~= self.direction then
	-- 	print("fuck。，，。。， no   相等",self.magicId)
	-- end
	self.isHide = isHide
	self:setDirection(d)
	self:initPos(self.info.parent)
end

function Magic:hasReverse()
	if not self.info.pId then
		return false,false
	else
		local pId = self.info.pId[1]
		local pId2 = self.info.pId[2]
		local reverse1 = false
		if pId < 10000 and (pId%10)~=0 then
			reverse1 = ParticleMgr:hasParticle( math.floor(pId/10)*10+2 )
		end
		local reverse2 = false
		if pId2 and pId2 < 10000 and (pId2%10)~=0 then
			reverse2 = ParticleMgr:hasParticle( math.floor(pId2/10)*10+2 )
		end
		return reverse1,reverse2
	end
end

function Magic:getDirectionPId(p1,d)
	return math.floor(p1/10)*10 + (d or self.direction)%10
end

function Magic:start()
	-- self._startTime = FightEngine:getCurTime()

	self.curTime = 0
	self._lastTime = 0
	self.curFrame = -1
	if self.particle and FightDirector:isShowMagic() then
		self.particle:MansualUpdate(0.0001)
	end
end

--初始化位置
function Magic:initPos(posType)
	--添加在不同的地方    需要定位的话  可以在magic 配置添加  x ，y  定位
	print("self.magicId-----",self.magicId)
	self.magicParent = posType
	local x,y = 0,0
	self.addIndex = self:getAddIndex()
	local offsetX,offsetY = self:getOffset()
	if posType == 1 then  --初始位置在触发方身上
		self:setPosition(offsetX,offsetY)
		self.hookObj:addMagic(self,self.addIndex)
	elseif posType == 2 then   --初始位置在目标身上
		assert(self.target ~= nil,"magic parent = 2 --配置有问题  找不到目标。id ："..self.magicId)
		self:setPosition(offsetX,offsetY)
		self.target:addMagic(self,self.addIndex)
		self.hookObj = self.target
	elseif posType == 3 then  --添加到 触发者 场景位置
		--x,y = self.hookObj:getTruePosition()
		if self.hookObj.getTruePosition then
			x,y = self.hookObj:getTruePosition()
		else
			x,y = self.hookObj.x,self.hookObj.y
		end
		local mx,my = FightDirector:getMap():toMapPos(x,y)
		self.hookObj = {mx = mx,my = my}
		x,y = x+offsetX,y+offsetY
		self:setPosition(x,y)
		FightDirector:getScene():addElem(self,self.addIndex)

	elseif posType == 4 then--添加到 目标 场景位置
		assert(self.target ~= nil,"magic parent = 4  --配置有问题  找不到目标。id ："..self.magicId)
		x,y = self.target:getTruePosition()
		x,y = x+offsetX,y+offsetY
		self:setPosition(x,y)
		local mx,my = FightDirector:getMap():toMapPos(x,y)
		self.hookObj = {mx = mx,my = my}
		FightDirector:getScene():addElem(self,self.addIndex)
	elseif posType == 5 then  --直接添加到场景指定位置
		if self.skillParams and self.skillParams.x then
			x,y = self.skillParams.x,self.skillParams.y
		else
			x,y = self.info.sceneX,self.info.sceneY
		end
		x,y = x+offsetX,y+offsetY
		self:setPosition(x,y)
		local mx,my = FightDirector:getMap():toMapPos(x,y)
		self.hookObj = {mx = mx,my = my}
		FightDirector:getScene():addElem(self,self.addIndex)
	end
	local curx,cury = self:getCurPos()
	self.startPos = {x = curx,y = cury}
end

function Magic:setDirection( direction )
	if self.direction ~= direction then
		 local offsetX,offsetY = self:getOffset()
		 self:setPosition(offsetX,offsetY)
		if self.hasReversal then
			self.direction = direction
			if self.particle then
				local pId = self.info.pId[1]
				pId = self:getDirectionPId(pId,direction)
				if not ParticleMgr:hasParticle(pId) then
					return
				end
			end
			if self.particle and FightDirector:isShowMagic() then
				local pId = self.info.pId[1]
				pId = self:getDirectionPId(pId)
				if pId ~= self.particle.id then
					self:_resetToCache(self.particle)
					self.particle = self:_getCacheParticle(pId)
					self:addChild(self.particle)
					self.particle:MansualUpdate(0.0001)
				end
			end
			local s = self:getMagicScaleX()
			self:setScaleX(s)

			local parent = self:getCreatureParent()
			if parent then
				self.addIndex = self:getAddIndex()
				parent:reAddMagic(self,self.addIndex)
			end

		elseif self.effectReversal then
			self.direction = direction
			local s = self:getMagicScaleX()
			self.magicEf:setScaleX(s)
		end
	end
end

function Magic:_resetToCache(p)
	p:removeFromParent()
	if not self._cacheMap then
		self._cacheMap = {}
	end
	self._cacheMap[p.id] = p
	-- print("存放。。。",p.id)
end

function Magic:_getCacheParticle(pId)
	local p = self._cacheMap[pId]
	if not p then
		p = ParticleMgr:CreateParticleSystem(pId,true)
		if p then
			p:SetMansualUpdate(true)
		 	p:retain()
		end
	else
		-- print("获取到了。。。。",pId)
		self._cacheMap[pId] = nil
	end
	return p
end

function Magic:getMagicScaleX()
	return Formula:getDirectionScaleX(self.direction)
end

function  Magic:getOffset()
	local x,y,dir = 0,0,self.direction
	if self.magicParent == 1 or self.magicParent == 3 then
		if self.hookObj and self.hookObj.getAtkDirection then
			dir = self.hookObj:getAtkDirection()
		end
	elseif self.magicParent == 2 or self.magicParent == 4 then
		dir = self.target:getAtkDirection()
	end
	if self.info.x or self.info.y then
	 	x,y = self.info.x or 0, self.info.y or 0
	elseif self.info.dirX and self.info.dirY then
		local d = dir%10
		x,y = self.info.dirX[d],self.info.dirY[d]
	end
	if not self.skillParams._noScaleOffsetX then
		x = x*Formula:getDirectionScaleX(dir)
	end

	return  x,y
end

function Magic:getAddIndex()
	if self.info.dirAddIndex then
		local d = self.direction%10
		return self.info.dirAddIndex[d] or 0
	else
		return self.info.addIndex or 0
	end
end

--全场冻结 只有这个在跑的时候
function Magic:runCongeal( dt )
	self.congealTime = self.congealTime - dt
	if self.congealTime <= 0 then
		FightEngine:removeCongeal(self)
	end
	self:run(dt)
end

function Magic:run(dt)
	self._isRunning = true
	self._lastTime = self.curTime
	self.curTime = self.curTime + dt
	self:_checkKeyFrame(dt) --检测关键帧处理
	self._isRunning = false
	if self._lastTime >= self.totalTime then   --循环次数 够了   结束技能
		self:_magicEnd()  --结束了
		return false
	end

	self:_showCurFrame(dt)
	return true
end

--检测关键帧处理
function Magic:_checkKeyFrame( dt )
	local keyframeList = self.info["keyframe"]
	local frameTypeList = self.info["keyType"]
	local frameMagicList = self.info["keyMagic"]
	if keyframeList then
		local nextTime = self._lastTime + dt
		for i,frame in ipairs(keyframeList) do   --处理关键帧 的 触发东西
			local time = self.fTime * frame
			if time >= self._lastTime and time < nextTime then
				if self:checkKeyFrameSuccess(i) then
					local frameType = frameTypeList[i]
					if frameType == Skill.MAGIC_KEY_FRAME then
						self:_keyFrameHanlder(i,nil,true) --播放一个魔法特效
					elseif frameType == Skill.ATTACK_KEY_FRAME  then  --检测攻击到的  --and self.skillInfo
						self:_checkHitTarget(i)
					end
				end
			end
		end
	end
end

function Magic:_checkShow()
	if self.isHide or not FightDirector:isShowMagic() then
		return false
	end

	local x,y = FightDirector:getScene():getPosition()
	local magicX,magicY = self:getCurPos()

	magicX = magicX + x
	if magicX < -10 or magicX > display.width + 10 then
		return false
	else
		magicY = magicY + y
		if magicY < -50 or magicY > display.height+10  then
			return false
		end
		return true
	end
end

function Magic:_showCurFrame(dt)
	if not self:_checkShow() then
		self:setVisible(false)
		return
	else
		self:setVisible(true)
	end

	if self.magicEf then
		local newFrame
		local time = self._lastTime%self.animationTime
		newFrame = math.floor(time/self.fTime)
		if newFrame ~= self.curFrame then
			self.curFrame = newFrame
			local action = nil
			if self.effectReversal then
				action = self.actionName.."_"..self.direction%10
			else
				action = self.actionName
			end
			-- print("显示。。。。",self.actionName,self.curFrame,action,self.direction,self.effectReversal)
			self.magicEf:showAnimateFrame(self.curFrame,action) --
		end
	end

	if self.particle then
		dt = dt/1000
		if self.particleSpeed then
			dt = self.particleSpeed*dt
		end
		self.particle:MansualUpdate(dt)
	end
end

function Magic:_checkHitTarget(frameIndex)
	hitTargetList = self:getHitTarget()
	--if TEST_MAGIC == self.magicId then
		print("magic______checkHitTarget__targets000:",#hitTargetList)
	--end
	if hitTargetList then
		local selfEffect = true
		for i,hitTarget in ipairs(hitTargetList) do
			if not hitTarget:canBeHit(self.skillInfo) then  --目标不可以被打到
				hitTarget:beHurt(nil)
			else
				local status,value
				if self.skillInfo then
					status,value = HurtHandler:skillHurt(self.creature,self.skillInfo,hitTarget,self.skillParams)
				else
					status,value = FightCommon.hit,0
				end
				if TEST_MAGIC == self.magicId then
					print("magic______checkHitTarget__targets11111:",value)
				end
				if status ~= FightCommon.dodge then --没被闪避
					self:_keyFrameHanlder(frameIndex,hitTarget,selfEffect)
					selfEffect = false
					-- Formula:playHitAudio(self.skillInfo,hitTarget)  --击中音效
				else
					hitTarget:beHurt(nil)
				end
			end
		end
	end
end

function Magic:_getMagicTargets(postype)
	local info = self.info
	local beginList = {}
	local magicTargetList = self:getHitTarget()
	if TEST_MAGIC == self.magicId then
		print("magic_____getMagicTargets__targets:999999",#magicTargetList)
	end
	if postype == 0 then
		beginList = { self.hookObj }
	elseif postype == 1 then
		beginList = {self.startPos}
	elseif postype == 2 then
		local x1 ,y1 =self:getCurPos()
		beginList = {{x = x1,y = y1}}
	elseif postype == 3 then
			beginList = clone(magicTargetList)
	elseif postype == 4 then
		for k,v in pairs(magicTargetList) do
			local curX,curY = FightDirector:getMap():toScenePos(v.mx,v.my)
			table.insert(beginList,{x = curX,y = curY})
		end
	end
	return beginList
end

function Magic:_createMagic(magicId,hookObj,target_list)
	local magicCfg = FightCfg:getMagic(magicId)
	local x,y = self:getPosition()
	if self.skillParams then
		self.skillParams.x,self.skillParams.y = x,y
	end
	local cfgInfo = FightCfg:getMagic(magicId)
	local magic = FightEngine:createMagic(self.creature,magicId,self.target,self.skillInfo,self.skillParams,self.skillGid,hookObj) --播放一个魔法特效
	if magic and cfgInfo.parent == 2 and self.target.posLength > 1 then
		local x,y = magic:getPosition()
		x = x + math.random(-FightMap.HALF_TILE_W*(self.target.posLength*0.5),FightMap.HALF_TILE_W*(self.target.posLength*0.5))
		y = y + math.random(-FightMap.HALF_TILE_H*(self.target.posLength*0.5),FightMap.HALF_TILE_H*(self.target.posLength*0.5))
		magic:setPosition(x,y)
	end
	return magic
end

function Magic:_keyFrameHanlder(index,target,selfEffect)
	local frameMagicList = self.info["keyMagic"]
	local sourceBuffList = self.info["sourceBuff"]
	local targetBuffList = self.info["targetBuff"]
	local sBuffTimeList = self.info["sBuffTime"]
	local tBuffTimeList = self.info["tBuffTime"]
	local stuntList = self.info["stunt"]
	local musicList = self.info["skillMusic"]
	local magicPos = self.info["magicPos"]
	if frameMagicList and frameMagicList[index] and frameMagicList[index] > 0 then
		local list_target = self:_getMagicTargets(magicPos[index])
		if TEST_MAGIC == self.magicId then
			print("magic_____getMagicTargets__targets000:",#list_target)
		end
		if target then
			list_target = {target}
		end
		if TEST_MAGIC == self.magicId then
			print("magic_____getMagicTargets__targets:",#list_target)
		end
		for k,v in pairs(list_target) do
			self:_createMagic(frameMagicList[index],v)
		end
	end

	if self.creature and selfEffect and  sourceBuffList and sourceBuffList[index] and sourceBuffList[index] > 0 then
		local buff = FightEngine:createBuff(self.creature,sourceBuffList[index],sBuffTimeList[index],self.creature,self.skillInfo,self.skillParams,self.target)
	end

	if targetBuffList and targetBuffList[index] and targetBuffList[index] > 0 then
		if not self.skillInfo or target:canBeHit(self.skillInfo) then
			FightEngine:createBuff(target,targetBuffList[index],tBuffTimeList[index],self.creature,self.skillInfo,self.skillParams)
		end
	end

	if stuntList and stuntList[index] and stuntList[index] > 0 then
		local stuntInfo = FightCfg:getStunt(stuntList[index])
		if (stuntInfo.sType > 100 or selfEffect ) and self.creature then
			local time = self.info["stuntTime"] and self.info["stuntTime"][index]
			local stunt = FightEngine:createStunt(self.creature,stuntList[index],target,time)
		end
	end

	--声音
	if musicList and musicList[index] and musicList[index] ~= 0 then
		local x,y = self:getCurPos()
		x,y = Formula:sceneToGlobalPos(x,y)
		if x < 0 or x > display.width or y < 0 or y > display.height then
			--outside display
		else
			FightAudio:playEffect(musicList[index])
		end
	end
end


--技能效果触发概率判定
function Magic:checkKeyFrameSuccess( frameIndex )
	local probList = self.info["prob"]
	if probList and probList[frameIndex] then
		if probList[frameIndex] == 0 or probList[frameIndex] >= 10000 then
			return true
		end
		local r = math.random(1,10000)
		-- print("概率。。。。",r,probList[frameIndex])
		if r <= probList[frameIndex] then
			return true
		else
			return false
		end
	end
	return true
end

function Magic:getHitTarget()
	local targetList = self._targetSearchDelegate:getHitTargetEx(self.info,self.creature,self.target,self.hookObj)
	return targetList
end

function Magic:canHitTarget(hitTarget)
	 if hitTarget == self.target and Formula:isHurtMagic(self.info) and not hitTarget:canBeHit(self.skillInfo) then
	 	return false
	 elseif hitTarget:isDie() then
	 	return false
	 end
	return true
end

--获取当前所在地图位置
function Magic:getCurMapPos()
	local x,y = self:getCurPos()
	local mx,my = FightDirector:getMap():toMapPos(x,y)
	return {mx = mx,my = my}
end

function Magic:getCurPos()
	local curX,curY = 0,0
	if self:isOnScene() then
		curX,curY = self:getPosition()
	else
		if self.magicParent == 1 then
			curX,curY = self.creature:getTruePosition()
		elseif self.magicParent == 2 then
			curX,curY = self.target:getTruePosition()
		end
		local offX,offY = self:getOffset()
		curX,curY = curX + offX,curY + offY
	end
	return curX,curY
end

--获取方向
function Magic:getDirection()
	return self.direction
end

function Magic:getDirectionType()
	return self.info.direction   --1  --表示 炮口方向
end

function Magic:isOnScene(  )
	return self.magicParent >= 3 and self.magicParent <= 6
end

--获取在哪个creature上
function Magic:getCreatureParent()
	if self.magicParent == 1 then
		return self.creature
	elseif self.magicParent == 2 then
		return self.target
	else
		return nil
	end
end

function Magic:_magicEnd()
	if self.info.crater then
		local event = {name=FightTrigger.ADD_CRATER,creature=self.target,crater=self.info.crater}
		-- if self:isOnScene() then
		event.x,event.y = self:getCurPos()
		-- end
		FightTrigger:dispatchEvent(event)
	end
	FightEngine:removeMagic(self)
end

function Magic:disposeParticle(particle)
	particle:removeFromParent()
	particle:release()
	ParticleMgr:DestroyParticle(particle)
end

function Magic:dispose()
	if self.light then
		self.light:toEnd()
		self.light:release()
		self.light = nil
	end

	if self._isRunning then  --当前正在跑   延迟销毁
		FightEngine:delayDisposeElem(self)
		return
	end
	-- print("magic 结束",self.magicId)

	if self.congealTime and self.congealTime > 0 then
		--print("这里？？？？",self.congealTime,self.gId)
		FightEngine:removeCongeal(self)
		--FightDirector:getCamera():removeCongeal(self.creature)
	end


	if self:isOnScene() then
		FightDirector:getScene():removeElem(self,self.addIndex)
	elseif self.magicParent == 1 then
		self.creature:removeMagic(self,self.addIndex)
	elseif self.magicParent == 2 then
		self.target:removeMagic(self,self.addIndex)
	end
	if self.creature then
		self.creature:release()
		self.creature = nil
	end
	if self.target then
		self.target:release()
		self.target = nil
	end

	if self._cacheMap then
		for _,p in pairs(self._cacheMap) do
			self:disposeParticle(p)
		end
		self._cacheMap = nil
	end

	self:disposeEx()
	-- MagicCache:setMagic(self)   --不缓存了
end

--function Magic:setHitTarget(targets)
--	self.targetList = targets
--end

function Magic:reset()
	if self.particle then
		self.particle:ResetData()
	end
end

function Magic:disposeEx()
	if self.magicEf then
		self.magicEf:release()
	end
	if self.particle then
		self:disposeParticle(self.particle)
		self.particle = nil
	end
	self:release()
end

return Magic