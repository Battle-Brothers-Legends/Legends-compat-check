## [ Download Latest Version here](./releases/latest_build)


## Legends Mod Compatibility

Mod compatibility in the BB Modding community is an ever evolving one with new submods constantly being made and many are poorly documented leaving the player wondering what exactly is the mod not compatible with and why. 

I will try to explain the situation here with the general theories of mod compatibility and then break it down to individual mods. 

In Legends discord there already exist good guides (by typing !install) and this seeks to expand and build on those with a comprehensive individual mod listing.

## [Legends Discord](https://discord.gg/BRtptetwKS)

## Mod Install Guide
To install mods for Battle Brothers, place the downloaded .zip file into your Battle Brothers "data" folder. That's all! **Do not extract the .zip** file. 

If you own Battle Brothers through Steam, you can find this folder by right-clicking Battle Brothers in Steam, selecting Manage, then Browse Local Files.

If you own Battle Brothers through GoG, you must navigate to the folder where you installed Battle Brothers.

## Other mods that are not compatible, but can't be detected automatically for various reasons

| Zip name (or similar)                                                                               | Mod name                               | Notes                                                  |
|-----------------------------------------------------------------------------------------------------|----------------------------------------|--------------------------------------------------------|
| TrainingGrounds_3_8_nocap_c-362-3-8-1673638252.zip                                                  | Improved Training Grounds(Legends)     | Not updated for current version                        |
| WeaponSkins_0.6-639-0-6-1688367502.zip                                                              | Weapons skins                          | Use Weapon Skins Hooked from Legends Discord instead.  |
| gart_BuiltUpTowns.zip<br/>gart_BuiltUpTownsExtended.zip<br/>mod_MoreTowns.zip<br/>mod_UpCitadel.zip | Built Up Towns AND More Towns          | all submods                                            |
| brawler_mod-649-0-1-1688247160.zip                                                                  | Fists of Fury - Deadly Brawlers' Fists | It's vanilla only and replaces its files, won't work   |
| l_native scenarios to 15 roster-270-1-01-1-1601643184.zip                                           | 27 bro roster                          | Legends also changes roster size, so there's conflict  |
| mod_all_starts_allow_max_bros_compiled_v1.4.zip-76-1-4-1558295353.zip                               | Another 27 Roster mod                  | as above                                               |
| modz_olto_armor_randomize_core_l-565-1-1-8-4-1661406513.zip                                         | Armor Randomize Legend                 | Overwrites legends files and won't work                |              |
| mod_Anatomist_DropAcquiredPotion-508-1-5-0-10-1647748516.zip                                        | Anatomist Drop Acquire Potion          | Vanilla only                                           |
| -                                                                                                   | Awesome Online Championships           | Vanilla only                                           |
| there are a few...                                                                                  | Battle Brothers Rebalanced             | Rewrites files that Legends uses                       | 
| Bro Twitch                                                                                          | Bro Twitch                             | doesn't work                                           |
| mod_ChangeAvatarRepeat-256-1-3-1599052847.zip                                                       | Change Avatar                          | doesn't work                                           |
| Event Frequency 100-82-1-0-1605735549.zip                                                           | Event Frequency                        | all versions                                           |
| mod_BobombHexAPOnly-417-1-1-1661490856.zip                                                          | Hexen Skills Tweak                     | breaks Legends                                         |
| Mod_Perma_Injuries_compiled_by_Hackflow-129-1-5-1691673552.zip                                      | Less severe Permanent Injuries         | breaks Legends                                         |
| True Handgonne-415-1-2-1627791103.zip                                                               | LNG's True Handgonne                   | breaks Legends                                         |
| mod_x3_payment_contracts_ENG_1_5_0_15-469-1-5-0-15eng-1698673764.zip                                | More Profit from Some Contracts        | breaks Legends                                         |
| No Restriction Arena - V2-276-1-4-0-41-1601095752.zip                                               | No Restriction Arena                   | Vanilla only                                           |
| mod_settlement_situation_tooltip-100-1-0-1-1558896843.zip                                           | Settlement Situation Tooltip           | Settlement Situation Tooltip MSU                       |
| mod_uncapped_levels-260-1-5-0-15-1713416789.7z                                                      | Uncapped Levels                        | breaks Legends, but also Legends has something similar |

## Troubleshooting 

A collection of self help tips so you can debug your own log and solve errors before posting bug reports.

### Vanilla Base Game                                                      
When people say “Vanilla” in BB it refers to the base game and in our specific case here means ‘non-Legends’. There are a lot of mods that are made with Vanilla functioning in mind and don’t bother to state as much in their mod descriptions, leading people to use them alongside Legends modded playthroughs and then errors and crashes occur. Of course we are not saying these Vanilla mods are bad - many are excellent (shout out to Sato, Villain Joueur, etc) we’re just stating that they will not jive if run alongside Legends.

