# Automatic Variables
# Makes $__ hold contents of previous output
# Note: We use double underscore (__) so as not to accidentally interfere with
# the $_ variable in things like ... | Select-Object {$_.Name -eq "foo" }

function Out-Default { $input | Tee-Object -Variable Global:__ | Microsoft.PowerShell.Core\Out-Default }

#
# This is for gits 'n shiggles: array for all the possible ascii art for neofetch
# Normally I'd list this off the filesystem but neofetch (stupidly...) embeds these
# as actual functions inside the damn shell script!
#
$neofetch_ascii_options = 'AIX,Alpine,AlterLinux,Anarchy,Android,Antergos,antiX,"AOSCOS","AOSCOS/Retro",Apricity,ArcoLinux,ArchBox,ARCHlabs,ArchStrike,XFerience,ArchMerge,Arch,Artix,Arya,Bedrock,Bitrig,BlackArch,BLAG,BlankOn,BlueLight,bonsai,BSD,BunsenLabs,Cal‐culate,Carbs,CentOS,Chakra,ChaletOS,Chapeau,Chrom,Cleanjaro,ClearOS,Clear_Linux,Clover,Con‐dres,Container_Linux,CRUX,Cucumber,Debian,Deepin,DesaOS,Devuan,DracOS,DragonFly,Drauger,Ele‐mentary,EndeavourOS,Endless,EuroLinux,Exherbo,Fedora,Feren,FreeBSD,FreeMiNT,Frugalware,Fun‐too,GalliumOS,Gentoo,Pentoo,gNewSense,GNOME,GNU,GoboLinux,Grombyang,Guix,Haiku,Huayra,Hy‐perbola,janus,Kali,KaOS,KDE_neon,Kibojoe,Kogaion,Korora,KSLinux,Kubuntu,LEDE,LFS,Linux_Lite,LMDE,Lubuntu,Lunar,macos,Mageia,MagpieOS,Mandriva,Manjaro,Maui,Mer,Minix,Lin‐uxMint,MX_Linux,Namib,Neptune,NetBSD,Netrunner,Nitrux,NixOS,Nurunner,NuTyX,OBRevenge,Open‐BSD,OpenIndiana,openmamba,OpenMandriva,OpenStage,OpenWrt,osmc,Oracle,OSElbrus,PacBSD,Parab‐ola,Pardus,Parrot,Parsix,TrueOS,PCLinuxOS,Peppermint,popos,Porteus,PostMarketOS,Proxmox,Puppy,PureOS,Qubes,Radix,Raspbian,Reborn_OS,Redstar,Redcore,Redhat,Refracted_Devuan,Regata,Rosa,sabotage,Sabayon,Sailfish,SalentOS,Scientific,Septor,SereneLinux,SharkLinux,Siduction,Slackware,SliTaz,SmartOS,Solus,Source_Mage,Sparky,Star,SteamOS,SunOS,openSUSE_Leap,open‐SUSE_Tumbleweed,openSUSE,SwagArch,Tails,Trisquel,Ubuntu-Budgie,Ubuntu-GNOME,Ubuntu-MATE,Ubuntu-Studio,Ubuntu,Venom,Void,Obarun,windows10,Windows7,Xubuntu,Zorin,IRIX'.Split(',')
