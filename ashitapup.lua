require ('common');
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
local ashitapup = T{};
local pRealTime = ashita.memory.find('FFXiMain.dll', 0, '8B0D????????8B410C8B49108D04808D04808D04808D04C1C3', 2, 0);

ashitapup.settings = {
	AwayTargetDistance = 8; --default minimum distance to be considered away from your target
	AwayPetDistance = 4; --default minimum distance to be considered away from your pet
	PetDTGearHPP = 25; -- set pet HPP to have your PetDT set to come on
};

local GlamorSet = '19'; --LockstyleSet

ashitapup.Sets = T{
	Karagoz = {
		Head = {'Kara. Cappello +3'},
		Body = {'Kazagoz Farsetto +2'},
		Hands = {'Karagoz Guanti +3'},
		Legs = {'Kara. Pantaloni +3'},
		Feet = {},
	},
	
	Pitre = {
		Head = {'Pitre Taj +3'},
		Body = {'Pitre Tobe +3',},
		Hands = {},
		Legs = {'Pitre Churidars +3'},
		Feet = {'Pitre Babouches +3'},
	},
	
	Foire = {
		Head = {			},
		Body = {'Foire Tobe +3'},
		Hands = {'Foire Dastanas +3'},
		Legs = {			},
		Feet = {'Foire Babouches +3'},
	},
	
	Herc = {
		Head = {
			MAB = { Name = 'Herculean Helm', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+30', [2] = 'Pet: DEX+9', [3] = 'Pet: Attack+15', [4] = 'Pet: Phys. dmg. taken -1%', [5] = 'Pet: Rng.Atk.+15' }},
		},
		Body = {
			MAB = { Name = 'Herculean Vest', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+29', [2] = 'Pet: Crit.hit rate +2', [3] = 'Pet: "Dbl.Atk."+2' }},
		},
		Hands = {
			TA = { Name = 'Herculean Gloves', Augment = { [1] = '"Triple Atk."+4', [2] = 'Accuracy+4', [3] = 'Attack+6', [4] = 'DEX+7' }  },
			MAB = { Name = 'Herculean Gloves', Augment = { [1] = 'Pet: "Mag. Atk. Bns."+30', [2] = 'Pet: STR+1', [3] = 'Pet: Haste+3' }  },
		},
		Legs = {
			MAB = { },
		},
		Feet = {
			TA = {Name = 'Herculean Boots', Augment = { [1] = '"Triple Atk."+2', [2] = 'Accuracy+2', [3] = 'Attack+10', [4] = 'DEX+9' }},
			MAB = { },
		},
	}, 
	
	Taeon = {
		Head = {
			Tank = { Name = 'Taeon Chapeau', Augment = { [1] = 'Pet: Rng. Acc.+25', [2] = 'Pet: Damage taken -4%', [3] = 'Pet: Accuracy+25', [4] = 'Pet: "Dbl. Atk."+5' } },
		},
		Body = {
			Tank = { Name = 'Taeon Tabard', Augment = { [1] = 'Pet: Rng. Acc.+22', [2] = 'Pet: Damage taken -4%', [3] = 'Pet: Accuracy+22', [4] = 'Pet: "Dbl. Atk."+5' } },
		},
		Hands = {
			Tank = { Name = 'Taeon Gloves', Augment = { [1] = 'Pet: Rng. Acc.+23', [2] = 'Pet: Damage taken -4%', [3] = 'Pet: Accuracy+23', [4] = 'Pet: "Dbl. Atk."+5' } },
		},
		Legs = {
			Tank = { Name = 'Taeon Tights', Augment = { [1] = 'Pet: Rng. Acc.+22', [2] = 'Pet: Damage taken -4%', [3] = 'Pet: Accuracy+22', [4] = 'Pet: "Dbl. Atk."+5' } },
		},
		Feet = {
			Tank = { Name = 'Taeon Boots', Augment = { [1] = 'Pet: Rng. Acc.+24', [2] = 'Pet: Damage taken -4%', [3] = 'Pet: Accuracy+24', [4] = 'Pet: "Dbl. Atk."+5' } },
		},
	}, 

	Cape = {
		
			Master = {Name = 'Visucius\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' }  },
			WSCrit= {Name = 'Visucius\'s Mantle', Augment = { [1] = 'STR+30', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'Accuracy+20' }  },
			Turtle = {Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: M.Acc.+20', [2] = 'Pet: "Regen"+10', [3] = 'Pet: M.Dmg.+20', [4] = 'Mag. Evasion+20', [5] = 'Pet: Damage taken -5%', [6] = 'Evasion+20' }  },
			Tandem = {Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+10', [2] = 'Pet: Atk.+20', [3] = 'Phys. dmg. taken -10%', [4] = 'Attack+20', [5] = 'Pet: R.Acc.+20', [6] = 'Pet: R.Atk.+20', [7] = 'Pet: Haste+10', [8] = 'Accuracy+20', [9] = 'Pet: Accuracy+10', [10] = 'Pet: Acc.+20' }  },
			Pet = {Name = 'Visucius\'s Mantle', Augment = { [1] = 'Pet: Rng. Acc.+10', [2] = 'Pet: Atk.+20', [3] = 'Attack+20', [4] = 'Pet: R.Acc.+20', [5] = 'Pet: R.Atk.+20', [6] = 'Pet: Haste+10', [7] = 'Accuracy+20', [8] = 'Pet: Accuracy+10', [9] = 'Pet: Acc.+20' } },		

	
	}

}	






ashitapup.Maneuvers = T{ [300]='fire',[301]='ice',[302]='wind',[303]='earth',[304]='thunder',[305]='water',[306]='light',[307]='dark',};
ashitapup.AliasList = T{'frame','automan','team','wpn','glam', };
	
	
	
function ashitapup.SetVariables()	
	gcdisplay.CreateCycle('Frame', {[1] = 'Melee', [2] = 'Tank', [3] = 'Bone', [4] = 'Turtle', [5] = 'Mage', [6] = 'Ranger'});
	gcdisplay.CreateToggle('AutoMan', true);
	gcdisplay.CreateToggle('WpnLock', false);
	gcdisplay.CreateCycle('TeamSet', {[1] = 'Master', [2] = 'Tandem', [3] = 'Pet'});
end


function ashitapup.Initialize()
	ashitapup.SetVariables:once(4);
	ashitapup.SetAlias:once(4);
end

function ashitapup.Unload()

end


function ashitapup.SetAlias()
	for _, v in ipairs(ashitapup.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function ashitapup.HandleCommands(args)
	if not ashitapup.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;
	

	if (args[1] == 'frame') then
		gcdisplay.AdvanceCycle('Frame');
		toggle = 'Puppet Mode';
		status = gcdisplay.GetCycle('Frame');
	elseif (args[1] == 'team') then
		gcdisplay.AdvanceCycle('TeamSet');
		toggle = 'Team Set';
		status = gcdisplay.GetCycle('TeamSet');
	elseif (args[1] == 'automan') then
		gcdisplay.AdvanceToggle('AutoMan');
		toggle = 'Auto Maneuver';
		status = gcdisplay.GetToggle('AutoMan');
	elseif (args[1] == 'wpn') then
		
		if (gcdisplay.GetToggle('WpnLock') == false) then
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range');
			gcdisplay.AdvanceToggle('WpnLock');
			toggle = 'Weapon Lock';
			status = gcdisplay.GetToggle('WpnLock');
		else
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
			AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range');
			gcdisplay.AdvanceToggle('WpnLock');
			toggle = 'Weapon Lock';
			status = gcdisplay.GetToggle('WpnLock');
		end

	elseif args[1] == 'glam' then
		AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset ' .. GlamorSet);
		(function() AshitaCore:GetChatManager():QueueCommand(-1, '/sl reload') end):once(1.5)
	end
	
	if gcinclude.settings.Messages then
		gcinclude.Message(toggle, status)
	end
	
		
end

function ashitapup.GetMacroBook() -- Get Macrobook depending on SubJob
	local default = '21';
	local player = gData.GetPlayer();

	
	if (player.MainJob == 'PUP') then
		if (player.SubJob == 'WAR') then	
			return '18';
		elseif (player.SubJob == 'DNC') then
			return '28';
		--elseif (player.SubJob == 'XXX') then
		--return 1;
		end
	end	
	
	return default;
end

function ashitapup.GetMacroSet() -- Get Macroset depending on SubJob
	local default = '1';
	local player = gData.GetPlayer();

	
	if (player.MainJob == 'PUP') then
		if (player.SubJob == 'WAR') then	
			return '1';
		elseif (player.SubJob == 'DNC') then
			return '1';
		--elseif (player.SubJob == 'XXX') then
		--return 1;
		end
	end	
	
	return default;
end

function ashitapup.DoManeuverMaint()
	-- Dont do Maneuver Maint if in town.
	local zone = gData.GetEnvironment();
	if (zone.Area ~= nil) and (gcinclude.Towns:contains(zone.Area)) then return end

	local playMgr = AshitaCore:GetMemoryManager():GetPlayer();
	local ids = playMgr:GetStatusIcons();
	local durations = playMgr:GetStatusTimers();
	local recastTimer = gcinclude.CheckAbilityRecast('Fire Maneuver');
	local recastReady = recastTimer == 0;
	for i = 1,32 do
		if ids[i] and ids[i] ~= 255 then
			for k, v in pairs(ashitapup.Maneuvers) do
				if ids[i] == k then
					local remainingTime = gcinclude.CalculateBuffDuration(durations[i]);
					if remainingTime < 15 and recastReady then
						AshitaCore:GetChatManager():QueueCommand(1, '/pet "' .. v .. ' maneuver" <me>');
					end
				end
			end
		end
	end
end

function ashitapup.checkWSmods(wsName)
	

end

function ashitapup.checkTPBonus(wsName, currentTP)

	local player = gData.GetPlayer();
	local gear = gData.GetEquipment();
	local totalTP = currentTP;
	--debug : print(chat.header('GCinclude'):append(chat.message('TP on WS ' .. wsName .. ' : ' .. currentTP )));
	
	
	if (currentTP < 3000 ) then
		if (gear.Main.Name == 'Godhands') then
			totalTP = totalTP +500; -- Aeonic Weapon
			--debug :print(chat.header('GCinclude'):append(chat.message(wsName .. ': +500 (Aeonic) -- '.. totalTP )));
		end
		
		if(wsName == 'Victory Smite' or wsName == 'Howling Fist' ) then
			totalTP = totalTP + 200; --Mpaca's Cap
			--debug :print(chat.header('GCinclude'):append(chat.message(wsName .. ': +200 (Mpaca\'s Cap) -- '.. totalTP )));
		elseif (wsName == 'Shijin Spiral') then
			--debug :print(chat.header('GCinclude'):append(chat.message(wsName ..': No Moonshade' )));
			return	
		end	
		if(gear.Head.Name == 'Kara. Cappello +3') then
			totalTP = totalTP + 600
		end
				 
		if (totalTP < 3000) then
			--debug :print(chat.header('GCinclude'):append(chat.message('Total TP:' .. totalTP .. '. Equipping Moonshade')));
			gcinclude.DoMoonshade();
			
		else
			--debug :print(chat.header('GCinclude'):append(chat.message('Total TP:' .. totalTP .. '. Not Equipping Moonshade')));
		end
	else
		--debug :print(chat.header('GCinclude'):append(chat.message('Max TP: No Moonshade' )));
	end			
end


return ashitapup;
