print("Running")
function awake()
	--
	listen(--listen for events
	function(EVENT)
		if tostring(EVENT.Type) == "MoveHitObjects" then--event type must be "MoveHitObjects"
			if EVENT.ShouldPerform then--event.HitObjects[1].ShouldPerform = true
				timer(EVENT.HitObjects[1].StartTime)--editor time
	end end end)
end
----
function timer(TIME)
	if not TIME then return end --return if no time given
	local Min, Sec, MlS = 0, 0, 0 --Minute, Second, MiliSecond
	local MlS_minor = 0 --used for referencing
	--1
	Sec, MlS = math.modf(TIME/1000)
	Sec, MlS = table.unpack(math.round_Batch({Sec, MlS}, 10))
	 --2
	Min, Sec = math.modf(Sec/60)
	Sec = math.round(Sec, 10)
	  --3
	Min, Sec = table.unpack(math.round_Batch({Min, Sec*60}, 2))
	   --4
	Sec, MlS_minor = math.modf(Sec)
	MlS = MlS + MlS_minor
		--5
	MlS, Sec = math.round(MlS*1000, 3), math.round(Sec, 2)
	if string.len(Min) == 1 then
	Min = 0 .. Min end
	if string.len(Sec) == 1 then
	Sec = 0 .. Sec end
	if string.len(MlS) < 3 then
		for i = 2, string.len(MlS), -1 do
		MlS = 0 .. MlS end
	end
	print("i!", Min ..":".. Sec ..".".. MlS)
end

----math stuff
function math.round(NUMBER, DECIMAL)
	if (not DECIMAL) then DECIMAL = 0 end
	local Notation = 10^DECIMAL
	--+ 0.5; so doesn't round =>0.5 downwards
	return math.floor(Notation * NUMBER+0.5)/ Notation
end
function math.round_Batch(TABLE, DECIMAL)
	if (not DECIMAL) then DECIMAL = 0 end
	local Table = {}
	local Notation = 10^DECIMAL
	for i = 1, #TABLE do
		local Value = math.floor(Notation* TABLE[i]+0.5)/ Notation
		table.insert(Table, #Table+1, Value)
	end
	return Table
end