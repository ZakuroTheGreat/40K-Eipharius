/datum/job/guardsman
	title = "Guardsman"
	supervisors = "the Commissar and your Sergeant."
	total_positions = 20
	spawn_positions = 20
	social_class = SOCIAL_CLASS_MED //Guards are at least pretty respected in imperial society
	outfit_type = /decl/hierarchy/outfit/job/guardsman //will need to be replaced eventually - wel
	alt_titles = list(
		"Catachan Jungle Fighter" = /decl/hierarchy/outfit/job/guardsman/catachan,
		"Death Korps of Krieg" = /decl/hierarchy/outfit/job/guardsman/krieg,
		"Valhallan Ice Warrior" = /decl/hierarchy/outfit/job/guardsman/valhallan
		)
	selection_color = "#33813A"
	department_flag = SEC
	open_when_dead = TRUE
	announced = FALSE
	can_be_in_squad = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
		access_all_personal_lockers, access_maint_tunnels, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_armory
		)
	auto_rifle_skill = 6
	semi_rifle_skill = 6
	sniper_skill = 6
	shotgun_skill = 6
	lmg_skill = 6
	smg_skill = 6
	melee_skill = 6
	ranged_skill = 6
	medical_skill = 3
	engineering_skill = 1
	surgery_skill = 1

/datum/job/guardsman/equip(var/mob/living/carbon/human/H, alt_title)
	H.warfare_faction = IMPERIUM
	..()
	H.add_stats(rand(12,16), rand(12,16), rand(12,16), rand (10,13))
	H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
	SSwarfare.red.team += H
	if(can_be_in_squad)
		H.assign_random_squad(IMPERIUM) //This should handle giving Guardsmen their radio headsets.
	if(title == "Krieg Guardsman")
		var/troopnum = rand(1,50000)
		H.fully_replace_character_name("Guardsman [troopnum]")
	else
		H.fully_replace_character_name("Guardsman [H.real_name]")
	H.assign_random_quirk()
	H.witchblood()
	H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
	to_chat(H, "<span class='notice'><b><font size=3>You are a soldier of the Imperium. Obey your Sergeant and Commissar. The Emperor Protects. </font></b></span>")
	H.verbs += list(
	/mob/living/carbon/human/proc/khorne,
	/mob/living/carbon/human/proc/nurgle,
	/mob/living/carbon/human/proc/slaanesh,
	/mob/living/carbon/human/proc/tzeentch
	)

// Sergeant

/datum/job/sergeant
	title = "Sergeant"
	supervisors = "the Commissar"
	total_positions = 2
	spawn_positions = 2
	selection_color = "#33813A"
	social_class = SOCIAL_CLASS_MED
	outfit_type = /decl/hierarchy/outfit/job/sergeant
	alt_titles = list(
		"Catachan Sergeant" = /decl/hierarchy/outfit/job/sergeant/catachan,
		"Krieg Watchmaster" = /decl/hierarchy/outfit/job/sergeant/krieg,
		"Valhallan Sergeant" = /decl/hierarchy/outfit/job/sergeant/valhallan
		)
	can_be_in_squad = FALSE //They have snowflake shit for squads.
	department_flag = SEC
	open_when_dead = TRUE
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory
			)
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	melee_skill = 7
	ranged_skill = 7
	medical_skill = 4
	engineering_skill = 1
	surgery_skill = 1
	announced = FALSE
/datum/job/sergeant/equip(var/mob/living/carbon/human/H, alt_title)
	var/current_name = H.real_name
	..()
	H.verbs += /mob/living/carbon/human/proc/morale_boost
	H.set_trait(new/datum/trait/death_tolerant())
	H.add_stats(rand(14,17), rand(14,16), rand(14,16), rand(12,13))
	H.assign_random_quirk()
	H.witchblood()
	H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
	H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_guard_armory, access_armory)
	H.assign_squad_leader(IMPERIUM)
	H.warfare_faction = IMPERIUM
	if(title == "Krieg Watchmaster")
		var/troopnum = rand(1,50000)
		H.fully_replace_character_name("Watchmaster [troopnum]")
	else
		H.fully_replace_character_name("Sergeant [current_name]")
	to_chat(H, "<span class='notice'><b><font size=3>You are a Sergeant of the Imperial Guard. Round up some guardsmen and construct your own squad. You are to be a beacon of discipline and order amongst your men, let your behavior reflect this.</font></b></span>")
	H.verbs += list(
	/mob/living/carbon/human/proc/khorne,
	/mob/living/carbon/human/proc/nurgle,
	/mob/living/carbon/human/proc/slaanesh,
	/mob/living/carbon/human/proc/tzeentch
	)

// Commissar

/datum/job/ig/commissar
	title = "Commissar"
	supervisors = "the Rogue Trader"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#004e07"
	req_admin_notify = TRUE
	social_class = SOCIAL_CLASS_HIGH
	outfit_type = /decl/hierarchy/outfit/job/ig/commissar
	alt_titles = list(
		"Krieg Commissar" = /decl/hierarchy/outfit/job/ig/commissar/krieg,
		"Catachan Commissar" = /decl/hierarchy/outfit/job/ig/commissar/catachan
		)
	can_be_in_squad = FALSE
	open_when_dead = FALSE
	department_flag = COM|SEC
	latejoin_at_spawnpoints = TRUE
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	melee_skill = 8
	ranged_skill = 8
	medical_skill = 1
	engineering_skill = 1
	surgery_skill = 0
	announced = FALSE