### Legends Modded
Legends is an entire overhaul mod (much larger than most submods) in that it touches most of the Vanilla code base. It also adds new layers of code that are not found in Vanilla and hence why Vanilla mods don’t work with Legends in that they are either missing the new Legends code or are touching the same files that Legends does and thus errors occur.

### Troubleshooting & Common Errors
* Oftentimes you can figure out what mod(s) is causing you trouble. You can look at your in game running log which is found in your documents / BB / html.log to show you errors. At the very top of your log you can see the vanilla game BB version, if you are running an old game version you need to update to the latest. What you’re looking for are any red lines (or purple) which signify serious errors. Usually the culprit mod will be printed in the first error line. Also make sure you are running the latest Legends build which is always found at #latest build channel in Legends discord (this version is more up to date than the Nexus Legends version).
* Sometimes even if a claim of Legends compatibility is declared it might be an old mod that is no longer maintained, or it has been built incorrectly. Look at comments posted at said mod site and usually you will find people complaining if they have encountered problems. Another tool you have is the keyword search function at Legends discord. You can type the mod name and search for any comments made about possible problems.
* A common mistake that leads to save corruptions is removing mods mid run. Some mods add new data in the save such as new locations or items and when you remove the mod there is a data irregularity and the save will no longer load. It is critical to start your run with all compatible up to date mods.
* Another cause of errors is manipulating the resolution too high, leave at default. Playing your game at a resolution of 1920x1080 helps with memory consumption. I recommend not using anything above 1080p.
* AMD Radeon video cards seem to have an issue where Battle Brothers isn't allocated the required resources. You can fix that by going to System > Display > Graphics and setting Battle Brothers to high performance.
* Run only one origin submod at a time to reduce the risk of any overlapping or bleed through effects from running multiple origin mods at once. There is no reason to run more than one origin mod at once (exceptions to this are usually stated in the mod description.)
* This same logic applies to other types of mods. We often see in crash reports people running two or more of a particular mod that edits the same code, example  ‘potion’ mods etc. Try to stick to only one of ‘X type’ of mod to reduce the risk of incompatibilities.
* Try not to run too many mods. The more mods you run the more chances of some code incompatibility leading to crashes and save corruptions. This compatibility list is not meant to be read as ‘ok I can now add all the compatible mods to my BB data folder’. That is not the way it works. Legends is a large overhaul mod that touches most code and systems. Choosing the right submods should be very selective and specific, the smaller the mod list the cleaner and safer your campaign save will be.
* If the mod you are trying to research is not on this list you can assume it’s not compatible - or it is very new and we are waiting for feedback for compatibility. There is an example of a proper mod list with notes. on the side
* Avoid long play sessions. There are some memory leaks created because of various reasons when running a large mod list that will corrupt your save with long play sessions. We recommend shorter sessions, do a hard save and restart your steam client to in a sense flush the memory and avoid graphic glitches / save corruptions. Also, do not touch world sliders at campaign start, leave them at default. We’ve seen save corruptions occur by simply setting the sliders too high at world generation. (These factors are very pronounced in the Steam version of BB)
* This might not need saying, but make sure your exe and savegame folder are whitelisted by your antivirus.
* Users have reported less errors if your savegame folder and game are both placed on an ssd.
* Users have reported that deleting savegames after a save corruption and keeping 6 or less total savegames across campaigns helps with game stability.
* Do not use `vortex`! Manually drag your zipped modfiles to your data location.
* Users have reported that removing One Drive and Steam savegame autosync improves performance."

### Transfer from Steam to GoG step by step guide:
1) In your current BB steam data folder copy all your mods somewhere (I copied them into a new folder at desktop) - dont copy the data folders (or the GFX) just your submods.
2) Remove your old Steam battlebrothers entry from your PC where ever you have that for me it was in my `C:/ ...steamapps...battlebrothers` folder, I then put that entire folder into a seperate new folder in my desktop to keep as back up. Do the same thing for your BB folder in your documents (when you start your GoG BB it will generate a new one). You don't have to delete your BB steam game in your PC, doing these 2 steps will ensure when you get the GoG version it won't load your old steam version. (just make sure to delete any old BB start game extensions pins so you don't accidently start your steam version lol).
3) Buy the GoG BB and all the DLCs/ install. Next get the NT Core 4 GB patch / run it and attach it to your new GoG Battlebrothers.exe (that will be wherever you installed your GoG version `GoG Galaxy/games/battebrothers/win32/battlebrothers.exe` (you just have to attatch the 4GB patch only once)
4) Next all the old submods you had copied over at your desktop folder now copy those into `GoG Galaxy/games/battebrothers/win32/data` (this is the location that acts exactly like your old steam bb data folder).
5) That's it, enjoy your super maxed out 4GB l33t memory version. In my case I had to disable Vsync for GoG to launch not sure if you will have the same issue.
6) Don't forget you have to again re-apply all your in game options since they were all set to default. Oh and for you OCD people GoG also keeps track of your hours played so you can just add your old steam BB hours + new gog hours lol. "								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								











