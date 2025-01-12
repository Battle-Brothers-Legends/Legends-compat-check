::LegendsCompat <- {}

/** Because fuck you, that's why */
::LegendsCompat.normalizeVersion <- function (_version) {
    local parts = ::split(_version, ".");
    if (parts.len() == 1)
        return _version + ".0.0";
    if (parts.len() == 2)
        return _version + ".0";
    return _version;
}

/**
 *  For hooked mods that have no patches
 *  If no version provided, we don't care checking at all, incompat means incompat
 */
::LegendsCompat.HardIncompat <- {
    List = [],
    function add(_id, _lastKnownNotWorkingVersion = null, _replacement = null) {
        this.List.push({
            ID = _id,
            Version = _lastKnownNotWorkingVersion,
            Replacement = _replacement
        })
    }
};

/**
 * For hooked mods, that technically work, but might cause some weird issues
 */
::LegendsCompat.SoftIncompat <- {
    List = [],
    function add(_id, _lastKnownNotWorkingVersion = null, _replacement = null) {
        this.List.push({
            ID = _id,
            Version = _lastKnownNotWorkingVersion,
            Replacement = _replacement
        })
    }
};

/** For hooked mods that have patches by community */
::LegendsCompat.IncompatButPatched <- {
    List = [],
    function add(_id, _wherePatch, _patchModId = null) {
        this.List.push({
            ID = _id,
            Patch = _wherePatch,
            PatchID = _patchModId
        })
    }
}

/**
 * For hooked mods, that some version is working
 * version is array
 */
::LegendsCompat.OtherVersionCompat <- {
    List = [],
    function add(_id, _compatVersions) {
        this.List.push({
            ID = _id,
            Version = _compatVersions
        })
    }
}

/**
 * For mods that are not registered, have no hooks, no IDs, but add new stuff
 */
::LegendsCompat.IncompatNotRegistered <- {
    List = [],
    function add(_name, _filesToCheck, _replacement = null) {
        this.List.push({
            ID = _name,
            Files = _filesToCheck,
            Replacement = _replacement
        })
    }
}