/datum/job/ig/commissar/equip(var/mob/living/carbon/human/H)
	var/current_name = H.real_name
	..()
	H.fully_replace_character_name("Commissar [current_name]")
	H.set_trait(new/datum/trait/death_tolerant())
	H.add_stats(rand(12,16), rand(12,16), rand(12,16), rand(14,16))
	H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
	H.get_idcard()?.access = get_all_accesses()
	H.warfare_faction = IMPERIUM
	to_chat(H, "<span class='notice'><b><font size=3>You are an Imperial Commissar. You are the acting head of the Guard force on this planet. The mission is all, maintain morale and maintain discipline. Do not be afraid to execute an unruly guardsmen. </font></b></span>")
	var/obj/O = H.get_equipped_item(slot_s_store)
	if(O)
		qdel(O)
	H.verbs += list(
		/mob/living/carbon/human/proc/help_me,
		/mob/living/carbon/human/proc/retreat,
		/mob/living/carbon/human/proc/announce,
		/mob/living/carbon/human/proc/give_order,
		/mob/living/carbon/human/proc/check_reinforcements
	)

// Enforcer

/datum/job/ig/enforcer
	title = "Magistratum Enforcer"
	supervisors = "the Village Administrator and the Rogue Trader"
	total_positions = 4
	spawn_positions = 4 //may need more than 2 idk
	social_class = SOCIAL_CLASS_MED
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/ig/enforcer
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 5
	medical_skill = 2
	engineering_skill = 1
	surgery_skill = 1
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	latejoin_at_spawnpoints = TRUE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			access_all_personal_lockers, access_maint_tunnels)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels
			)
	announced = FALSE
/datum/job/ig/enforcer/equip(var/mob/living/carbon/human/H)
	var/current_name = H.real_name
	..()
	H.fully_replace_character_name("Enforcer [current_name]")
	H.add_stats(rand(13,17), rand(13,17), rand(14,17), rand(12,15)) //meant to be a brute keeping the plebs in line
	H.assign_random_quirk()
	H.witchblood()
	H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
	H.warfare_faction = IMPERIUM
	H.get_idcard()?.access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels)
	H.verbs += list(
	/mob/living/carbon/human/proc/khorne,
	/mob/living/carbon/human/proc/nurgle,
	/mob/living/carbon/human/proc/slaanesh,
	/mob/living/carbon/human/proc/tzeentch)

	to_chat(H, "<span class='notice'><b><font size=3>You are a proud officer of the Planetary Magistratum, your duty is to uphold outpost law on this planet amongst the civilians. You are not to meddle in Guard duties lest absolutely necessary, focus your effort on maintaining the peace/order in the shanty town north of the outpost.</font></b></span>")

// Tau

/decl/hierarchy/outfit/job/tau
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/jackboots
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null

/decl/hierarchy/outfit/job/kroot
	uniform = /obj/item/clothing/under/rank/kroot
	shoes = /obj/item/clothing/shoes/krootfeet
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare/kroot
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/ammo_magazine/kroot = 2,)

// Jeanstealer

/decl/hierarchy/outfit/job/genestealer //really just for walking sounds
	uniform = null
	shoes = /obj/item/clothing/shoes/genestealerfeet
	neck = null
	back = null
	l_ear = /obj/item/device/radio/headset/hivemind
	belt = null
	l_pocket = null
	id = null
	id_slot = null
	pda_slot = null

// Ork

/decl/hierarchy/outfit/job/ork
	shoes = /obj/item/clothing/shoes/orkboots
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare/kroot
	l_ear = /obj/item/device/radio/headset/blue_team/all
	belt = /obj/item/device/flashlight/lantern
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/ammo_magazine/ork/shoota = 2, /obj/item/melee/classic_baton/trench_club = 1,)
/decl/hierarchy/outfit/job/ork/equip()
	if(prob(50))
		uniform = /obj/item/clothing/under/rank/ork
		suit = /obj/item/clothing/suit/armor/orkarmor
		l_pocket = /obj/item/storage/box/ifak
		head = /obj/item/clothing/head/helmet/orkhelmet
	else if(25)
		uniform = /obj/item/clothing/under/rank/ork/three
		suit = /obj/item/clothing/suit/armor/orkarmor/two
		head = /obj/item/clothing/head/helmet/orkhelmet/three
		l_pocket = /obj/item/storage/box/ifak
	else if(25)
		uniform = /obj/item/clothing/under/rank/ork/two
		suit = /obj/item/clothing/suit/armor/orkarmor/two
		head = /obj/item/clothing/head/helmet/orkhelmet/two
		l_pocket = /obj/item/storage/box/ifak
	..()

// Beep boop i'm Mechanicus retard

//Skitarii
/decl/hierarchy/outfit/job/skitarii
	uniform = /obj/item/clothing/under/rank/skitarii
	suit = /obj/item/clothing/suit/storage/hooded/skitarii
	shoes = /obj/item/clothing/shoes/skitshoes
	neck = /obj/item/reagent_containers/food/drinks/canteen
	back = /obj/item/storage/backpack/satchel/warfare
	l_ear = /obj/item/device/radio/headset/red_team
	belt = /obj/item/device/flashlight/lantern
	l_pocket = /obj/item/storage/box/ifak
	id = null
	id_slot = null
	pda_slot = null
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/warfare/rat = 1,)

// Arbites

/*datum/job/ig/impguard
	title = "Adeptus Arbites"
	total_positions = 1
	social_class = SOCIAL_CLASS_MIN
	outfit_type = /decl/hierarchy/outfit/job/redsoldier/sentry
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 5
	medical_skill = 2
	engineering_skill = 1
	surgery_skill = 1
	can_be_in_squad = FALSE
	open_when_dead = TRUE
	department_flag = SEC
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Arbites [current_name]")
		H.add_stats(18, rand(10,16), rand(15,18))
		H.say(";Arbites reporting for duty!")
*/
