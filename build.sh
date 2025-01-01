extractVersion() {
    local file="scripts/!mods_preload/mod_legends_compat.nut"
    echo "$(grep -oP 'Version = "\K[0-9]+\.[0-9]+\.[0-9]+' "$file")"
}

artifactNameMod() {
  echo "mod_legends_compat_check-$(extractVersion).zip"
}

zip_archive=$(artifactNameMod)

7z a -tzip "$zip_archive" scripts