/** Just a list of integrated mods, to prevent loading them again */
::LegendsCompat.Integrated <- [
    "mod_buyback",
    "mod_events_delayed_fix",
    "mod_Jimmys_Tooltips",
    "mod_alwaysLootNamedItems",
    "mod_make_lindwurms_great_again",
	"mod_MINA", // More Indefinite Numeral Adjectives - a similar feature is implemented in legends
	"mod_tooltip_extension", // Rygar's perk tooltip
	"mod_turn_it_in"
]
// Abyss note: Legends mod incompatibility doc all in except for mods that did not have a modspreload / modID name
// or mods that had mutliple versions of same mod 1/3/25
//region HardIncompat
::LegendsCompat.HardIncompat.add("mod_18bros", null, "Legends has more anyway.");
::LegendsCompat.HardIncompat.add("mod_AC", "1.30.33"); // Accessory Companions
::LegendsCompat.HardIncompat.add("mod_allCripplesBecomeTheKingsGuard", "1.0");
::LegendsCompat.HardIncompat.add("and_justice_for_all", "1.4.0");
::LegendsCompat.HardIncompat.add("mod_autopilot", "23");
::LegendsCompat.HardIncompat.add("mod_auto_level", "1.1.1");
::LegendsCompat.HardIncompat.add("mod_avatar", "1.0.2");
::LegendsCompat.HardIncompat.add("mod_avgmax", "1.0"); // Average bro max stats
::LegendsCompat.HardIncompat.add("mod_backgrounds_attribute_ranges", "2.0.0");
::LegendsCompat.HardIncompat.add("mod_background_perks", "2.6"); // Starting Perks by Background Hackflow
::LegendsCompat.HardIncompat.add("battle_fatigue", "0.5.0"); 
::LegendsCompat.HardIncompat.add("mod_better_bros", "1.1.0");
::LegendsCompat.HardIncompat.add("mod_brawny_nimble", "1.0.1");
::LegendsCompat.HardIncompat.add("mod_brigandMercenary", "2.34");
::LegendsCompat.HardIncompat.add("mod_broWithRandomPerks", "1.1");
::LegendsCompat.HardIncompat.add("mod_buffed_named_items", "1.0.0"); // GinoFelino version
::LegendsCompat.HardIncompat.add("CampaignTweakster", "6");
::LegendsCompat.HardIncompat.add("mod_cartupgrade", "1.0");
::LegendsCompat.HardIncompat.add("mod_challengeScenarioPack", "1.0");
::LegendsCompat.HardIncompat.add("mod_champion_beasts", "1.2.0");
::LegendsCompat.HardIncompat.add("mod_Chirutiru_enemies", "1", "Sellswords not compaible, there's Legends version of this mod on Legends Discord"); // This entry should cover old Sellswords
::LegendsCompat.HardIncompat.add("comrades_mod", "4.3.0"); 
::LegendsCompat.HardIncompat.add("mod_desertswampSliders", "1.0"); // More map sliders
::LegendsCompat.HardIncompat.add("mod_elevation_bindings", "2"); 
::LegendsCompat.HardIncompat.add("Mod_Editable_Retinue_MSU", "3.0.3");
::LegendsCompat.HardIncompat.add("TheEliteFewCore", "1.2");
::LegendsCompat.HardIncompat.add("mod_elite_few", "2.4.1"); // Hackflow version
::LegendsCompat.HardIncompat.add("mod_enemyWithRandomPerks", "1.0"); 
::LegendsCompat.HardIncompat.add("mod_equal_stats", "1"); 
::LegendsCompat.HardIncompat.add("mod_equipment_loot_chance", "1.0.4"); 
::LegendsCompat.HardIncompat.add("mod_every_item_drops", "1.1.1"); // Waterplouf version 
::LegendsCompat.HardIncompat.add("mod_extra_keybinds", "2.1.0"); // a lot of bug reports lately with this mod... 
::LegendsCompat.HardIncompat.add("mod_faster", null, "Use Swifter instead, found on Nexus");
::LegendsCompat.HardIncompat.add("mod_fastest", null, "Use Swifter instead, found on Nexus");
::LegendsCompat.HardIncompat.add("mod_legends_favoured_enemy_refund", "2.0.1");
::LegendsCompat.HardIncompat.add("graven_passive_shield_damage_bonus", "1.0");
::LegendsCompat.HardIncompat.add("graven_plentiful_paints", "1.1");
::LegendsCompat.HardIncompat.add("mod_hackflows_perks", "1.4");
::LegendsCompat.HardIncompat.add("mod_healable_injury", "1.0");
::LegendsCompat.HardIncompat.add("Mod_Heavy_Injuries_MSU", "3.0.0");
::LegendsCompat.HardIncompat.add("mod_hireNaked", "1.0");
::LegendsCompat.HardIncompat.add("mod_hitpoint_injury", "1");
::LegendsCompat.HardIncompat.add("mod_Drakes_Improved_Ambitions", "1.4.1");
::LegendsCompat.HardIncompat.add("mod_items_recipes", "2.0.0");
::LegendsCompat.HardIncompat.add("mod_jin", "1.0"); // Jurchen mod
::LegendsCompat.HardIncompat.add("mod_lifetime_stats", "1"); 
::LegendsCompat.HardIncompat.add("mod_legendary_kriegsgeist_boss_location", "1.0.5"); // SSU has more updated version of this now
::LegendsCompat.HardIncompat.add("mod_menace", "0.03"); 
::LegendsCompat.HardIncompat.add("mod_more_buildings", "0.5"); 
::LegendsCompat.HardIncompat.add("mod_more_champions_x5");
::LegendsCompat.HardIncompat.add("mod_more_champions_x10");
::LegendsCompat.HardIncompat.add("mod_more_champions_x25");
::LegendsCompat.HardIncompat.add("mod_more_followers", "1.1");
::LegendsCompat.HardIncompat.add("mod_moreRecruits", "2");
::LegendsCompat.HardIncompat.add("mod_more_weapon_skins", "0.8.0"); // Many of Karl's skins are being integ into Legends
::LegendsCompat.HardIncompat.add("mod_necro", "0.3.0"); // Hackflow's Proper Necromancer
::LegendsCompat.HardIncompat.add("mod_nggh_magic_concept", "3.0.0-beta.76"); // MC
::LegendsCompat.HardIncompat.add("mod_no_hitcap", "1.0.0"); // "2022 edition"
::LegendsCompat.HardIncompat.add("mod_no_more_trash_named_weapons", "2"); 
::LegendsCompat.HardIncompat.add("mod_north_expansion", "0.7.2"); // Hamen's doing a Legends compat version in future let's fucking gooooo!
::LegendsCompat.HardIncompat.add("mod_origin_customizer", "2.2.4");
::LegendsCompat.HardIncompat.add("mod_pauseOnView", "3");
::LegendsCompat.HardIncompat.add("mod_legends_PTR", "2.2.2", "PTR ded, hue hue"); // PTR
::LegendsCompat.HardIncompat.add("quicker", "1.3.1", "Use Swifter instead, found on Nexus");
::LegendsCompat.HardIncompat.add("quirks", "0.8.0"); 
::LegendsCompat.HardIncompat.add("mod_raided", "1.0");
::LegendsCompat.HardIncompat.add("mod_repeatableOguTrophyAmbitions", "1.0");
::LegendsCompat.HardIncompat.add("mod_Recruits", "2");
::LegendsCompat.HardIncompat.add("mod_reforged", "0.6.12");
::LegendsCompat.HardIncompat.add("mod_RREI", "1.0.0"); // Replace and Restore Equipped Items
::LegendsCompat.HardIncompat.add("mod_rpgr_avatar_resistances", "1.5.0");
::LegendsCompat.HardIncompat.add("mod_RevampedXPSystem", "1.0.0");
::LegendsCompat.HardIncompat.add("zmod_rise_of_the_usurper", "1.0.0", "More recent Rotu vers found at Legends / Submods"); // old ass Nexus rotu version
::LegendsCompat.HardIncompat.add("mod_rpgr_raids", "4.0.1");
::LegendsCompat.HardIncompat.add("mod_save", "1.0.0"); // Enhanced Autosave
::LegendsCompat.HardIncompat.add("mod_sellswords", "8.2.9"); // SSU
::LegendsCompat.HardIncompat.add("mod_smart_recruiter_legends", "1.0"); 
::LegendsCompat.HardIncompat.add("mod_solostart", "1.0"); 
::LegendsCompat.HardIncompat.add("mod_southernNomad", "1.0");
::LegendsCompat.HardIncompat.add("mod_standout_enemies", "1.2");
::LegendsCompat.HardIncompat.add("mod_talents_reworked", "1");
::LegendsCompat.HardIncompat.add("mod_tavern_arena", "1.0");
::LegendsCompat.HardIncompat.add("mod_olto_l_temple_remove_injuries", "1.15");
::LegendsCompat.HardIncompat.add("mod_town_management", "0.1");
::LegendsCompat.HardIncompat.add("mod_true_balance", "1.8");
::LegendsCompat.HardIncompat.add("mod_two_for_one", "1.1.0");
::LegendsCompat.HardIncompat.add("mod_ultrabros", "3.3.0");
::LegendsCompat.HardIncompat.add("mod_undead_trophy_upgrade_reroll", "1.0");
::LegendsCompat.HardIncompat.add("mod_unlockFollower", "1");
::LegendsCompat.HardIncompat.add("mod_useful", "0.6");
::LegendsCompat.HardIncompat.add("mod_vap", "2.1.0"); // Veteran Attrs and Perks
::LegendsCompat.HardIncompat.add("mod_veteran_attributes", "2.0.0");
::LegendsCompat.HardIncompat.add("mod_veteranStamina", "4");
::LegendsCompat.HardIncompat.add("mod_warhammer", "1.0"); // old skaven mod
::LegendsCompat.HardIncompat.add("mod_wealth", "1");
::LegendsCompat.HardIncompat.add("mod_weapons", "0.27");
::LegendsCompat.HardIncompat.add("mod_world_parameters", "1.0.1");
::LegendsCompat.HardIncompat.add("mod_wushi", "1.0"); // Samurai mod
::LegendsCompat.HardIncompat.add("mod_new_named_weapons", "1.0"); // Zythaer's Better Weapons
//endregion

