::LegendsCompat <- {}

/** Because fuck you, that's why */
::LegendsCompat.normalizeVersion <- function (version) {
    local parts = ::split(version, ".");
    if (parts.len() == 1)
        return version + ".0.0";
    if (parts.len() == 2)
        return version + ".0";
    return version;
}

/**
 *  For hooked mods that have no patches
 *  If no version provided, we don't care checking at all, incompat means incompat
 */
::LegendsCompat.HardIncompat <- {
    List = [],
    function add(_id, _last_known_not_working_version = null) {
        this.List.push({
            ID = _id,
            Version = _last_known_not_working_version,
        })
    }
};

/**
 * For hooked mods, that technically work, but might cause some weird issues
 */
::LegendsCompat.SoftIncompat <- {
    List = [],
    function add(_id, _last_known_not_working_version = null) {
        this.List.push({
            ID = _id,
            Version = _last_known_not_working_version,
        })
    }
};

/** For hooked mods that have patches by community */
::LegendsCompat.IncompatButPatched <- {
    List = [],
    function add(_id, _where_patch, _patchModId = null) {
        this.List.push({
            ID = _id,
            Patch = _where_patch,
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
    function add(_id, _compat_versions) {
        this.List.push({
            ID = _id,
            Version = _compat_versions,
        })
    }
}

/** Just a list of integrated mods, to prevent loading them again */
::LegendsCompat.Integrated <- [
    "mod_buyback",
//    "mod_events_delayed_fix",
//    "mod_Jimmys_Tooltips",
    "mod_make_lindwurms_great_again"
]

//region HardIncompat
::LegendsCompat.HardIncompat.add("mod_AC", "1.30.33"); // Accessory Companions
::LegendsCompat.HardIncompat.add("mod_allCripplesBecomeTheKingsGuard", "1.0");
::LegendsCompat.HardIncompat.add("mod_autopilot", "23");
::LegendsCompat.HardIncompat.add("mod_background_perks", "2.5"); // Starting Perks by Background Hackflow
::LegendsCompat.HardIncompat.add("mod_brigandMercenary", "2.34");
::LegendsCompat.HardIncompat.add("mod_Chirutiru_enemies", "1"); // This entry should cover old Sellswords
::LegendsCompat.HardIncompat.add("TheEliteFewCore", "1.2");
::LegendsCompat.HardIncompat.add("mod_elite_few", "2.4.1"); // Hackflow version
::LegendsCompat.HardIncompat.add("mod_every_item_drops", "1.1.1"); // Waterplouf version 
::LegendsCompat.HardIncompat.add("mod_faster", "8");
::LegendsCompat.HardIncompat.add("mod_items_recipes", "2.0.0");
::LegendsCompat.HardIncompat.add("mod_jin", "1.0"); // Jurchen mod
::LegendsCompat.HardIncompat.add("mod_legendary_kriegsgeist_boss_location", "1.0.5"); // SSU has more updated version of this now
::LegendsCompat.HardIncompat.add("mod_more_buildings", "0.5"); 
::LegendsCompat.HardIncompat.add("mod_more_followers", "1.1");
::LegendsCompat.HardIncompat.add("mod_necro", "0.3.0"); // Hackflow's Proper Necromancer
::LegendsCompat.HardIncompat.add("mod_nggh_magic_concept", "3.0.0-beta.76"); // MC
::LegendsCompat.HardIncompat.add("mod_pauseOnView", "3");
::LegendsCompat.HardIncompat.add("mod_legends_PTR", "2.2.2"); // PTR
::LegendsCompat.HardIncompat.add("quirks", "0.8.0"); 
::LegendsCompat.HardIncompat.add("mod_Recruits", "2");
::LegendsCompat.HardIncompat.add("mod_reforged", "0.6.12");
::LegendsCompat.HardIncompat.add("mod_RevampedXPSystem", "1.0.0");
::LegendsCompat.HardIncompat.add("mod_rpgr_raids", "4.0.1");
::LegendsCompat.HardIncompat.add("mod_sellswords", "8.2.9"); // SSU
::LegendsCompat.HardIncompat.add("mod_solostart", "1.0"); 
::LegendsCompat.HardIncompat.add("mod_southernNomad", "1.0");
::LegendsCompat.HardIncompat.add("mod_standout_enemies", "1.2");
::LegendsCompat.HardIncompat.add("mod_talents_reworked", "1");
::LegendsCompat.HardIncompat.add("mod_tavern_arena", "1.0");
::LegendsCompat.HardIncompat.add("mod_true_balance", "1.8");
::LegendsCompat.HardIncompat.add("mod_warhammer", "1.0"); // old skaven mod
::LegendsCompat.HardIncompat.add("mod_wealth", "1");
::LegendsCompat.HardIncompat.add("mod_weapons", "0.27");
::LegendsCompat.HardIncompat.add("mod_wushi", "1.0"); // Samurai mod
//endregion

//region IncompatButPatched
::LegendsCompat.SoftIncompat.add("mod_camps_and_artifacts", "3.4");
::LegendsCompat.SoftIncompat.add("mod_cultists", "1.04"); // Davkul Rising
::LegendsCompat.SoftIncompat.add("mod_fantasybro", "1.0");
::LegendsCompat.SoftIncompat.add("mod_necropolis", "1.0");
::LegendsCompat.SoftIncompat.add("mod_PLHO", "0.1.1"); // Darx's Player Hideout
//endregion

//region IncompatButPatched
::LegendsCompat.IncompatButPatched.add("mod_breditor", "on Legends Discord (#submod_files/Breaky's Battle Brothers Bargain Bin (BBBBB))");
::LegendsCompat.IncompatButPatched.add("mod_quickly_swap_items", "on Legends Discord... somewhere");
//endregion

//region OtherVersionCompat
::LegendsCompat.OtherVersionCompat.add("mod_plan_perks", ["5.0.0"])
//endregion
