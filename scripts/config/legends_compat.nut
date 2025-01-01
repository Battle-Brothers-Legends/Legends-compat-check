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
::LegendsCompat.HardIncompat.add("mod_every_item_drops", "1.1.1");
::LegendsCompat.HardIncompat.add("mod_pauseOnView", "3");
//endregion

//region IncompatButPatched
//::LegendsCompat.SoftIncompat.add("", "");
//endregion
//region IncompatButPatched
::LegendsCompat.IncompatButPatched.add("mod_breditor", "on Legends Discord (#submod_files/Breaky's Battle Brothers Bargain Bin (BBBBB))");
::LegendsCompat.IncompatButPatched.add("mod_quickly_swap_items", "on Legends Discord... somewhere");
//endregion

//region OtherVersionCompat
::LegendsCompat.OtherVersionCompat.add("mod_plan_perks", ["5.0.0"])
//endregion