//region SoftIncompat
::LegendsCompat.SoftIncompat.add("mod_BLPT", "0.1.2"); // Darx's Bad Luck Protection
::LegendsCompat.SoftIncompat.add("mod_bro_storage", "1.0.2"); 
::LegendsCompat.SoftIncompat.add("mod_camps_and_artifacts", "3.4");
::LegendsCompat.SoftIncompat.add("mod_career_stats", "1.0.2");
::LegendsCompat.SoftIncompat.add("mod_cultists", "1.04"); // Davkul Rising
::LegendsCompat.SoftIncompat.add("mod_fantasybro", "1.0");
::LegendsCompat.SoftIncompat.add("mod_fun_facts", "0.5.0");
::LegendsCompat.SoftIncompat.add("mod_find_legendary_locations", "1", "Use Chopek's Find Legendary Maps instead, at Legends / Submods");
::LegendsCompat.SoftIncompat.add("mod_necropolis", "1.0");
::LegendsCompat.SoftIncompat.add("mod_PLHO", "0.1.1"); // Darx's Player Hideout
::LegendsCompat.SoftIncompat.add("mod_retinue_ups", "1.1"); // Hackflow's Retinue Promotions
::LegendsCompat.SoftIncompat.add("mod_SAF", "1.0.0"); // Darx's Stackable Arena Fights
::LegendsCompat.SoftIncompat.add("mod_streamlined_ui", "1.0.3"); 
::LegendsCompat.SoftIncompat.add("mod_URUI", "1.2.0"); // Unrecognized UI
//endregion

