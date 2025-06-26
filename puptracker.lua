

local actionPacketAbilityID = T{
    
	PUP_PROVOKE = 0x399, 
	FLASHBULB   = 0x39b,
}


local provokeTimer;
local flashbulbTimer;


ashita.events.register('packet_in', 'automaton_tracking_event', function(e)
   if (e.id == 0x28) then
		local actor     = struct.unpack('I', e.data, 0x05 + 0x01);
		local abilityID = bit.band(bit.rshift(struct.unpack('H', e.data, 0x0A + 0x01),6), 0xffff);
		local myIndex = AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0);
		local petIndex = AshitaCore:GetMemoryManager():GetEntity():GetPetTargetIndex(myIndex);
		
		if (actor == AshitaCore:GetMemoryManager():GetEntity():GetServerId(petIndex)) then	
			if(abilityID == actionPacketAbilityID.PUP_PROVOKE)then -- Strobe I / II Provoke
				provokeTimer = os.time(); -- Reset the Provoke counter
			elseif (abilityID == actionPacketAbilityID.FLASHBULB) then --Flashbulb
				flashbulbTimer = os.time(); -- Reset the Flashbulb counter
			end	
		end
   end
end);

local exports = T{
    GetProvokeTimer = function() return provokeTimer end,
	GetFlashbulbTimer = function() return flashbulbTimer end,
    Destroy = function() ashita.events.unregister('packet_in', 'automaton_tracking_event') end,
}
return exports
