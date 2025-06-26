--  _____  _          _                 _____  _                               
-- /  ___|| |        (_)               |_   _|| |                              
-- \ `--. | |_  _ __  _  _ __    __ _    | |  | |__    ___   ___   _ __  _   _ 
--  `--. \| __|| '__|| || '_ \  / _` |   | |  | '_ \  / _ \ / _ \ | '__|| | | |
-- /\__/ /| |_ | |   | || | | || (_| |   | |  | | | ||  __/| (_) || |   | |_| |
-- \____/  \__||_|   |_||_| |_| \__, |   \_/  |_| |_| \___| \___/ |_|    \__, |
--                              __/ |                                    __/ |
--                             |___/                                    |___/ 
--   ___        _      _  _                    ___                             
--  / _ \      | |    (_)| |                  /   |                            
-- / /_\ \ ___ | |__   _ | |_  __ _  __   __ / /| |                            
-- |  _  |/ __|| '_ \ | || __|/ _` | \ \ / // /_| |                            
-- | | | |\__ \| | | || || |_| (_| |  \ V /_\___  |                            
-- \_| |_/|___/|_| |_||_| \__|\__,_|   \_/(_)   |_/                            
                                                     	
--Author: Zarvlad - (Zarvladx on Odin)
--Credits:
--Thorny, Mathemagic : puptracker.lua
--flanagak: Auto-Maneuvers



local profile = {};
local autoTracker = gFunc.LoadFile('common\\puptracker.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
ashitapup = gFunc.LoadFile('common\\ashitapup.lua');

local sets = {

--   _         _                        _                __      _       
--  /_\  _   _| |_ ___  _ __ ___   __ _| |_ ___  _ __   / _\ ___| |_ ___ 
-- //_\\| | | | __/ _ \| '_ ` _ \ / _` | __/ _ \| '_ \  \ \ / _ \ __/ __|
--/  _  \ |_| | || (_) | | | | | | (_| | || (_) | | | | _\ \  __/ |_\__ \
--\_/ \_/\__,_|\__\___/|_| |_| |_|\__,_|\__\___/|_| |_| \__/\___|\__|___/
--                                                                      
--Automaton Sets	
	-- These Sets will be for when ONLY your Automaton is engaged
    Pet_Tp_Default = {
		Main =  'Ohtas',
		Range = 'Animator P +1',
        Ammo = 'Automat. Oil +3',
        Head =  ashitapup.Sets.Taeon.Head.Tank,
        Neck = 'Shulmanu Collar',
        Ear1 = 'Rimeice Earring',
		Ear2 = 'Enmerkar Earring',
        Body = ashitapup.Sets.Pitre.Body,
        Hands = ashitapup.Sets.Taeon.Hands.Tank,
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'C. Palug Ring',
		Back = ashitapup.Sets.Cape.Pet,
        Waist = 'Klouskap Sash +1',
        Legs = ashitapup.Sets.Taeon.Legs.Tank,
        Feet = 'Mpaca\'s Boots',
    },
    Pet_Tp_Hybrid = {
    },
    Pet_Tp_Acc = {
        
    },
	-- These following sub sets are intended for one off items to equip while ONLY automaton is engaged based on the Frame. 
	--An example would be Pet HP+ pieces for Tank mode. Can be empty but do not delete.
    Pet_Tank = { -- Bruiser set
		Main =  'Midnights',
        Range = 'Animator P +1',
        --Head = '',
		--Neck = '',
        Ear1 = 'Rimeice Earring',
		Ear2 = 'Enmerkar Earring',
        --Ring1 = '',
        Ring2 = 'C. Palug Ring',
		Body = ashitapup.Sets.Taeon.Body.Tank,
		Hands = ashitapup.Sets.Taeon.Hands.Tank,
        Legs = ashitapup.Sets.Taeon.Legs.Tank,
        Feet = ashitapup.Sets.Taeon.Feet.Tank,
	},
	
	  Pet_Bone = { --Bonecrusher set
		Main =  'Ohtas',
        Range = 'Animator P +1',
        --Head = '',
		--Neck = '',
        Ear1 = 'Rimeice Earring',
		Ear2 = 'Enmerkar Earring',
        --Ring1 = '',
        Ring2 = 'C. Palug Ring',
		Body = ashitapup.Sets.Taeon.Body.Tank,
		Hands = ashitapup.Sets.Taeon.Hands.Tank,
        Legs = ashitapup.Sets.Taeon.Legs.Tank,
        Feet = ashitapup.Sets.Taeon.Feet.Tank,
	},
	
	Pet_Turtle = { -- Turtle a.k.a Le Chonk, set
		Main = 'Gnafron\'s Adargas',
		Range = 'Neo Animator',
        Head = 'Rao Kabuto +1',
        --Ear1 = 'Rimeice Earring',
		--Ear2 = 'Enmerkar Earring',
		Neck = 'Shepherd\'s Chain',
        --Ring1 = '',
        Ring2 = 'Overbearing Ring',
		Body = 'Rao Togi +1',
		Hands = 'Rao Kote +1',
		Back = ashitapup.Sets.Cape.Turtle,
		Waist = 'Isa Belt',
        Legs = 'Rao Haidate +1',
        Feet = 'Rao Sune-Ate +1',
	},
	 Pet_Melee = {
		Main =  'Ohtas',
        Range = 'Animator P +1',  
		
	},
	 Pet_Ranger = {
		Main =  'Xiucoatl',  
		Range = 'Animator P II +1', 		
		Head = ashitapup.Sets.Pitre.Head,
		Hands = 'Mpaca\'s Gloves',
		Legs = ashitapup.Sets.Karagoz.Legs,
		Ear1 = 'Crep. Earring',
        --Ear2 = '',	
		--Ring1 = '',
        Ring2 = 'Varar Ring +1',
	},
	 Pet_Mage ={
		Main = 'Sakpata\'s Fists',
        Range = 'Animator P II +1',
        Ammo = 'Automat. Oil +3',
        Head = ashitapup.Sets.Herc.Head.MAB,
        Neck = { Name = 'Pup. Collar +1', AugPath='A' },
        Ear1 = 'Burana Earring',
        Ear2 = { Name = 'Karagoz Earring', Augment = { [1] = 'Accuracy+10', [2] = 'Mag. Acc.+10' } },
        Body = ashitapup.Sets.Herc.Body.MAB,
        Hands = ashitapup.Sets.Herc.Hands.MAB,
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Tali\'ah Ring',
        Back = ashitapup.Sets.Cape.Turtle,
        Waist = 'Ukko Sash',
        Legs = ashitapup.Sets.Pitre.Legs,
        Feet = ashitapup.Sets.Pitre.Feet,
		
	},
	
	Pet_Enmity = { -- This set will be equipped if your automaton is in Tank or Turtle mode and there is less than 5 seconds before the next Flashbulb or Provoke
		head ='Heyoka Cap +1',
		body ='He. Harness +1',
       	hands ='He. Mittens +1',
	   	legs ='Heyoka Subligar +1',
	   	feet ='He. Leggings +1',
	   	Ear1 ='Rimeice Earring',
		Ear2 ='Domes. Earring',
		-- You can leave empty but do not delete
    },
	
	
    Pet_Dt = {
		Main = 'Midnights',
        Head = 'Rao Kabuto +1',
		Ear1 = 'Rimeice Earring',
        Ear2 = 'Enmerkar Earring',
		Neck = 'Shepherd\'s Chain',
        Ring1 = 'Thurandaut Ring',
		Ring2 = 'C. Palug Ring',
		Body = 'Rao Togi +1',
		Hands = 'Rao Kote +1',
		Back = ashitapup.Sets.Cape.Turtle,
		Waist = 'Isa Belt',
        Legs = 'Rao Haidate +1',
        Feet = 'Rao Sune-Ate +1',
	},
	
	--- These sets are when your Puppet is midcast
	Magic_Default = {
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = { Name = 'Pup. Collar +1', AugPath='A' },
        Ear1 = 'Enmerkar Earring',
        Ear2 = { Name = 'Karagoz Earring', Augment = { [1] = 'Accuracy+10', [2] = 'Mag. Acc.+10' } },
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Tali\'ah Ring',
        Back = ashitapup.Sets.Cape.Turtle,
        Waist = 'Ukko Sash',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Mpaca\'s Boots',
    },
	
	 Elemental = {
        Head = ashitapup.Sets.Herc.Head.MAB,
        Neck = { Name = 'Pup. Collar +1', AugPath='A' },
        Ear1 = 'Burana Earring',
        Ear2 = { Name = 'Karagoz Earring', Augment = { [1] = 'Accuracy+10', [2] = 'Mag. Acc.+10' } },
        Body = ashitapup.Sets.Herc.Body.MAB,
        Hands = ashitapup.Sets.Herc.Hands.MAB,
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Tali\'ah Ring',
        Back = ashitapup.Sets.Cape.Turtle,
        Waist = 'Ukko Sash',
        Legs = ashitapup.Sets.Pitre.Legs,
        Feet = ashitapup.Sets.Pitre.Feet,
    },
	 Healing = {
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = { Name = 'Pup. Collar +1', AugPath='A' },
        Ear1 = 'Enmerkar Earring',
        Ear2 = { Name = 'Karagoz Earring', Augment = { [1] = 'Accuracy+10', [2] = 'Mag. Acc.+10' } },
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Tali\'ah Ring',
        Back = ashitapup.Sets.Cape.Turtle,
		Waist = 'Ukko Sash',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Mpaca\'s Boots',
    },
		
-- _____                _                  __      _       
--/__   \__ _ _ __   __| | ___ _ __ ___   / _\ ___| |_ ___ 
--  / /\/ _` | '_ \ / _` |/ _ \ '_ ` _ \  \ \ / _ \ __/ __|
-- / / | (_| | | | | (_| |  __/ | | | | | _\ \  __/ |_\__ \
-- \/   \__,_|_| |_|\__,_|\___|_| |_| |_| \__/\___|\__|___/
                                                        
--Tandem Sets	
    -- These profile.Sets will be for when both you and your pet are engaged
	Tandem_Tp_Default = {
		Main =  'Xiucoatl',  
		Range = 'Animator P +1',
		Ammo = 'Automat. Oil +3',
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = ashitapup.Sets.Cape.Tandem,
		Waist = 'Moonbow Belt +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = { Name = 'Mpaca\'s Boots', AugPath='A' },
        
    },
	Tandem_Tp_Hybrid = {
		Main = { Name = 'Xiucoatl', AugPath='C' },
        Range = 'Animator P +1',
        Ammo = 'Automat. Oil +3',
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'C. Palug Ring',
		Back = ashitapup.Sets.Cape.Tandem,
		Waist = 'Moonbow Belt +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = { Name = 'Mpaca\'s Boots', AugPath='A' },
    },
	Tandem_Tp_Acc = {
        Ammo = 'Automat. Oil +3',
		Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Chirich Ring +1',
		Ring2 = 'C. Palug Ring',
        Back = ashitapup.Sets.Cape.Tandem,
		Waist = 'Moonbow Belt +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Nyame Sollerets',
    },
    -- These following profile.Sets are intended for one off items to equip while both the pet and you based on the Frame. An example would be Pet HP+ pieces for Tank mode. Can be empty but do not delete.
    	
		
	Tank = {
        Ammo = 'Automat. Oil +3',
        Neck = 'Loricate Torque +1',
		Body = 'Malignance Tabard',
        Ear1 = 'Domes. Earring',
        Ear2 = 'Karagoz Earring',
        Ring1 = 'Defending Ring',
        Ring2 = 'C. Palug Ring',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots Boots',
    },
	
	Melee = {     
		Head = 'Heyoka Cap +1',
		Neck = 'Shulmanu Collar',
		Ear2 = 'Karagoz Earring',	
		Hands = ashitapup.Sets.Karagoz.Hands,
		Legs = 'Heyoka Subligar +1',
		Feet = 'Mpaca\'s Boots',       
    },
	
	Bone = {
	   
		Head = 'Heyoka Cap +1',
		Neck = 'Shulmanu Collar',
		Ear2 = 'Karagoz Earring',	
		Hands = ashitapup.Sets.Karagoz.Hands,
		Legs = 'Heyoka Subligar +1',
		Feet = 'Mpaca\'s Boots',      
    },
	

	Turtle = {
		
    },

	Ranger = {	
        Head = 'Heyoka Cap +1',
		Neck = 'Shulmanu Collar',
		Ear2 = 'Crep. Earring',	
		Hands = ashitapup.Sets.Karagoz.Hands,
		Legs = 'Heyoka Subligar +1',
		Feet = 'Mpaca\'s Boots',
    },
    Mage = {

    },
	
--                  _              __      _       
--  /\/\   __ _ ___| |_ ___ _ __  / _\ ___| |_ ___ 
-- /    \ / _` / __| __/ _ \ '__| \ \ / _ \ __/ __|
--/ /\/\ \ (_| \__ \ ||  __/ |    _\ \  __/ |_\__ \
--\/    \/\__,_|___/\__\___|_|    \__/\___|\__|___/
-- Master Sets                                                    
	
	Idle = {-- Player Not Enganged and No Pet
		Range = 'Neo Animator',
		Ammo = 'Automat. Oil +3',
		Head = 'Malignance Chapeau',
        Neck = 'Unmoving Collar +1',
        Ear2 = 'Dawn Earring',
        Ear1 = 'Infused Earring',
        Body = 'Malignance Tabard',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gelatinous Ring +1',
        Ring2 = 'C. Palug Ring',
        Back = 'Moonbeam Cape',
        Waist = 'Moonbow Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',		
    },	

    Idle_Pet = { -- Player Not Engaged and Pet Active
		
        Ammo = 'Automat. Oil +3',
		Head = 'Malignance Chapeau',
		Neck = 'Unmoving Collar +1',
        Ear2 = 'Dawn Earring',
        Ear1 = 'Infused Earring',
        Body = 'Malignance Tabard',
		Hands = 'Malignance Gloves',
		Ring1 = 'Gelatinous Ring +1',
		Ring2 = 'C. Palug Ring',
		Back = 'Moonbeam Cape',
        Waist = 'Moonbow Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
	
	Dt = {
        Head = 'Malignance Chapeau',--6*
        Neck = 'Loricate Torque +1',--6*
        Ear1 = 'Mache Earring',
        Ear2 = 'Odnowa Earring +1',
        Body = 'Malignance Tabard', --12*
        Hands = 'Malignance Gloves', --9*
		Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
		Back = ashitapup.Sets.Cape.Master,
        Waist = 'Moonbow Belt +1',
        Legs = 'Malignance Tights',--8*
        Feet = 'Malignance Boots',--7*
	},
	
	-- These Sets will be for when only you are engaged
	['Master_Tp_Default'] = {
        Main = { Name = 'Xiucoatl', AugPath='C' },
        Range = 'Neo Animator',
        Ammo = 'Automat. Oil +3',
        Head = { Name = 'Ryuo Somen +1', AugPath='C' },
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Dedition Earring',
        Body = 'Malignance Tabard',
        Hands = ashitapup.Sets.Karagoz.Hands,
		Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = ashitapup.Sets.Cape.Master,
        Waist = 'Moonbow Belt +1',
        Legs = 'Ryuo Hakama +1',
        Feet = ashitapup.Sets.Herc.Feet.TA,
    },
    Master_Tp_Hybrid = {
		Range = 'Neo Animator',
		Ammo = 'Automat. Oil +3',
		Head = 'Malignance Chapeau',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = 'Malignance Tabard',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
		Ring2 = 'Niqmaddu Ring',
        Back = ashitapup.Sets.Cape.Master,
		Waist = 'Moonbow Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
		},
		
    Master_Tp_Acc = {
		Range = 'Neo Animator',
		Ammo = 'Automat. Oil +3',
		Head = 'Malignance Chapeau',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
		Ring1 = 'Chirich Ring +1',
		Ring2 = 'Niqmaddu Ring',
       Back = ashitapup.Sets.Cape.Master,
		Waist = 'Moonbow Belt +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Malignance Boots',
    },
	
	
	Resting = {
        Head = 'Rao Kabuto +1',
		Neck = 'Sanctity Necklace',
		Body = 'Hiza. Haramaki +2',
        Ear1 = 'Infused Earring',
		Ear2 = 'Burana Earring',
        Hands = 'Rao Kote +1',
        Legs = 'Rao Haidate +1',
        Feet = 'Rao Sune-Ate +1',
        Ring2 = 'Chirich Ring +1',
    },
	
    Idle_Regen = {
        Head = 'Rao Kabuto +1', 
		Neck = 'Sanctity Necklace',
		Body = 'Hiza. Haramaki +2',
        Ear1 = 'Infused Earring',
		Ear2 = 'Burana Earring',
        Hands = 'Rao Kote +1',
        Legs = 'Rao Haidate +1',
        Feet = 'Rao Sune-Ate +1',
        Ring2 = 'Chirich Ring +1',
    },
	
    Idle_Refresh = {
        Body = 'Annoint. Kalasiris',
        Legs = 'Assiduity Pants',
    },
	
	Town = {  },
	Sleeping = {  }, -- equipment used to wake you up, ex.: T2 prime weapon
	
	
	TH_No_Pet = {
        Ammo = 'Per. Lucky Egg',
	},
	
	TH = {
		Head = 'Wh. Rarab Cap +1',
		--Waist = 'Chaac Belt',
	},
	
	Enmity = {
		Hands = 'Nilas Gloves',
        Neck = 'Warder\'s Charm',
        Ring1 = 'Pernicious Ring',
        Ring2 = 'Eihwaz Ring',
        Back = 'Searing Cape',
        Waist = 'Goading Belt',
    },
	
    Movement = {
		Feet = 'Hermes\' Sandals',
	},
	
	Reive = {
        Neck = 'Ygnas\'s Resolve +1',
	},
	
	DI = { }, -- Domain Invasion set
	
	
    Precast = {
        Head = 'Haruspex Hat +1',--9
        Neck = 'Baetyl Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Foppish Tunica',
		Hands = 'Euxine Gloves +2',
		Ring1 = 'Naji\'s Loop',
        Ring2 = 'Prolix Ring',
		Feet = 'Regal Pumps',
    },

    Enhancing = {
    },
    Phalanx = {
    },
    Stoneskin = {
    },
    Refresh = {
    },

    Cure = {
	
    },
	
	Waltz = {
	
    },
	
	
    Enfeebling = {
    },

	PDL = {
		Head = ashitapup.Sets.Karagoz.Head, 
		Neck = 'Pup. Collar +1',
        --Ring2 = 'Sroda Ring',
    },
	
-- __    __                                 _    _ _ _     
--/ / /\ \ \___  __ _ _ __   ___  _ __  ___| | _(_) | |___ 
--\ \/  \/ / _ \/ _` | '_ \ / _ \| '_ \/ __| |/ / | | / __|
-- \  /\  /  __/ (_| | |_) | (_) | | | \__ \   <| | | \__ \
--  \/  \/ \___|\__,_| .__/ \___/|_| |_|___/_|\_\_|_|_|___/
--                   |_|                                   
--Weaponskills	

	Ws_Default = {
		
        Head = 'Mpaca\'s Cap',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Schere Earring',
        Ear2 =  'Sroda Earring', 
        Body = 'Mpaca\'s Doublet',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Niqmaddu Ring',
        ashitapup.Sets.Cape.WSCrit,
        Waist = 'Moonbow Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
		
		
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Shijin_Default = { --DEX Light
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Fotia Gorget',
        Ear2 = 'Schere Earring',
        Ear1 = 'Mache Earring + 1',
        Body = 'Mpaca\'s Doublet',
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = ashitapup.Sets.Cape.Master,
        Waist = 'Moonbow Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
	},
    Shijin_Hybrid = {
    },
    Shijin_Acc = {
    },
	
	Asuran_Default = {
       
    },
    Asuran_Hybrid = {
    },
    Asuran_Acc = {
	},
	
	
	Victory_Default = { --STR Light
        Head = 'Mpaca\'s Cap', --ashitapup.Sets.Karagoz.Head,
        Neck = 'Fotia Gorget',
        Ear1 = 'Sroda Earring',
        Ear2 = 'Schere Earring', 
        Body = 'Mpaca\'s Doublet',
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        ashitapup.Sets.Cape.WSCrit,
        Waist = 'Moonbow Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
    },
    Victory_Hybrid = {
    },
    Victory_Acc = {
    },
	
	Stringing_Default = {
        Head = 'Mpaca\'s Cap',
        Neck = 'Fotia Gorget',
        Ear1 = 'Sroda Earring',
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        ashitapup.Sets.Cape.WSCrit,
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
    },
	Stringing_Hybrid = {
	},
	Stringing_Acc = {
	},
	
	Howling_Default = { --VIT/str Light
        Head = 'Mpaca\'s Cap',
        Neck = 'Rep. Plat. Medal',
        Ear2 = 'Schere Earring',
        Ear1 = 'Sroda Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = ashitapup.Sets.Karagoz.Hands,
		Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Waist = 'Moonbow Belt +1',
		Back = { Name = 'Visucius\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Phys. dmg. taken -10%', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Legs = 'Mpaca\'s Hose',
        Feet = 'Mpaca\'s Boots',
	},
    Howling_Hybrid = {
    },
    Howling_Acc = {
    },

    Pet_WS = {
		Main = { Name = 'Xiucoatl', AugPath='C' },
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
		Ear1 = 'Burana Earring',
        Ear2 = 'Karagoz Earring',
        Body = ashitapup.Sets.Pitre.Body,
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'Overbearing Ring',
        Back = 'Dispersal Mantle',
		Waist = 'Klouskap Sash +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Mpaca\'s Boots',
	},
	Pet_BoneCrusher = {
		Main = 'Xiucoatl',
        Head = 'Taeon Chapeau',
        Neck = 'Shulmanu Collar',
		Ear1 = 'Domes. Earring',
        Ear2 = 'Karagoz Earring',
        Body = ashitapup.Sets.Taeon.Body.Tank,
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'C. Palug Ring',
		Back = ashitapup.Sets.Cape.Master,		
		Waist = 'Klouskap Sash +1',
        Legs = ashitapup.Sets.Taeon.Legs.Tank,
        Feet = 'Mpaca\'s Boots',
	},
    Pet_RNGWS = {
		Main =  'Xiucoatl',
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
		Ear1 = 'Burana Earring',
        Ear2 = 'Karagoz Earring',
        Body = 'Nyame Mail',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'Overbearing Ring',
        Back = 'Dispersal Mantle',
        Waist = 'Klouskap Sash +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Mpaca\'s Boots',
	},
--   __        _             _     _ _ _ _   _           
--   \ \  ___ | |__     __ _| |__ (_) (_) |_(_) ___  ___ 
--    \ \/ _ \| '_ \   / _` | '_ \| | | | __| |/ _ \/ __|
-- /\_/ / (_) | |_) | | (_| | |_) | | | | |_| |  __/\__ \
-- \___/ \___/|_.__/   \__,_|_.__/|_|_|_|\__|_|\___||___/
-- Job Abilities

	Repair = {
		Main = 'Nibiru Sainti', 
		Ammo = 'Automat. Oil +3',
        Ear1 = 'Guignol Earring',
		Ear2 = 'Pratik Earring',
        Body = ashitapup.Sets.Foire.Body,
        Hands = 'Rao Kote +1',
        Ring1 = 'Overbearing Ring',
        Feet = ashitapup.Sets.Foire.Feet,
	},
	Maneuver = {
        Ear1 = 'Burana Earring',
        Body = ashitapup.Sets.Karagoz.Body,
		Neck = 'Bfn. Collar +1',
        Hands = ashitapup.Sets.Foire.Hands,
        Back = ashitapup.Sets.Cape.Tandem,
	},
	
	TacticalSwitch = {},
	Ventriloquy = {},
	RoleReversal = {},

--   ____                      __     _          
--  / __ \_   _____  _________/ /____(_)   _____ 
-- / / / / | / / _ \/ ___/ __  / ___/ / | / / _ \
--/ /_/ /| |/ /  __/ /  / /_/ / /  / /| |/ /  __/
--\____/ |___/\___/_/   \__,_/_/  /_/ |___/\___/ 
-- Overdrive
    
    Overdrive = {-- this set will force on the ability AND stay on for the duration of OD, dont change the body out because of that
        Main = 'Xiucoatl',
		Range = 'Animator P +1',
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
		Ear1 = 'Rimeice Earring', 
		Ear2 = 'Karagoz Earring',
        Body = ashitapup.Sets.Pitre.Body,
        Hands = 'Mpaca\'s Gloves',
        Ring2 = 'C. Palug Ring',
        Ring1 = 'Thurandaut Ring',
        Back = 'Dispersal Mantle',
		Waist = 'Klouskap Sash +1',
        Legs = 'Heyoka Subligar +1',
        Feet = 'Mpaca\'s Boots',		
    },
	 
	TandemOverdrive = {
        Main = 'Xiucoatl',
		Range = 'Animator P +1',
        Ammo = 'Automat. Oil +3',
        Head = ashitapup.Sets.Karagoz.Head,
        Neck = 'Shulmanu Collar',
        Ear1 = 'Rimeice Earring',
        Ear2 = { Name = 'Karagoz Earring', Augment = { [1] = 'Accuracy+10', [2] = 'Mag. Acc.+10' } },
        Body = ashitapup.Sets.Karagoz.Body,
        Hands = ashitapup.Sets.Karagoz.Hands,
        Ring1 = 'Thurandaut Ring',
        Ring2 = 'C. Palug Ring',
        Back = ashitapup.Sets.Cape.Tandem,
		Waist = 'Moonbow Belt +1',
        Legs = ashitapup.Sets.Karagoz.Legs,
        Feet = 'Tali\'ah Crackows +2',
    },
	
	TankOverdrive = {-- this set will force on the ability AND stay on for the duration of OD, dont change the body out because of that
        Head = 'Taeon Chapeau',
        Body = ashitapup.Sets.Taeon.Body.Tank,
		Hands = ashitapup.Sets.Taeon.Hands.Tank,
        Legs = ashitapup.Sets.Taeon.Legs.Tank,
        Back = ashitapup.Sets.Cape.Pet,
    },
	
	BoneOverdrive = {-- this set will force on the ability AND stay on for the duration of OD, dont change the body out because of that
           	
    },
	
	TurtleOverdrive = {-- this set will force on the ability AND stay on for the duration of OD, dont change the body out because of that
        Main = 'Xiucoatl',
        Head = 'Rao Kabuto +1',
        Neck = 'Shulmanu Collar',
		Ear1 = 'Rimeice Earring',
		Ear2 = 'Enmerkar Earring',
		Body = 'Rao Togi +1',
		Hands = 'Rao Kote +1',
        Back = ashitapup.Sets.Cape.Turtle,
		Legs = 'Rao Haidate +1',
        Feet = 'Rao Sune-Ate +1',	 	
    },

};
profile.Sets = sets;


profile.Aliaslist = T{'frame','automan','team','wpn', };

local JobSettings = {
	GlamorSet = '19', --LockstyleSet
	MacroBook = ashitapup.GetMacroBook(),
	MacroSet = ashitapup.GetMacroSet(),
};


profile.Packer = {
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
	ashitapup.Initialize();
	gcinclude.SetMacroBook(JobSettings.MacroBook);
	gcinclude.SetMacroSet(JobSettings.MacroSet);
	(function() AshitaCore:GetChatManager():QueueCommand(-1, '/glam') end):once(3);
	(function() AshitaCore:GetChatManager():QueueCommand(-1, '/addon load petme') end):once(3);
	(function() AshitaCore:GetChatManager():QueueCommand(-1, '/addon load pupsets') end):once(3);
    gcinclude.settings.RefreshGearMPP = 30;

end

profile.OnUnload = function()
    (function() AshitaCore:GetChatManager():QueueCommand(-1, '/addon unload petme') end):once(3);
	(function() AshitaCore:GetChatManager():QueueCommand(-1, '/addon unload pupsets') end):once(3);
	autoTracker:Destroy();
	gcinclude.Unload();
end

profile.HandleCommand = function(args)
	
		ashitapup.HandleCommands(args);
		gcinclude.HandleCommands(args);
	 
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
    local OD = gData.GetBuffCount('Overdrive');
	local mounted = gData.GetBuffCount('Mounted'); 
	local invis = gData.GetBuffCount('Invisible'); 
	local target = gData.GetTarget();
	local reive = gData.GetBuffCount('Reive Mark');
	local overload = gData.GetBuffCount('Overload');
	local food = gData.GetBuffCount('Food');
	local souleater = gData.GetBuffCount('Souleater');
	local lastresort = gData.GetBuffCount('Last Resort');
	local provokeTimer = autoTracker:GetProvokeTimer(); 
	local flashbulbTimer = autoTracker:GetFlashbulbTimer();
	local provokeRecast;
	local flashbulbRecast; 
	
	if (petAction ~= nil) then
        HandlePetAction(petAction);
		return;
	end
	
    gFunc.EquipSet(sets.Idle);
    if (pet ~= nil) then
        gFunc.EquipSet(sets.Idle_Pet);
    end
	if (player.MP < 4 and gcdisplay.GetToggle('EXP') == true ) then
        gFunc.EquipSet(sets.Idle_Refresh );
    end
	
	if (overload >= 1) then
       (function() AshitaCore:GetChatManager():QueueCommand(-1, '/echo ****** OVERLOADED - COOLDOWN NOW! ******') end):once(2);
	   (function() AshitaCore:GetChatManager():QueueCommand(-1, '/ja "Cooldown" <me>') end):once(0);
    end
	
	
	if (pet ~= nil and gcdisplay.GetToggle('AutoMan') == true and not IsZoning and mounted == 0 and invis == 0 and player.Status ~= 'Resting') then
		ashitapup.DoManeuverMaint();
	end
	
	if (pet ~= nil and gcdisplay.GetToggle('TeamSet') == 'Pet' and pet.HPP < 30 ) then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/ja "Repair" <me>') end):once(0);
	end
	-- Sets only the pet is supposed to fight
    if (pet ~= nil and pet.Status == 'Engaged') then
		if(gcdisplay.GetCycle('TeamSet') == 'Pet') then
			-- Sets only the pet is supposed to fight
			gFunc.EquipSet('Pet_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
			gFunc.EquipSet('Pet_' .. gcdisplay.GetCycle('Frame'));
	    elseif(gcdisplay.GetCycle('TeamSet') == 'Tandem') then 
			if (ashitapup.AwayFromTarget() == true or ashitapup.AwayFromPet() == true) then
				-- Sets for when you are out of pet and target range
				gFunc.EquipSet('Pet_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
				gFunc.EquipSet('Pet_' .. gcdisplay.GetCycle('Frame'));
			else
				-- Sets for when you and the pet are fighting
				gFunc.EquipSet('Tandem_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
			
			end
	    elseif(gcdisplay.GetCycle('TeamSet') == 'Master' and player.Status == 'Engaged') then
			gFunc.EquipSet('Master_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
		end
		
	elseif(gcdisplay.GetCycle('TeamSet') == 'Pet' and player.Status == 'Engaged' ) then
			gFunc.EquipSet('Pet_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
			gFunc.EquipSet('Pet_' .. gcdisplay.GetCycle('Frame'));
	elseif(gcdisplay.GetCycle('TeamSet') == 'Tandem' and player.Status == 'Engaged') then
			gFunc.EquipSet('Tandem_Tp_' .. gcdisplay.GetCycle('MeleeSet'));
	elseif(gcdisplay.GetCycle('TeamSet') == 'Master') then
		if (player.Status == 'Engaged') then
			gFunc.EquipSet('Master_Tp_' .. gcdisplay.GetCycle('MeleeSet'));	end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
		
	elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end

    gcinclude.CheckDefault();
	
    if (gcdisplay.GetToggle('DTset') == true ) then
        if (pet ~= nil and  gcdisplay.GetCycle('TeamSet') == 'Pet') then
            gFunc.EquipSet(sets.Pet_Dt);
		end
        gFunc.EquipSet(sets.Dt);
	end
    if (gcdisplay.GetToggle('Kite') == true) then 
		gFunc.EquipSet(sets.Movement);
	end
	
	if(reive >= 1) then 
		gFunc.EquipSet(sets.Reive);
	end	
	

	if (pet ~= nil) and (pet.TP > 950) and (pet.Status == 'Engaged') then 
        if (gcdisplay.GetCycle('Frame') == 'Ranger') then
            gFunc.EquipSet(sets.Pet_RNGWS); 
		elseif (gcdisplay.GetCycle('Frame') == 'Bone') then
            gFunc.EquipSet(sets.Pet_BoneCrusher);
		elseif (gcdisplay.GetCycle('Frame') == 'Turtle') then
		
		else
            gFunc.EquipSet(sets.Pet_WS); 
        end
	elseif (pet ~= nil) and (pet.Status == 'Engaged')then 
       
		if (gcdisplay.GetCycle('Frame') == 'Tank' or gcdisplay.GetCycle('Frame') == 'Turtle') then
			if (provokeTimer ~= nil) then
				
				provokeRecast = provokeTimer + 30  - os.time(); -- change the numerical value if your recast seems off
				if (provokeRecast < 5 and provokeRecast > -5) then 
					gFunc.EquipSet(sets.Pet_Enmity); 
				end	

			end
			
			if (flashbulbTimer ~= nil) then
				flashbulbRecast = flashbulbTimer + 50  - os.time(); -- change the numerical value if your recast seems off
				if (flashbulbRecast < 5 and flashbulbRecast > -5) then 
					gFunc.EquipSet(sets.Pet_Enmity)
				end

			end
		end	
    else	
    end
	
	
    if (OD > 0)  then
		gFunc.EquipSet(sets.Overdrive);
		if (gcdisplay.GetCycle('Frame') == 'Tank') then
			gFunc.EquipSet(sets.TankOverdrive);   
		elseif (gcdisplay.GetCycle('Frame') == 'Bone') then
			gFunc.EquipSet(sets.BoneOverdrive); 	
		elseif (gcdisplay.GetCycle('Frame') == 'Turtle') then
			gFunc.EquipSet(sets.ChonkOverdrive);
		elseif (gcdisplay.GetCycle('TeamSet') == 'Tandem') then
			gFunc.EquipSet(sets.TandemOverdrive);		
		end	
		
		if (pet ~= nil) and (pet.TP > 950) and (pet.Status == 'Engaged')  then 
			if (gcdisplay.GetCycle('Frame') == 'Tank') then
				--
			elseif (gcdisplay.GetCycle('Frame') == 'Bone') then
				gFunc.EquipSet(sets.Pet_BoneCrusher);
			elseif (gcdisplay.GetCycle('Frame') == 'Turtle') then
				--
			else		
		end
		end
    end

	
	if target ~= nil then
		if (gcdisplay.GetToggle('CP') == true and target.HPP < 20) then 
			gFunc.EquipSet(gcinclude.sets.CP);
		end
	end
	
	gcinclude.CheckCommonDebuffs();

	 
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
	if (string.match(ability.Name, 'Repair')) or (string.match(ability.Name, 'Maintenance')) then
		gFunc.EquipSet(sets.Repair);
    elseif (string.contains(ability.Name, 'Maneuver')) then
        gFunc.EquipSet(sets.Maneuver);
    elseif (string.match(ability.Name, 'Ventriloquy')) then
        gFunc.EquipSet(sets.Ventriloquy);
	elseif (string.match(ability.Name, 'Tactical Switch')) then
	        gFunc.EquipSet(sets.TacticalSwitch);
	elseif (string.match(ability.Name, 'Role Reversal')) then
	        gFunc.EquipSet(sets.RoleReversal);
	elseif (string.match(ability.Name, 'Overdrive')) then
        gFunc.EquipSet(sets.Overdrive);
	elseif (ability.Name:contains('Waltz')) then
		gFunc.EquipSet(sets.Waltz);
	elseif (string.match(ability.Name, 'Provoke')) then
		gFunc.EquipSet(sets.Enmity);
	end

    gcinclude.CheckCancels();
end

local function HandlePetAction(PetAction)
	--Debug: print(chat.header('GCinclude'):append(chat.message('Automaton -- Action: ' .. PetAction.ActionType .. ', Type: ' .. PetAction.Type .. ', Name: ' .. PetAction.Name  .. ', Skill: ' .. PetAction.Skill)));
	if(PetAction.Skill == 'Elemental Magic') then
		 gFunc.EquipSet(sets.Elemental);
	elseif(PetAction.Skill == 'Enfeebling Magic') then
		gFunc.EquipSet(sets.Magic_Default);
	elseif(PetAction.Skill == 'Enhancing Magic') then
		gFunc.EquipSet(sets.Magic_Default);
	elseif(PetAction.Skill == 'Healing Magic') then
		gFunc.EquipSet(sets.Healing);
	elseif(PetAction.Skill == 'Divine Magic') then
		gFunc.EquipSet(sets.Magic_Default);
	end	 
	
end

profile.HandleItem = function()
	local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);
    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local spell = gData.GetAction();

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    end
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local canWS = gcinclude.CheckWsBailout();
	local player = gData.GetPlayer();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
		local pet = gData.GetPet();
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

        if string.match(ws.Name, 'Shijin Spiral') then
            gFunc.EquipSet(sets.Shijin_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Shijin_' .. gcdisplay.GetCycle('MeleeSet')); end
		elseif string.match(ws.Name, 'Asuran Fists') then
			gFunc.EquipSet(sets.Asuran_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Asuran_' .. gcdisplay.GetCycle('MeleeSet')); end
		elseif string.match(ws.Name, 'Victory Smite') then
			gFunc.EquipSet(sets.Victory_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Victory_' .. gcdisplay.GetCycle('MeleeSet')); end
		elseif string.match(ws.Name, 'Stringing Pummel') then
			gFunc.EquipSet(sets.Stringing_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Stringing_' .. gcdisplay.GetCycle('MeleeSet')); end
		elseif string.match(ws.Name, 'Howling Fist') then
			gFunc.EquipSet(sets.Howling_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Howling_' .. gcdisplay.GetCycle('MeleeSet')); end
			
        end
		ashitapup.checkTPBonus(ws.Name,player.TP);
		ashitapup.checkWSmods(ws.Name);
		if (gcdisplay.GetToggle('PDL') == true) then gFunc.EquipSet('PDL'); end
    end
end


return profile;