//region IncompatButPatched
::LegendsCompat.IncompatButPatched.add("mod_breditor", "on Legends Discord (#submod_files/Breaky's Battle Brothers Bargain Bin (BBBBB))");
::LegendsCompat.IncompatButPatched.add("mod_quickly_swap_items", "on Legends Discord (#submod_files/Breaky's Battle Brothers Bargain Bin (BBBBB))");
//endregion

//region OtherVersionCompat
::LegendsCompat.OtherVersionCompat.add("mod_plan_perks", ["5.0.0"])
//endregion

//region IncompatNotRegistered
::LegendsCompat.IncompatNotRegistered.add("mod_anatomists", [ // Anatomist Origin Rework
"scripts/retinue/followers/remedist_follower.nut",
"scripts/items/misc/essence_honor_guard_potion_item.nut",
"scripts/items/misc/essence_geist_potion_item.nut"
]); // Anatomist Origin Rework
::LegendsCompat.IncompatNotRegistered.add("mod_auto_recover", [
"scripts/!mods_preload/mod_auto_recover.nut"
]); // Auto Recover
::LegendsCompat.IncompatNotRegistered.add("mod_rule_101_formations", [
"scripts/config/z_mods_rule_000.nut",
"scripts/config/z_mods_rule_000_formations.nut"
]); // Company Formations and all variations
::LegendsCompat.IncompatNotRegistered.add("mod_pots", [
"scripts/entity/tactical/enemies/pot.nut",
"scripts/config/mod_pots.nut"
]); // Cracking Pots Minigame in Arena
::LegendsCompat.IncompatNotRegistered.add("dual_wielding", [
"scripts/crafting/blueprints/flail_dw_blueprint.nut",
"scripts/crafting/blueprints/heavy_southern_mace_dw_blueprint.nut",
"scripts/crafting/blueprints/rondel_dagger_dw_blueprint.nut",
]); // Dual Wielding
::LegendsCompat.IncompatNotRegistered.add("mod.elves.dwarves", [
"scripts/skills/backgrounds/dwarf_background.nut",
"scripts/skills/backgrounds/elf_background.nut"
]); // Elves and Dwarves
::LegendsCompat.IncompatNotRegistered.add("Enclave's more Armour and Weapons for Legends", [
"Enclave Armor Mod/data/scripts/items/helmets/kettle_sallet_1.nut",
"Enclave Armor Mod/data/scripts/items/helmets/kettle_sallet_2.nut",
"Enclave Armor Mod/data/scripts/items/helmets/kettle_sallet_3.nut"
]); //Enclave's more Armour and Weapons
::LegendsCompat.IncompatNotRegistered.add("Extra_Starting_Scenarios", [
"scripts/scenarios/world/barbarians_scenario.nut",
"scripts/scenarios/world/pros_scenario.nut",
"scripts/scenarios/world/vaegirs_scenario.nut"
]); //Extra Starting Scenarios
::LegendsCompat.IncompatNotRegistered.add("z_artifacts_and_camps", [
"scripts/skills/traits/preternatural_dodge_trait.nut",
"scripts/skills/traits/bonus_stam_regen_trait.nut",
"scripts/items/armor_upgrades/litany_of_speed.nut",
"scripts/items/armor/artifact/artifact_armor.nut"
]); //Expanded Camps and Artifacts
::LegendsCompat.IncompatNotRegistered.add("mod_fencer", [
"scripts/!mods_preload/mod_fencer.nut",
"scripts/skills/actives/rush.nut"
]); // Fencer New Skill
::LegendsCompat.IncompatNotRegistered.add("mod_find_legendary_locations", [
"scripts/!mods_preload/mod_find_legendary_locations.nut"
], "similar functionality in submod, on Legends Discord (#submod_files/Find Legendary Maps)"); // Find Grotesque Tree
::LegendsCompat.IncompatNotRegistered.add("Gender Scenarios", [
"scripts/events/events/scenario/legend_gendered_seer_intro_event.nut",
"scripts/events/events/scenario/legend_vala_mid_intro_event.nut",
"scripts/scenarios/world/legends_gendered_seer_scenario.nut"
], "It's integrated into Legends"); // Gender Scenarios Legends
::LegendsCompat.IncompatNotRegistered.add("Graverobbers-start", [
"scripts/events/events/scenario/graverobbers_intro_event.nut",
"scripts/scenarios/world/graverobbers_scenario.nut"
]); // Graverobbers Origin
::LegendsCompat.IncompatNotRegistered.add("zzz_mod_zzz_delz_houndmasterbgplus", [
"scripts/items/accessory/accessory_dog.nut",
"scripts/skills/actives/legend_unleash_warbear.nut",
"scripts/skills/actives/unleash_animal.nut",
"scripts/crafting/blueprints/wolf1_blueprint.nut"
]); // Houndmaster Class Perk Buff
::LegendsCompat.IncompatNotRegistered.add("mod_leaders_origins", [
"scripts/scenarios/world/serpent_scenario.nut",
"scripts/scenarios/world/shepherd_scenario.nut",
"scripts/scenarios/world/stalker_scenario.nut",
"scripts/scenarios/world/veteran_scenario.nut",
"scripts/skills/backgrounds/order_knight_background.nut"
]); // Leaders
::LegendsCompat.IncompatNotRegistered.add("mod_oard", [
"scripts/!mods_preload/mod_tohru_hooks.nut",
"scripts/ai/tactical/agents/tohru_agent.nut",
"scripts/mapgen/templates/tactical/tactical_hoard.nut"
]); //Legendary Location the Hoard
::LegendsCompat.IncompatNotRegistered.add("mod_spear", [
"scripts/skills/actives/call_back.nut",
"scripts/skills/actives/penetration.nut",
"scripts/config/mod_spear.nut",
"scripts/items/weapons/legendary/longinus_spear.nut"
]); // Legendary Spear
::LegendsCompat.IncompatNotRegistered.add("Lone Chosen", [
"scripts/skills/traits/hel_chosen_trait.nut",
"scripts/skills/traits/soul_erased_trait.nut",
"scripts/skills/traits/thor_chosen_trait.nut"
]); //Lone Chosen
::LegendsCompat.IncompatNotRegistered.add("mod_Lute_battle_song_skill", [
"scripts/skills/actives/battle_song_skill.nut",
"scripts/skills/effects/battle_song_effect.nut"
]); // Lute New Skill
::LegendsCompat.IncompatNotRegistered.add("Mercenary and Brigands Mod", [
"scripts/skills/perks/perk_verytough.nut",
"scripts/skills/perks/perk_veteran.nut",
"scripts/skills/perks/perk_veteran2.nut",
"scripts/skills/racial/brigands_racial.nut"
]); // Mercenary and Brigands Mod
::LegendsCompat.IncompatNotRegistered.add("mod_Universal_Helmets_2.0_Khtulhu", [
"scripts/items/helmets/named/ahnenerbe_helmet.nut",
"scripts/events/events/AI_vs_AI.nut",
"scripts/!mods_preload/!mod_additional_equipment.nut"
]); // Mod Universal Helmets
::LegendsCompat.IncompatNotRegistered.add("1.2.3, more ammos mod", [
"scripts/!mods_preload/mod_legendary_arrow.nut",
"scripts/!mods_preload/mod_powders.nut",
"scripts/items/ammo/magic_powder_bag.nut",
"scripts/items/ammo/effective_powder_bag.nut",
"scripts/!mods_preload/mod_ammos.nut"
]); // More Ammos
::LegendsCompat.IncompatNotRegistered.add("mod_more_champions", [
"scripts/!mods_preload/mod_morechampions.nut"
]); // mod_more_champions
::LegendsCompat.IncompatNotRegistered.add("Mod_Morecrafting", [
"scripts/crafting/blueprints/heraldic_plates_upgrade_blueprint.nut",
"scripts/crafting/blueprints/joint_cover_upgrade_blueprint.nut",
"scripts/crafting/blueprints/leather_neckguard_upgrade_blueprint.nut"
]); // More Crafting
::LegendsCompat.IncompatNotRegistered.add("mod_more_scaling_100", [
"scripts/!mods_preload/mod_more_scaling_100.nut"
]); // More Scaling
::LegendsCompat.IncompatNotRegistered.add("mod_more_scaling_200", [
"scripts/!mods_preload/mod_more_scaling_200.nut"
]); // More Scaling
::LegendsCompat.IncompatNotRegistered.add("mod_more_scaling_5", [
"scripts/!mods_preload/mod_more_scaling_5.nut"
]); // More Scaling
::LegendsCompat.IncompatNotRegistered.add("z_mod_OrcWarlords_named_2h_orc_axe_flail", [
"scripts/!mods_preload/z_orc_2h_named.nut",
"scripts/items/weapons/named/named_two_handed_orc_axe.nut",
"scripts/items/weapons/named/named_two_handed_orc_flail.nut"
]); // Named Two Handed Orc Axe, Flail Stand Alone
::LegendsCompat.IncompatNotRegistered.add("Olto Mod", [
"scripts/crafting/blueprints/armor_h_20_blueprint.nut",
"scripts/crafting/blueprints/armor_h_30_blueprint.nut",
"scripts/crafting/blueprints/armor_h_320_blueprint.nut"
]); // OltoMod Test
::LegendsCompat.IncompatNotRegistered.add("WotN Perks", [
"scripts/skills/perks/perk_last_stand.nut",
"scripts/skills/perks/perk_lookout.nut",
"scripts/skills/perks/perk_rebound.nut"
]); // Perks for Warriors of the North
::LegendsCompat.IncompatNotRegistered.add("Purchasable Perks", [
"scripts/!mods_preload/store_add.nut",
"scripts/items/bags_belt.nut",
"scripts/items/book_cooking.nut"
]); // Purchasable Perks (legends)
::LegendsCompat.IncompatNotRegistered.add("sato_expanded_scenarios", [
"scripts/!mods_preload/mod_sato_expanded_scenarios.nut",
"scripts/scenarios/tactical/scenario_sato_barbarians.nut",
"scripts/scenarios/tactical/scenario_sato_gilded.nut"
]); // Sato’s Expanded Scenarios
::LegendsCompat.IncompatNotRegistered.add("sato_established_company", [
"scripts/events/events/scenario/sato_established_company_intro_event.nut",
"scripts/scenarios/world/sato_established_company_scenario.nut"
]); // Sato’s Established Company Origin
::LegendsCompat.IncompatNotRegistered.add("sato_additional_equipment", [
"scripts/!mods_preload/!mod_additional_equipment.nut",
"scripts/items/helmets/closed_conic_helmet.nut",
"scripts/items/helmets/closed_conic_helmet_with_mail.nut"
]); // Sato’s Additional Equipment
::LegendsCompat.IncompatNotRegistered.add("Sons of Spandau", [
"scripts/events/events/scenario/spandau_intro_event.nut",
"scripts/scenarios/world/spandau_scenario.nut"
]); // Sons of Spandau
::LegendsCompat.IncompatNotRegistered.add("TheTrials", [
"scripts/config/spawnlist_trials.nut",
"scripts/events/events/triala.nut",
"scripts/events/events/trialb.nut"
]); // The Battle Trials
::LegendsCompat.IncompatNotRegistered.add("The last Paladin", [
"scripts/events/events/scenario/last_paladin_intro_event.nut",
"scripts/scenarios/world/last_paladin_scenario.nut",
"scripts/skills/backgrounds/paladin22_background.nut",
"scripts/skills/perks/perk_warrior_of_the_light.nut"
]); // The last Paladin
::LegendsCompat.IncompatNotRegistered.add("mod_totemer", [
"scripts/config/mod_totem.nut",
"scripts/skills/backgrounds/totemer_background.nut",
"scripts/items/weapons/totem_staff.nut"
]); // Totemer Origin
::LegendsCompat.IncompatNotRegistered.add("Nectomancy", [
"scripts/config/x_more_perks.nut",
"scripts/skills/actives/necromancy.nut",
"scripts/skills/perks/perk_necromancy.nut"
]); // True Necromancy
::LegendsCompat.IncompatNotRegistered.add("", [
"",
"",
""
]); //
::LegendsCompat.IncompatNotRegistered.add("", [
"",
"",
""
]); //





