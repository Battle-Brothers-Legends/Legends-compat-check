::LegendsCompatMod <- {
	ID = "mod_legends_compat",
	Name = "Legends Compat Check",
	Version = "0.1.0",
	Hooks = null
}

local mod = ::Hooks.register(::LegendsCompatMod.ID, ::LegendsCompatMod.Version, ::LegendsCompatMod.Name);
::LegendsCompatMod.Hooks = mod;

mod.require("mod_msu >= 1.6.0", "mod_legends >= 19.0.0");

mod.queue(">mod_legends", function() {
	::LegendsCompat.Mod <- ::MSU.Class.Mod(::LegendsCompatMod.ID, ::LegendsCompatMod.Version, ::LegendsCompatMod.Name);
	::LegendsCompat.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Battle-Brothers-Legends/Legends-compat-check");
	::LegendsCompat.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	foreach(mod in ::LegendsCompat.HardIncompat.List) {
		if (::Hooks.hasMod(mod.ID)) {
			local name = ::Hooks.getMod(mod.ID).Name;
			local modVersion = ::LegendsCompat.normalizeVersion(::Hooks.getMod(mod.ID).getVersion().tostring());
			local text = ::format("%s(%s)<br>is NOT compatible and will crash your game.", name, mod.ID);
			if (mod.Version != null) {
				local knownVersion = ::LegendsCompat.normalizeVersion(mod.Version);
				if (::MSU.SemVer.compare(::MSU.SemVer.getTable(modVersion), ::MSU.SemVer.getTable(knownVersion)) > 0)
					text += "<br>However, your version is newer than one we confirmed not working, it might work, but there's no guarantee."
			}
			::LegendsCompat.Mod.Debug.addPopupMessage(text, ::MSU.Popup.State.Full);
		}
	}

	foreach (mod in ::LegendsCompat.IncompatNotRegistered.List) {
		local files = mod.Files;
		local name = mod.ID;
		local foundFiles = 0;
		foreach (file in files) {
			local lastSlash = file.find("/");
			local index = lastSlash;
			while (index != null) {
				lastSlash = index;
				index = file.find("/", lastSlash + 1);
			}

			local expectedScript = ::split(file, ".")[0];
			local scriptFiles = this.IO.enumerateFiles(file.slice(0, lastSlash));
			foreach(scriptFile in scriptFiles) {
				if (expectedScript == scriptFile) {
					foundFiles++;
					break;
				}
			}
		}

		if (foundFiles != 0 && foundFiles == files.len()) {
			local text = ::format("%s<br>is NOT compatible and will crash your game.", name);
			::LegendsCompat.Mod.Debug.addPopupMessage(text, ::MSU.Popup.State.Full);
		}
	}

	foreach(mod in ::LegendsCompat.SoftIncompat.List) {
		if (::Hooks.hasMod(mod.ID)) {
			local name = ::Hooks.getMod(mod.ID).Name;
			local modVersion = ::LegendsCompat.normalizeVersion(::Hooks.getMod(mod.ID).getVersion().tostring());
			local text = ::format("%s(%s)<br>is compatible but might cause weird issues, use at your own risk.", name, mod.ID);
			if (mod.Version != null) {
				local knownVersion = ::LegendsCompat.normalizeVersion(mod.Version);
				if (::MSU.SemVer.compare(::MSU.SemVer.getTable(modVersion), ::MSU.SemVer.getTable(knownVersion)) > 0)
					text += "<br>However, your version is newer than one we confirmed not working, it might work, but there's no guarantee."
			}
			::LegendsCompat.Mod.Debug.addPopupMessage(text, ::MSU.Popup.State.Full);
		}
	}

	foreach(mod in ::LegendsCompat.IncompatButPatched.List) {
		if (::Hooks.hasMod(mod.ID)) {
			local hasPatch = mod.PatchID != null && ::Hooks.hasMod(mod.PatchID);
			if (hasPatch)
				continue;

			local name = ::Hooks.getMod(mod.ID).Name;
			local text = ::format("%s(%s)<br>is NOT compatible, but has patch %s", name, mod.ID, mod.Patch);
			::LegendsCompat.Mod.Debug.addPopupMessage(text, ::MSU.Popup.State.Full);
		}
	}

	foreach (mod in ::LegendsCompat.OtherVersionCompat.List) {
		if (::Hooks.hasMod(mod.ID)) {
			local version = ::LegendsCompat.normalizeVersion(::Hooks.getMod(mod.ID).getVersion().tostring());
			local isVersionCompat = false;
			foreach(v in mod.Version) {
				local knownVersion = ::LegendsCompat.normalizeVersion(v);
				if (::MSU.SemVer.compare(::MSU.SemVer.getTable(knownVersion), ::MSU.SemVer.getTable(version)) == 0) {
					isVersionCompat = true;
					break;
				}
			}
			if (isVersionCompat)
				continue;

			local name = ::Hooks.getMod(mod.ID).Name;
			local text = ::format("%s(%s)<br>is NOT compatible, but has different version(s) that might work, check ", name, mod.ID);
			foreach (version in mod.Version) {
				text += version + ",";
			}
			::LegendsCompat.Mod.Debug.addPopupMessage(text, ::MSU.Popup.State.Full);
		}
	}

	foreach (mod in ::LegendsCompat.Integrated) {
		if (::Hooks.hasMod(mod)) {
			::LegendsCompat.Mod.Debug.addPopupMessage(::format("%s is integrated into Legends, please remove it.", mod), ::MSU.Popup.State.Full);
		}
	}
});
