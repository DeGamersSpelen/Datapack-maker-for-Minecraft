@echo off
echo Do you want to make a new datapack or use a old datapack.
echo Type old for old datapack.
echo Type new for new datapack
set /p choice=
if %choice%==new goto new
if %choice%==old goto old
exit
:old
cls
cd %appdata%/.minecraft/saves/
echo Which world is the datapack in?
set /p world=
cd %world%
cls
echo What is the datapack named?
set /p datapack=
cd datapacks/%datapack%/data
cls
:menu
echo Do you want to add more commands? type exit to exit.
set /p choice2=
if %choice2%==yes cd %datapack%/functions && goto yes
if %choice2%==exit exit



:yes
cls
start main.mcfunction
goto menu



:new
cls
cd %appdata%/.minecraft/saves/
echo Which world do you want to use? Enter name below.
set /p save=
cd %save%/datapacks
echo Whats the name of the datapack? Enter name below.
set /p name=
mkdir %name%
cd %name%
echo {> pack.mcmeta
echo 	"pack": {>> pack.mcmeta
echo 		"pack_format": 6,>> pack.mcmeta
echo 		"description": "">> pack.mcmeta
echo 	}>> pack.mcmeta
echo }>> pack.mcmeta
mkdir data
cd data
mkdir minecraft
mkdir %name%
cd minecraft
mkdir tags
cd tags
mkdir functions
cd functions
echo What command do you want to execute if you /reload?
set /p load=
echo %load%> load.json
echo {> tick.json
echo 	"values":[>> tick.json
echo 		"%name%:main">> tick.json
echo 	]>> tick.json
echo }>> tick.json
cd.. && cd.. && cd..
cd %name%
mkdir functions
cd functions
goto or1

:or2
echo Do you want to add a recipe or do a command every 1/20 of a second? Type recipe for the recipe part. Type command for the command part. Type help for more.
set /p or=
if %or%==command goto command2
if %or%==recipe goto recipe2
if %or%==help goto help1
goto or2

:or1
echo Do you want to add a recipe or do a command every 1/20 of a second? Type recipe for the recipe part. Type command for the command part. Type help for more.
set /p or=
if %or%==command goto command1
if %or%==recipe goto recipe1
if %or%==loot goto loot_tables
if %or%==help goto help1
goto or1

:help1
echo recipes are used for crafting example: if you make a furnace you used a recipe thats automaticly in minecraft. Type recipe to go to it.
echo commands are used for doing commands you can do alot with it if you know how to use it. Type command to go to it.
echo and there are loot tables they can be used for breaking blocks example: if you break a oak log you get 10 diamond blocks. Type loot to go to it.
pause
goto or1
:command1
echo Which command do you want to execute every 1/20 of a second? Enter command below.
set /p wow=
echo %wow%> main.mcfunction
start main.mcfunction
goto or1

:command2
echo Which command do you want to execute every 1/20 of a second? Enter command below.
set /p wow=
echo %wow%> main.mcfunction
goto or2

:recipe1
cd..
mkdir "recipes"
cd "recipes"
set random1=%random%
echo {> item%random1%.json
echo 	"type":"crafting_shaped",>> item%random1%.json
echo Which item do you want to craft?
set /p item=
echo   "pattern": [>> item%random1%.json
echo In which slot do you want the item to be in 1 - 9
set /p slot=
if %slot%==1 goto slot1
if %slot%==2 goto slot2
if %slot%==3 goto slot3
if %slot%==4 goto slot4
if %slot%==5 goto slot5
if %slot%==6 goto slot6
if %slot%==7 goto slot7
if %slot%==8 goto slot8
if %slot%==9 goto slot9

:recipe2
echo In which slot do you want the item to be in 1 - 9. If you are done type done.
set /p slot=
if %slot%==1 goto slot1
if %slot%==2 goto slot2
if %slot%==3 goto slot3
if %slot%==4 goto slot4
if %slot%==5 goto slot5
if %slot%==6 goto slot6
if %slot%==7 goto slot7
if %slot%==8 goto slot8
if %slot%==9 goto slot9
if %slot%==done goto donerecipe
if %slot%==Done goto donerecipe

:slot1
set slot1=true
echo Which item do you want in that slot?
set /p itemslot1=
goto recipe2

:slot2
set slot2=true
echo Which item do you want in that slot?
set /p itemslot2=
goto recipe2

:slot3
set slot3=true
echo Which item do you want in that slot?
set /p itemslot3=
goto recipe2

:slot4
set slot4=true
echo Which item do you want in that slot?
set /p itemslot4=
goto recipe2

:slot5
set slot5=true
echo Which item do you want in that slot?
set /p itemslot5=
goto recipe2

:slot6
set slot6=true
echo Which item do you want in that slot?
set /p itemslot6=
goto recipe2

:slot7
set slot7=true
echo Which item do you want in that slot?
set /p itemslot7=
goto recipe2

:slot8
set slot8=true
echo Which item do you want in that slot?
set /p itemslot8=
goto recipe2

:slot9
set slot9=true
echo Which item do you want in that slot?
set /p itemslot9=
goto recipe2

:loot_tables
echo Which loot table do you want to change? Type the name of the item. Example: oak log = oak_log
set /p loot=
cd..
cd..
cd minecraft
mkdir "loot_tables"
cd loot_tables
mkdir "blocks"
cd blocks
echo {> %loot%.json
echo 	"pools":>> %loot%.json
echo 	[>>%loot%.json
echo 		{>>%loot%.json
echo What item do you want to get if you mine it? Type the name of the item. Example: oak log = oak_log
set /p item23=
echo How many do you want to get of %item23%?
set /p how_many=
echo 			"rolls":%how_many%,>>%loot%.json
echo 			"entries":>>%loot%.json
echo 			[>>%loot%.json
echo 				{>>%loot%.json
echo 					"type":"item",>>%loot%.json
echo 					"name":"minecraft:%item23%",>>%loot%.json
echo 					"weight":1>>%loot%.json
echo 				}>>%loot%.json
echo 			]>>%loot%.json
echo 		}>>%loot%.json
echo 	]>>%loot%.json
echo }>>%loot%.json
goto or2

:donerecipe
if %itemslot1%==true if %itemslot2%==true if %itemslot3%==true goto donerecipe_1_full_line

:donerecipe_1_full_line
if %itemslot4%==true if %itemslot5%==true if %itemslot6%==true goto donerecipe_1_2_full_line

:donerecipe_1_2_full_line
if %itemslot7%==true if %itemslot8%==true if %itemslot9%==true goto donerecipe_1_2_3_full_line

:donerecipe_1_2_3_full_line
echo     "#XO",>> item%random1%.json
echo     "@+-",>> item%random1%.json
echo     "%$#">> item.json
echo   ],>> item%random1%.json
echo   "key": {>>item%random1%.json