::LegendsCompat.IncompatNotRegistered.add("mod_fallen_order", [
"scripts/crafting/blueprints/order_kite_shield_blueprint2.nut",
"scripts/crafting/blueprints/order_heater_shield_blueprint2.nut",
"scripts/crafting/blueprints/order_holy_water_blueprint2.nut"
]); // UNFINISHED Fallen Order origin
::LegendsCompat.IncompatNotRegistered.add("witcher_mod", [
"scripts/skills/actives/gryphon_style.nut",
"scripts/skills/actives/igni_skill.nut",
"scripts/skills/actives/quen_skill.nut"
]); // Witcher Mod Revamp
::LegendsCompat.IncompatNotRegistered.add("witcher_mod PTR", [
"scripts/skills/effects/willow_potion_effect.nut",
"scripts/skills/effects/yrden_effect.nut",
"scripts/skills/traits/sign_trait.nut"
]); // Witcher Mod Revamp
//endregion

//region TNF
::LegendsCompat.HardIncompat.add("tnf_allPoleAP");
::LegendsCompat.IncompatNotRegistered.add("tnf_17FatigueNimble", ["scripts/!mods_preload/tnf_17FatigueNimble.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_allRecipes", ["scripts/!mods_preload/tnf_allRecipes.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_ammoThrowSpear", ["scripts/!mods_preload/tnf_ammoThrowSpear.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_betterEagleEyes", ["scripts/!mods_preload/tnf_betterEagleEyes.nut"]);
::LegendsCompat.HardIncompat.add("tnf_discoverLocations");
::LegendsCompat.HardIncompat.add("tnf_expandedRetinue");
::LegendsCompat.HardIncompat.add("tnf_fixAmbitionUpdate");
::LegendsCompat.IncompatNotRegistered.add("tnf_fixKrakenQuests", ["scripts/!mods_preload/tnf_fixKrakenQuests.nut"]);
::LegendsCompat.HardIncompat.add("tnf_greenskinsNamedWeapons");
::LegendsCompat.HardIncompat.add("tnf_higherDifficulty");
::LegendsCompat.IncompatNotRegistered.add("tnf_keepCrusaderOrcSlayer", ["scripts/!mods_preload/tnf_keepCrusaderOrcSlayer.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_lessLawmen", ["scripts/!mods_preload/tnf_lessLawmen.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_lessTiny", ["scripts/!mods_preload/tnf_lessTiny.nut"]);
::LegendsCompat.HardIncompat.add("tnf_mdfTalent1HCompanion");
::LegendsCompat.HardIncompat.add("tnf_modRNG");
::LegendsCompat.IncompatNotRegistered.add("tnf_moreMilitia", ["scripts/!mods_preload/tnf_moreMilitia.nut"]);
::LegendsCompat.HardIncompat.add("tnf_namedShields");
::LegendsCompat.HardIncompat.add("tnf_newChampions");
::LegendsCompat.HardIncompat.add("tnf_noBadTraitsCompanions");
::LegendsCompat.IncompatNotRegistered.add("tnf_noFog", ["scripts/!mods_preload/tnf_noFog.nut"]);
::LegendsCompat.HardIncompat.add("tnf_noSwallowIndomitable");
::LegendsCompat.HardIncompat.add("tnf_oldNorseHelmet");
::LegendsCompat.HardIncompat.add("tnf_refillableNet");
::LegendsCompat.IncompatNotRegistered.add("tnf_rejects", ["scripts/!mods_preload/tnf_rejects.nut"]);
::LegendsCompat.HardIncompat.add("tnf_resistFXResilient");
::LegendsCompat.IncompatNotRegistered.add("tnf_resolveConfident", ["scripts/!mods_preload/tnf_resolveConfident.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_restoreTailorEvent", ["scripts/!mods_preload/tnf_restoreTailorEvent.nut"]);
::LegendsCompat.HardIncompat.add("tnf_revisedNamedItems");
::LegendsCompat.IncompatNotRegistered.add("tnf_seedAnalyzer", ["scripts/!mods_preload/tnf_seedAnalyzer.nut"]);
::LegendsCompat.HardIncompat.add("tnf_seeNamedItems");
::LegendsCompat.HardIncompat.add("tnf_survivorNineLives");
::LegendsCompat.IncompatNotRegistered.add("tnf_triesBowyer", ["scripts/!mods_preload/tnf_triesBowyer.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_trueNightOwl", ["scripts/!mods_preload/tnf_trueNightOwl.nut"]);
::LegendsCompat.IncompatNotRegistered.add("tnf_tryout", ["scripts/!mods_preload/tnf_tryout.nut"]);
//endregion

idk about these:
//Brothers WoW
//Dark Age
//Dark Brotherhood Company
//Elite Few - Master Bros (Updated by Hackflow)
//Expanded Tavern Rumours
//Free Company Start
//Mod Weapons
//Names Slings and Staves
//Named Item Perks
//Pain from Injuries Mod
//Q’s Matchlocks
//The Sidekick
