################################################
# Trinity Core World Server configuration file #
################################################
[worldserver]

###################################################################################################
# SECTION INDEX
#
#    EXAMPLE CONFIG
#    CONNECTIONS AND DIRECTORIES
#    PERFORMANCE SETTINGS
#    SERVER LOGGING
#    SERVER SETTINGS
#    UPDATE SETTINGS
#    HOTSWAP SETTINGS
#    WARDEN SETTINGS
#    PLAYER INTERACTION
#    CREATURE SETTINGS
#    CHAT SETTINGS
#    GAME MASTER SETTINGS
#    SUPPORT SETTINGS
#    VISIBILITY AND DISTANCES
#    SERVER RATES
#    STATS LIMITS
#    AUTO BROADCAST
#    BATTLEGROUND CONFIG
#    BATTLEFIELD CONFIG
#    ARENA CONFIG
#    NETWORK CONFIG
#    CONSOLE AND REMOTE ACCESS
#    CHARACTER DELETE OPTIONS
#    CUSTOM SERVER OPTIONS
#    AUCTION HOUSE BOT SETTINGS
#    AUCTION HOUSE BOT ITEM FINE TUNING
#    AUCTION HOUSE BOT BUYER CONFIG
#    BLACK MARKET SETTINGS
#    LOGGING SYSTEM SETTINGS
#    CURRENCIES SETTINGS
#    PACKET SPOOF PROTECTION SETTINGS
#    METRIC SETTINGS
#
###################################################################################################

###################################################################################################
# EXAMPLE CONFIG
#
#    Variable
#        Description: Brief description what the variable is doing.
#        Important:   Annotation for important things about this variable.
#        Example:     "Example, i.e. if the value is a string"
#        Default:     10 - (Enabled|Comment|Variable name in case of grouped config options)
#                     0  - (Disabled|Comment|Variable name in case of grouped config options)
#
# Note to developers:
# - Copy this example to keep the formatting.
# - Line breaks should be at column 100.
###################################################################################################

###################################################################################################
# CONNECTIONS AND DIRECTORIES
#
#    RealmID
#        Description: ID of the Realm using this config.
#        Important:   RealmID must match the realmlist inside the auth database.
#        Default:     1

RealmID = 1

#
#    DataDir
#        Description: Data directory setting.
#        Important:   DataDir needs to be quoted, as the string might contain space characters.
#        Example:     "@prefix@/share/trinitycore"
#        Default:     "."

DataDir = "/opt/legion/data"

#
#    LogsDir
#        Description: Logs directory setting.
#        Important:   LogsDir needs to be quoted, as the string might contain space characters.
#                     Logs directory must exists, or log file creation will be disabled.
#        Default:     "" - (Log files will be stored in the current path)

LogsDir = ""

#
#    LoginDatabaseInfo
#    WorldDatabaseInfo
#    CharacterDatabaseInfo
#    HotfixDatabaseInfo
#        Description: Database connection settings for the world server.
#        Example:     "hostname;port;username;password;database"
#                     ".;somenumber;username;password;database" - (Use named pipes on Windows
#                                                                 "enable-named-pipe" to [mysqld]
#                                                                 section my.ini)
#                     ".;/path/to/unix_socket;username;password;database" - (use Unix sockets on
#                                                                           Unix/Linux)
#        Default:     "127.0.0.1;3306;trinity;trinity;auth"       - (LoginDatabaseInfo)
#                     "127.0.0.1;3306;trinity;trinity;world"      - (WorldDatabaseInfo)
#                     "127.0.0.1;3306;trinity;trinity;characters" - (CharacterDatabaseInfo)
#                     "127.0.0.1;3306;trinity;trinity;hotfixes"   - (HotfixDatabaseInfo)
#
#    Don't change hostname unless you are hosting mysql on a different machine, if you need help
#    with configuration allowing to connect from diferent machine than the one running server
#    search for TCE00016 on forum.
#    Don't open port on firewall to external connections (it belongs to mysql, not to wow server).
#    The username you choose must have permisions to create/alter/rename tables.

LoginDatabaseInfo     = "${database_hostname};3306;${wow_database_user};${wow_database_user_password};auth"
WorldDatabaseInfo     = "${database_hostname};3306;${wow_database_user};${wow_database_user_password};world"
CharacterDatabaseInfo = "${database_hostname};3306;${wow_database_user};${wow_database_user_password};characters"
HotfixDatabaseInfo    = "${database_hostname};3306;${wow_database_user};${wow_database_user_password};hotfixes"

#
#    LoginDatabase.WorkerThreads
#    WorldDatabase.WorkerThreads
#    CharacterDatabase.WorkerThreads
#    HotfixDatabase.WorkerThreads
#        Description: The amount of worker threads spawned to handle asynchronous (delayed) MySQL
#                     statements. Each worker thread is mirrored with its own connection to the
#                     MySQL server and their own thread on the MySQL server.
#        Default:     1 - (LoginDatabase.WorkerThreads)
#                     1 - (WorldDatabase.WorkerThreads)
#                     1 - (CharacterDatabase.WorkerThreads)
#                     1 - (HotfixDatabase.WorkerThreads)

LoginDatabase.WorkerThreads     = 1
WorldDatabase.WorkerThreads     = 1
CharacterDatabase.WorkerThreads = 1
HotfixDatabase.WorkerThreads    = 1

#
#    LoginDatabase.SynchThreads
#    WorldDatabase.SynchThreads
#    CharacterDatabase.SynchThreads
#    HotfixDatabase.SynchThreads
#        Description: The amount of MySQL connections spawned to handle.
#        Default:     1 - (LoginDatabase.SynchThreads)
#                     1 - (WorldDatabase.SynchThreads)
#                     2 - (CharacterDatabase.SynchThreads)
#                     1 - (HotfixDatabase.SynchThreads)

LoginDatabase.SynchThreads     = 1
WorldDatabase.SynchThreads     = 1
CharacterDatabase.SynchThreads = 2
HotfixDatabase.SynchThreads    = 1

#
#    MaxPingTime
#        Description: Time (in minutes) between database pings.
#        Default:     30

MaxPingTime = 30

#
#    WorldServerPort
#        Description: TCP port to reach the world server.
#        Default:     8085

WorldServerPort = 8085

#
#    InstanceServerPort
#        Description: TCP port to for second world connection.
#        Default:     8086

InstanceServerPort = 8086

#
#    BindIP
#        Description: Bind world server to IP/hostname.
#        Default:     "0.0.0.0" - (Bind to all IPs on the system)

BindIP = "0.0.0.0"

#
#    ThreadPool
#        Description: Number of threads to be used for the global thread pool
#                     The thread pool is currently used for:
#                      - Signal handling
#                      - Remote access
#                      - Database keep-alive ping
#                      - Core freeze check
#                      - World socket networking
#        Default:     2

ThreadPool = 2

#
#    CMakeCommand
#        Description: The path to your CMake binary.
#                     If the path is left empty, the built-in CMAKE_COMMAND is used.
#        Example:     "C:/Program Files (x86)/CMake/bin/cmake.exe"
#                     "/usr/bin/cmake"
#        Default:     ""

CMakeCommand  = ""

#
#    BuildDirectory
#        Description: The path to your build directory.
#                     If the path is left empty, the built-in CMAKE_BINARY_DIR is used.
#        Example:     "../TrinityCore"
#        Default:     ""

BuildDirectory  = ""

#
#    SourceDirectory
#        Description: The path to your TrinityCore source directory.
#                     If the path is left empty, the built-in CMAKE_SOURCE_DIR is used.
#        Example:     "../TrinityCore"
#        Default:     ""

SourceDirectory  = ""

#
#    MySQLExecutable
#        Description: The path to your mysql cli binary.
#                     If the path is left empty, built-in path from cmake is used.
#        Example:     "C:/Program Files/MySQL/MySQL Server 5.6/bin/mysql.exe"
#                     "mysql.exe"
#                     "/usr/bin/mysql"
#        Default:     ""

MySQLExecutable = ""

#
###################################################################################################

###################################################################################################
# PERFORMANCE SETTINGS
#
#    UseProcessors
#        Description: Processors mask for Windows and Linux based multi-processor systems.
#        Example:     A computer with 2 CPUs:
#                     1  - 1st CPU only, 2 - 2nd CPU only, 3 - 1st and 2nd CPU, because 1 | 2 is 3
#        Default:     0  - (Selected by OS)
#                     1+ - (Bit mask value of selected processors)

UseProcessors = 0

#
#    ProcessPriority
#        Description: Process priority setting for Windows and Linux based systems.
#        Details:     On Linux, a nice value of -15 is used. (requires superuser).
#                     On Windows, process is set to HIGH class.
#        Default:     0 - (Normal)
#                     1 - (High)

ProcessPriority = 0

#
#    RealmsStateUpdateDelay
#        Description: Time (in seconds) between realm list updates.
#        Default:     10
#                     0  - (Disabled)

RealmsStateUpdateDelay = 10

#
#    Compression
#        Description: Compression level for client update packages.
#        Range:       1-9
#        Default:     1   - (Speed)
#                     9   - (Best compression)

Compression = 1

#
#    PlayerLimit
#        Description: Maximum number of players in the world. Excluding Mods, GMs and Admins.
#          Important: If you want to block players and only allow Mods, GMs or Admins to join the
#                     server, use the DB field "auth.realmlist.allowedSecurityLevel".
#            Default: 0   - (Disabled, No limit)
#                     1+  - (Enabled)

PlayerLimit = 0

#
#    SaveRespawnTimeImmediately
#        Description: Save respawn time for creatures at death and gameobjects at use/open.
#        Default:     1 - (Enabled, Save respawn time immediately)
#                     0 - (Disabled, Save respawn time at grid unloading)

SaveRespawnTimeImmediately = 1

#
#    MaxOverspeedPings
#        Description: Maximum overspeed ping count before character is disconnected.
#        Default:     2  - (Enabled, Minimum value)
#                     3+ - (Enabled, More checks before kick)
#                     0  - (Disabled)

MaxOverspeedPings = 2

#
#    GridUnload
#        Description: Unload grids to save memory. Can be disabled if enough memory is available
#                     to speed up moving players to new grids.
#        Default:     1 - (enable, Unload grids)
#                     0 - (disable, Do not unload grids)

GridUnload = 1

#
#    BaseMapLoadAllGrids
#        Description: Load all grids for base maps upon load. Requires GridUnload to be 0.
#                     This will take around 5GB of ram upon server load, and will take some time
#                     to initially load the server.
#        Default:     0 - (Don't pre-load all base maps, dynamically load as used)
#                     1 - (Preload all grids in all base maps upon load)

BaseMapLoadAllGrids = 0

#
#    InstanceMapLoadAllGrids
#        Description: Load all grids for instance maps upon load. Requires GridUnload to be 0.
#                     Upon loading an instance map, all creatures/objects in the map will be pre-loaded
#        Default:     0 - (Don't pre-load all base maps, dynamically load as used)
#                     1 - (Preload all grids in the instance upon load)

InstanceMapLoadAllGrids = 0

#
#    SocketTimeOutTime
#        Description: Time (in milliseconds) after which a connection being idle on the character
#                     selection screen is disconnected.
#        Default:     900000 - (15 minutes)

SocketTimeOutTime = 900000

#
#    SessionAddDelay
#        Description: Time (in microseconds) that a network thread will sleep after authentication
#                     protocol handling before adding a connection to the world session map.
#        Default:     10000 - (10 milliseconds, 0.01 second)

SessionAddDelay = 10000

#
#    GridCleanUpDelay
#        Description: Time (in milliseconds) grid clean up delay.
#        Default:     300000 - (5 minutes)

GridCleanUpDelay = 300000

#
#    MapUpdateInterval
#        Description: Time (milliseconds) for map update interval.
#        Default:     100 - (0.1 second)

MapUpdateInterval = 100

#
#    ChangeWeatherInterval
#        Description: Time (in milliseconds) for weather update interval.
#        Default:     600000 - (10 min)

ChangeWeatherInterval = 600000

#
#    PlayerSaveInterval
#        Description: Time (in milliseconds) for player save interval.
#        Default:     90000 - (90 seconds)

PlayerSaveInterval = 90000

#
#    PlayerSave.Stats.MinLevel
#        Description: Minimum level for saving character stats in the database for external usage.
#        Default:     0  - (Disabled, Do not save character stats)
#                     1+ - (Enabled, Level beyond which character stats are saved)

PlayerSave.Stats.MinLevel = 0

#
#    PlayerSave.Stats.SaveOnlyOnLogout
#        Description: Save player stats only on logout.
#        Default:     1 - (Enabled, Only save on logout)
#                     0 - (Disabled, Save on every player save)

PlayerSave.Stats.SaveOnlyOnLogout = 1

#
#    DisconnectToleranceInterval
#        Description: Tolerance (in seconds) for disconnected players before reentering the queue.
#        Default: 0 (disabled)

DisconnectToleranceInterval = 0

#
#    mmap.enablePathFinding
#        Description: Enable/Disable pathfinding using mmaps - recommended.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

mmap.enablePathFinding = 0

#
#    vmap.enableLOS
#    vmap.enableHeight
#        Description: VMmap support for line of sight and height calculation.
#        Default:     1 - (Enabled, vmap.enableLOS)
#                     1 - (Enabled, vmap.enableHeight)
#                     0 - (Disabled)

vmap.enableLOS    = 1
vmap.enableHeight = 1

#
#    vmap.enableIndoorCheck
#        Description: VMap based indoor check to remove outdoor-only auras (mounts etc.).
#        Default:     1 - (Enabled)
#                     0 - (Disabled, somewhat less CPU usage)

vmap.enableIndoorCheck = 1

#
#    DetectPosCollision
#        Description: Check final move position, summon position, etc for visible collision with
#                     other objects or walls (walls only if vmaps are enabled).
#        Default:     1 - (Enabled)
#                     0 - (Disabled, Less position precision but less CPU usage)

DetectPosCollision = 1

#
#    TargetPosRecalculateRange
#        Description: Max distance from movement target point (+moving unit size) and targeted
#                     object (+size) after that new target movement point calculated.
#        Range:       0.5-5.0
#        Default:     1.5
#                     0.5 - (Minimum, Contact Range, More sensitive reaction to target movement)
#                     5.0 - (Maximum, Melee attack range, Less CPU usage)

TargetPosRecalculateRange = 1.5

#
#    UpdateUptimeInterval
#        Description: Update realm uptime period (in minutes).
#        Default:     10 - (10 minutes)
#                     1+

UpdateUptimeInterval = 10

#
#    LogDB.Opt.ClearInterval
#        Description: Time (in minutes) for the WUPDATE_CLEANDB timer that clears the `logs` table
#                     of old entries.
#        Default:     10 - (10 minutes)
#                     1+

LogDB.Opt.ClearInterval = 10

#
#    LogDB.Opt.ClearTime
#        Description: Time (in seconds) for keeping old `logs` table entries.
#        Default:     1209600 - (Enabled, 14 days)
#                     0       - (Disabled, Do not clear entries)

LogDB.Opt.ClearTime = 1209600

#
#    MaxCoreStuckTime
#        Description: Time (in seconds) before the server is forced to crash if it is frozen.
#        Default:     0   - (Disabled)
#                     10+ - (Enabled, Recommended 10+)

MaxCoreStuckTime = 0

#
#    AddonChannel
#        Description: Configure the use of the addon channel through the server (some client side
#                     addons will not work correctly with disabled addon channel)
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

AddonChannel = 1

#
#    MapUpdate.Threads
#        Description: Number of threads to update maps.
#        Default:     1

MapUpdate.Threads = 1

#
#    CleanCharacterDB
#        Description: Clean out deprecated achievements, skills, spells and talents from the db.
#        Default:     0 - (Disabled)
#                     1 - (Enable)

CleanCharacterDB = 0

#
#    PersistentCharacterCleanFlags
#        Description: Determines the character clean flags that remain set after cleanups.
#                     This is a bitmask value, check /doc/CharacterDBCleanup.txt for more
#                     information.
#        Example:     14 - (Cleaning up skills, talents and spells will remain enabled after the
#                           next cleanup)
#        Default:     0  - (All cleanup methods will be disabled after the next cleanup)

PersistentCharacterCleanFlags = 0

#
#    Auction.GetAllScanDelay
#        Description: Sets the minimum time in seconds, a single player character can perform a getall scan.
#                     The value is only held in memory so a server restart will clear it.
#                     Setting this to zero, will disable GetAll functions completely.
#        Default:     900 - (GetAll scan limited to once every 15mins per player character)

Auction.GetAllScanDelay = 900

#
#    Auction.SearchDelay
#        Description: Sets the minimum time in milliseconds (seconds x 1000), that the client must wait between
#                     auction search operations. This can be increased if somehow Auction House activity is causing
#                     too much load.
#        Default:     300 - (Time delay between auction searches set to 0.3secs)

Auction.SearchDelay = 300

#
###################################################################################################

###################################################################################################
# SERVER LOGGING
#
#    PidFile
#        Description: World daemon PID file.
#        Example:     "./world.pid" - (Enabled)
#        Default:     ""            - (Disabled)

PidFile = ""

#
#    PacketLogFile
#        Description: Binary packet logging file for the world server.
#                     Filename extension must be .pkt to be parsable with WowPacketParser.
#        Example:     "World.pkt" - (Enabled)
#        Default:     ""          - (Disabled)

PacketLogFile = ""

# Extended Logging system configuration moved to end of file (on purpose)
#
###################################################################################################

###################################################################################################
# SERVER SETTINGS
#
#    GameType
#        Description: Server realm type.
#        Default:     0  - (NORMAL)
#                     1  - (PVP)
#                     4  - (NORMAL)
#                     6  - (RP)
#                     8  - (RPPVP)
#                     16 - (FFA_PVP, Free for all pvp mode like arena PvP in all zones except rest
#                          activated places and sanctuaries)

GameType = 0

#
#    RealmZone
#        Description: Server realm zone. Set allowed alphabet in character, etc. names.
#        Default      1  - (Development   - any language)
#                     2  - (United States - extended-Latin)
#                     3  - (Oceanic       - extended-Latin)
#                     4  - (Latin America - extended-Latin)
#                     5  - (Tournament    - basic-Latin at create, any at login)
#                     6  - (Korea         - East-Asian)
#                     7  - (Tournament    - basic-Latin at create, any at login)
#                     8  - (English       - extended-Latin)
#                     9  - (German        - extended-Latin)
#                     10 - (French        - extended-Latin)
#                     11 - (Spanish       - extended-Latin)
#                     12 - (Russian       - Cyrillic)
#                     13 - (Tournament    - basic-Latin at create, any at login)
#                     14 - (Taiwan        - East-Asian)
#                     15 - (Tournament    - basic-Latin at create, any at login)
#                     16 - (China         - East-Asian)
#                     17 - (CN1           - basic-Latin at create, any at login)
#                     18 - (CN2           - basic-Latin at create, any at login)
#                     19 - (CN3           - basic-Latin at create, any at login)
#                     20 - (CN4           - basic-Latin at create, any at login)
#                     21 - (CN5           - basic-Latin at create, any at login)
#                     22 - (CN6           - basic-Latin at create, any at login)
#                     23 - (CN7           - basic-Latin at create, any at login)
#                     24 - (CN8           - basic-Latin at create, any at login)
#                     25 - (Tournament    - basic-Latin at create, any at login)
#                     26 - (Test Server   - any language)
#                     27 - (Tournament    - basic-Latin at create, any at login)
#                     28 - (QA Server     - any language)
#                     29 - (CN9           - basic-Latin at create, any at login)

RealmZone = 1

#
#    StrictPlayerNames
#        Description: Limit player name to language specific symbol set. Prevents character
#                     creation and forces rename request if not allowed symbols are used
#        Default:     0 - (Disable, Limited server timezone dependent client check)
#                     1 - (Enabled, Strictly basic Latin characters)
#                     2 - (Enabled, Strictly realm zone specific, See RealmZone setting,
#                         Note: Client needs to have the appropriate fonts installed which support
#                         the charset. For non-official localization, custom fonts need to be
#                         placed in clientdir/Fonts.
#                     3 - (Enabled, Basic Latin characters + server timezone specific)

StrictPlayerNames = 0

#
#    StrictCharterNames
#        Description: Limit guild/arena team charter names to language specific symbol set.
#                     Prevents charter creation if not allowed symbols are used.
#        Default:     0 - (Disable, Limited server timezone dependent client check)
#                     1 - (Enabled, Strictly basic Latin characters)
#                     2 - (Enabled, Strictly realm zone specific, See RealmZone setting,
#                         Note: Client needs to have the appropriate fonts installed which support
#                         the charset. For non-official localization, custom fonts need to be
#                         placed in clientdir/Fonts.
#                     3 - (Enabled, Basic Latin characters + server timezone specific)

StrictCharterNames = 0

#
#    StrictPetNames
#        Description: Limit pet names to language specific symbol set.
#                     Prevents pet naming if not allowed symbols are used.
#        Default:     0 - (Disable, Limited server timezone dependent client check)
#                     1 - (Enabled, Strictly basic Latin characters)
#                     2 - (Enabled, Strictly realm zone specific, See RealmZone setting,
#                         Note: Client needs to have the appropriate fonts installed which support
#                         the charset. For non-official localization, custom fonts need to be
#                         placed in clientdir/Fonts.
#                     3 - (Enabled, Basic Latin characters + server timezone specific)

StrictPetNames = 0

#
#    DBC.Locale
#        Description: DBC language settings.
#        Default:     0   - (English)
#                     1   - (Korean)
#                     2   - (French)
#                     3   - (German)
#                     4   - (Chinese)
#                     5   - (Taiwanese)
#                     6   - (Spanish)
#                     7   - (Spanish Mexico)
#                     8   - (Russian)
#                     9   - (none)
#                     10  - (ptBR)
#                     11  - (itIT)

DBC.Locale = 0

#
#    DeclinedNames
#        Description: Allow Russian clients to set and use declined names.
#        Default:     0 - (Disabled, Except when the Russian RealmZone is set)
#                     1 - (Enabled)

DeclinedNames = 0

#
#    Expansion
#        Description: Allow server to use content from expansions. Checks for expansion-related
#                     map files, client compatibility and class/race character creation.
#        Default:     6 - (Expansion 6)
#                     5 - (Expansion 5)
#                     4 - (Expansion 4)
#                     3 - (Expansion 3)
#                     2 - (Expansion 2)
#                     1 - (Expansion 1)
#                     0 - (Disabled, Ignore and disable expansion content (maps, races, classes)

Expansion = 6

#
#    MinPlayerName
#        Description: Minimal player name length.
#        Range:       1-12
#        Default:     2

MinPlayerName = 2

#
#    MinCharterName
#        Description: Minimal charter name length.
#        Range:       1-24
#        Default:     2

MinCharterName = 2

#
#    MinPetName
#        Description: Minimal pet name length.
#        Range:       1-12
#        Default:     2

MinPetName = 2

#
#    Guild.CharterCost
#    ArenaTeam.CharterCost.2v2
#    ArenaTeam.CharterCost.3v3
#    ArenaTeam.CharterCost.5v5
#        Description: Amount of money (in Copper) the petitions costs.
#        Default:     1000 - (10 Silver)
#                     800000 - (80 Gold)
#                     1200000 - (120 Gold)
#                     2000000 - (200 Gold)

Guild.CharterCost = 1000
ArenaTeam.CharterCost.2v2 = 800000
ArenaTeam.CharterCost.3v3 = 1200000
ArenaTeam.CharterCost.5v5 = 2000000

#
#    MaxWhoListReturns
#        Description: Set the max number of players returned in the /who list and interface.
#        Default:     50 - (stable)

MaxWhoListReturns = 50

#
#    CharacterCreating.Disabled
#        Description: Disable character creation for players based on faction.
#        Example:     3 - (1 + 2, Alliance and Horde are disabled)
#        Default:     0 - (Enabled, All factions are allowed)
#                     1 - (Disabled, Alliance)
#                     2 - (Disabled, Horde)
#                     4 - (Disabled, Neutral)

CharacterCreating.Disabled = 0

#
#    CharacterCreating.Disabled.RaceMask
#        Description: Mask of races which cannot be created by players.
#        Example:     1536 - (1024 + 512, Blood Elf and Draenei races are disabled)
#        Default:     0    - (Enabled, All races are allowed)
#                     1    - (Disabled, Human)
#                     2    - (Disabled, Orc)
#                     4    - (Disabled, Dwarf)
#                     8    - (Disabled, Night Elf)
#                     16   - (Disabled, Undead)
#                     32   - (Disabled, Tauren)
#                     64   - (Disabled, Gnome)
#                     128  - (Disabled, Troll)
#                     256  - (Disabled, Goblin)
#                     512  - (Disabled, Blood Elf)
#                     1024 - (Disabled, Draenei)
#                     2097152 - (Disabled, Worgen)
#                     8388608 - (Disabled, Pandaren Neutral)
#                     16777216 - (Disabled, Pandaren Alliance)
#                     33554432 - (Disabled, Pandaren Horde)

CharacterCreating.Disabled.RaceMask = 0

#
#    CharacterCreating.Disabled.ClassMask
#        Description: Mask of classes which cannot be created by players.
#        Example:     288 - (32 + 256, Death Knight and Warlock classes are disabled)
#        Default:     0    - (Enabled, All classes are allowed)
#                     1    - (Disabled, Warrior)
#                     2    - (Disabled, Paladin)
#                     4    - (Disabled, Hunter)
#                     8    - (Disabled, Rogue)
#                     16   - (Disabled, Priest)
#                     32   - (Disabled, Death Knight)
#                     64   - (Disabled, Shaman)
#                     128  - (Disabled, Mage)
#                     256  - (Disabled, Warlock)
#                     512  - (Disabled, Monk)
#                     1024 - (Disabled, Druid)

CharacterCreating.Disabled.ClassMask = 0

#
#    CharactersPerAccount
#        Description: Limit number of characters per account on all realms on this realmlist.
#        Important:   Number must be >= CharactersPerRealm
#        Default:     50

CharactersPerAccount = 50

#
#    CharactersPerRealm
#        Description: Limit number of characters per account on this realm.
#        Range:       1-16
#        Default:     16 - (Client limitation)

CharactersPerRealm = 16

#
#    DemonHuntersPerRealm
#        Description: Limit number of demon hunter characters per account on this realm.
#        Range:       1-16
#        Default:     1

DemonHuntersPerRealm = 1

#
#    CharacterCreating.MinLevelForDemonHunter
#        Description: Limit creating demon hunters only for account with another
#                     character of specific level.
#        Default:     70 - (Enabled, Requires at least another level 70 character)
#                     0  - (Disabled)
#                     1  - (Enabled, Requires at least another level 1 character)

CharacterCreating.MinLevelForDemonHunter = 70

#
#    SkipCinematics
#        Description: Disable cinematic intro at first login after character creation.
#                     Prevents buggy intros in case of custom start location coordinates.
#        Default:     0 - (Show intro for each new character)
#                     1 - (Show intro only for first character of selected race)
#                     2 - (Disable intro for all classes)

SkipCinematics = 0

#
#    MaxPlayerLevel
#        Description: Maximum level that can be reached by players.
#        Important:   Levels beyond 110 are not recommended at all.
#        Range:       1-255
#        Default:     110

MaxPlayerLevel = 110

#
#    MinDualSpecLevel
#        Description: Level requirement for Dual Talent Specialization.
#        Default:     30

MinDualSpecLevel = 30

#
#    StartPlayerLevel
#        Description: Starting level for characters after creation.
#        Range:       1-MaxPlayerLevel
#        Default:     1

StartPlayerLevel = 1

#
#    StartDeathKnightPlayerLevel
#        Description: Staring level for death knights after creation.
#        Range:       1-MaxPlayerLevel
#        Default:     55

StartDeathKnightPlayerLevel = 55

#
#    StartDemonHunterPlayerLevel
#        Description: Staring level for demon hunters after creation.
#        Range:       98-MaxPlayerLevel
#        Default:     98

StartDemonHunterPlayerLevel = 98

#
#    StartPlayerMoney
#        Description: Amount of money (in Copper) that a character has after creation.
#        Default:     0
#                     100 - (1 Silver)

StartPlayerMoney = 0

#
#    RecruitAFriend.MaxLevel
#        Description: Highest level up to which a character can benefit from the Recruit-A-Friend
#                     experience multiplier.
#        Default:     85

RecruitAFriend.MaxLevel = 85

#
#    RecruitAFriend.MaxDifference
#        Description: Highest level difference between linked Recruiter and Friend benefit from
#                     the Recruit-A-Friend experience multiplier.
#        Default:     4

RecruitAFriend.MaxDifference = 4

#
#    DisableWaterBreath
#        Description: Required security level for water breathing.
#        Default:     4  - (Disabled)
#                     0  - (Enabled, Everyone)
#                     1  - (Enabled, Mods/GMs/Admins)
#                     2  - (Enabled, GMs/Admins)
#                     3  - (Enabled, Admins)

DisableWaterBreath = 4

#
#    AllFlightPaths
#        Description: Character knows all flight paths (of both factions) after creation.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllFlightPaths = 0

#
#    InstantFlightPaths
#        Description: Flight paths will take players to their destination instantly instead
#                     of making them wait while flying.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

InstantFlightPaths = 0

#
#    ActivateWeather
#        Description: Activate the weather system.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

ActivateWeather = 1

#
#    CastUnstuck
#        Description: Allow casting the Unstuck spell using .start or unstuck button in client
#                     help options.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

CastUnstuck = 1

#
#    Instance.IgnoreLevel
#        Description: Ignore level requirement when entering instances.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Instance.IgnoreLevel = 0

#
#    Instance.IgnoreRaid
#        Description: Ignore raid group requirement when entering instances.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Instance.IgnoreRaid = 0

#
#    Instance.ResetTimeHour
#        Description: Hour of the day when the global instance reset occurs.
#        Range:       0-23
#        Default:     4 - (04:00 AM)

Instance.ResetTimeHour = 4

#
#    Instance.UnloadDelay
#        Description: Time (in milliseconds) before instance maps are unloaded from memory if no
#                     characters are inside.
#        Default:     1800000 - (Enabled, 30 minutes)
#                     0       - (Disabled, Instance maps are kept in memory until the instance
#                               resets)

Instance.UnloadDelay = 1800000

#
#    InstancesResetAnnounce
#        Description: Announce the reset of one instance to whole party.
#        Default:     false - (Disabled, don't show, blizzlike)
#                     true  - (Enabled, show)

InstancesResetAnnounce = false

#
#    Quests.EnableQuestTracker
#        Description: Store datas in the database about quest completion and abandonment to help finding out bugged quests.
#        Default:     0  - (Disabled)
#                     1  - (Enabled)

Quests.EnableQuestTracker = 0

#
#    Quests.LowLevelHideDiff
#        Description: Level difference between player and quest level at which quests are
#                     considered low-level and are not shown via exclamation mark (!) at quest
#                     givers.
#        Default:     4  - (Enabled, Hide quests that have 4 levels less than the character)
#                     -1 - (Disabled, Show all available quest marks)

Quests.LowLevelHideDiff = 4

#
#    Quests.HighLevelHideDiff
#        Description: Level difference between player and quest level at which quests are
#                     considered high-level and are not shown via exclamation mark (!) at quest
#                     givers.
#        Default:     7  - (Enabled, Hide quests that have 7 levels more than the character)
#                     -1 - (Disabled, Show all available quest marks)

Quests.HighLevelHideDiff = 7

#
#    Quests.IgnoreRaid
#        Description: Allow non-raid quests to be completed while in a raid group.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Quests.IgnoreRaid = 0

#
#    Quests.IgnoreAutoAccept
#        Description: Ignore auto accept flag. Clients will have to manually accept all quests.
#        Default:     0 - (Disabled, DB values determine if quest is marked auto accept or not.)
#                     1 - (Enabled, clients will not be told to automatically accept any quest.)

Quests.IgnoreAutoAccept = 0

#
#    Quests.IgnoreAutoComplete
#        Description: Ignore auto complete flag. Clients will have to manually complete all quests.
#        Default:     0 - (Disabled, DB values determine if quest is marked auto complete or not.)
#                     1 - (Enabled, clients will not be told to automatically complete any quest.)

Quests.IgnoreAutoComplete = 0

#
#    Quests.DailyResetTime
#        Description: Hour of the day when daily quest reset occurs.
#        Range:       0-23
#        Default:     3 - (3:00 AM, Blizzlike)
#

Quests.DailyResetTime = 3

#
#    Guild.EventLogRecordsCount
#        Description: Number of log entries for guild events that are stored per guild. Old entries
#                     will be overwritten if the number of log entries exceed the configured value.
#                     High numbers prevent this behavior but may have performance impacts.
#        Default:     100

Guild.EventLogRecordsCount = 100

#
#    Guild.ResetHour
#        Description: Hour of the day when the daily cap resets occur.
#        Range:       0-23
#        Default:     6 - (06:00 AM)

Guild.ResetHour = 6

#
#    Guild.BankEventLogRecordsCount
#        Description: Number of log entries for guild bank events that are stored per guild. Old
#                     entries will be overwritten if the number of log entries exceed the
#                     configured value. High numbers prevent this behavior but may have performance
#                     impacts.
#        Default:     25 - (Minimum)

Guild.BankEventLogRecordsCount = 25

#
#    Guild.NewsLogRecordsCount
#        Description: Number of log entries for guild news that are stored per guild. Old
#                     entries will be overwritten if the number of log entries exceed the
#                     configured value. High numbers prevent this behavior but may have performance
#                     impacts.
#        Default:     250

Guild.NewsLogRecordsCount = 250

#
#    MaxPrimaryTradeSkill
#        Description: Maximum number of primary professions a character can learn.
#        Range:       0-11
#        Default:     2

MaxPrimaryTradeSkill = 2

#
#    MinPetitionSigns
#        Description: Number of required signatures on charters to create a guild.
#        Range:       0-4
#        Default:     4

MinPetitionSigns = 4

#
#    MaxGroupXPDistance
#        Description: Max distance to creature for group member to get experience at creature
#                     death.
#        Default:     74

MaxGroupXPDistance = 74

#
#    MaxRecruitAFriendBonusDistance
#        Description: Max distance between character and and group to gain the Recruit-A-Friend
#                     XP multiplier.
#        Default:     100

MaxRecruitAFriendBonusDistance = 100

#
#    MailDeliveryDelay
#        Description: Time (in seconds) mail delivery is delayed when sending items.
#        Default:     3600 - (1 hour)

MailDeliveryDelay = 3600

#
#    SkillChance.Prospecting
#        Description: Allow skill increase from prospecting.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

SkillChance.Prospecting = 0

#
#    SkillChance.Milling
#        Description: Allow skill increase from milling.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

SkillChance.Milling = 0

#
#    OffhandCheckAtSpellUnlearn
#        Description: Unlearning certain spells can change offhand weapon restrictions
#                     for equip slots.
#        Default:     1 - (Recheck offhand slot weapon at unlearning a spell)
#                     0 - (Recheck offhand slot weapon only at zone update)

OffhandCheckAtSpellUnlearn = 1

#
#    ClientCacheVersion
#        Description: Client cache version for client cache data reset. Use any value different
#                     from DB and not recently been used to trigger client side cache reset.
#        Default:     0 - (Use DB value from world DB version.cache_id field)

ClientCacheVersion = 0

#
#    HotfixCacheVersion
#        Description: Hotfix cache version for hotfix cache data reset. Use any value different
#                     from DB and not recently been used to trigger client side cache reset.
#        Default:     0 - (Use DB value from world DB version.hotfix_id field)

HotfixCacheVersion = 0

#
#    Event.Announce
#        Description: Announce events.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Event.Announce = 0

#
#    BeepAtStart
#        Description: Beep when the world server finished starting.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

BeepAtStart = 1

#
#    Motd
#        Description: Message of the Day, displayed at login. Use '@' for a newline.
#        Example:     "Welcome to John's Server!@This server is proud to be powered by Trinity Core."
#        Default:     "Welcome to a Trinity Core server."

Motd = "Welcome to a Trinity Core server."

#
#    Server.LoginInfo
#        Description: Display core version (.server info) on login.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Server.LoginInfo = 0

#
#    Command.LookupMaxResults
#        Description: Number of results being displayed using a .lookup command.
#        Default:     0 - (Unlimited)

Command.LookupMaxResults = 0

#
#     DungeonFinder.OptionsMask
#        Description: Dungeon and raid finder system.
#        Value is a bitmask consisting of:
#           LFG_OPTION_ENABLE_DUNGEON_FINDER = 1,     Enable the dungeon finder browser
#           LFG_OPTION_ENABLE_RAID_BROWSER   = 2,     Enable the raid browser
#        Default:     1

DungeonFinder.OptionsMask = 1

#
#   DBC.EnforceItemAttributes
#        Description: Disallow overriding item attributes stored in DBC files with values from the
#                     database.
#        Default:     1 - (Enabled, Enforce DBC values)
#                     0 - (Disabled, Use database values)

DBC.EnforceItemAttributes = 1

#
#   AccountInstancesPerHour
#        Description: Controls the max amount of different instances player can enter within hour.
#        Default:     5

AccountInstancesPerHour = 5

#
#   Account.PasswordChangeSecurity
#        Description: Controls how secure the password changes are.
#        Default:     0 - None (Old and new password)
#                     1 - Email (Email confirmation necessary)
#                     2 - RBAC (RBAC enable or disables email confirmation per group)

Account.PasswordChangeSecurity = 0

#
#   BirthdayTime
#        Description: Set to date of project's birth in UNIX time. By default the date when
#                     TrinityCore was started (Thu Oct 2, 2008)
#        Default:     1222964635

BirthdayTime = 1222964635

#
#   FeatureSystem.BpayStore.Enabled
#        Description: Not yet implemented
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

FeatureSystem.BpayStore.Enabled = 0

#
#   FeatureSystem.CharacterUndelete.Enabled
#        Description: Controls Feature in CharacterList to restore delete Characters.
#        Default:     0 - (Disabled)
#                     1 - (Enabled, Experimental)

FeatureSystem.CharacterUndelete.Enabled = 0

#
#   FeatureSystem.CharacterUndelete.Cooldown
#        Description: Time between available character restorations. (in sec)
#        Default:     2592000 (30 days)

FeatureSystem.CharacterUndelete.Cooldown = 2592000

#
###################################################################################################

###################################################################################################
# UPDATE SETTINGS
#
#    Updates.EnableDatabases
#        Description: A mask that describes which databases shall be updated.
#
#        Following flags are available
#           DATABASE_LOGIN     = 1, // Auth database
#           DATABASE_CHARACTER = 2, // Character database
#           DATABASE_WORLD     = 4, // World database
#           DATABASE_HOTFIX    = 8, // Hotfixes database
#
#        Default:     15 - (All enabled)
#                     4  - (Enable world only)
#                     0  - (All Disabled)

Updates.EnableDatabases = 15

#
#    Updates.AutoSetup
#        Description: Auto populate empty databases.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Updates.AutoSetup   = 1

#
#    Updates.Redundancy
#        Description: Perform data redundancy checks through hashing
#                     to detect changes on sql updates and reapply it.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Updates.Redundancy  = 1

#
#    Updates.ArchivedRedundancy
#        Description: Check hashes of archived updates (slows down startup).
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Updates.ArchivedRedundancy = 0

#
#    Updates.AllowRehash
#        Description: Inserts the current file hash in the database if it is left empty.
#                     Useful if you want to mark a file as applied but you don't know its hash.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Updates.AllowRehash = 1

#
#    Updates.CleanDeadRefMaxCount
#        Description: Cleans dead/ orphaned references that occur if an update was removed or renamed and edited in one step.
#                     It only starts the clean up if the count of the missing updates is below or equal the Updates.CleanDeadRefMaxCount value.
#                     This way prevents erasing of the update history due to wrong source directory state (maybe wrong branch or bad revision).
#                     Disable this if you want to know if the database is in a possible "dirty state".
#        Default:     3 - (Enabled)
#                     0 - (Disabled)
#                    -1 - (Enabled - unlimited)

Updates.CleanDeadRefMaxCount = 3

#
###################################################################################################

###################################################################################################
# HOTSWAP SETTINGS
#
#    HotSwap.Enabled (Requires compilation with DYNAMIC_LINKING=1)
#        Description: Enables dynamic script hotswapping.
#                     Reloads scripts on changes.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.Enabled = 1

#
#    HotSwap.ScriptDir
#        Description: Directory containing the script shared libraries (.dll/.so).
#        Example:     "/usr/local/scripts"
#        Default:     "scripts"

HotSwap.ScriptDir = "scripts"

#    HotSwap.EnableReCompiler
#        Description: Enables the dynamic script recompiler.
#                     Watches your script source directories and recompiles the
#                     script modules on changes.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.EnableReCompiler = 1

#    HotSwap.EnableEarlyTermination
#        Description: Terminate the build of a module when an associated
#                     source file was changed meanwhile.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.EnableEarlyTermination = 1

#    HotSwap.EnableBuildFileRecreation
#        Description: Recreate build files when sources to a module
#                     were added or removed.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.EnableBuildFileRecreation = 1

#
#    HotSwap.EnableInstall
#        Description: Enables cmake install after automatic builds have finished
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.EnableInstall = 1

#
#    HotSwap.EnablePrefixCorrection
#        Description: Allows the core to automatic set the CMAKE_INSTALL_PREFIX
#                     to it's current location in the filesystem.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

HotSwap.EnablePrefixCorrection = 1

#    HotSwap.ReCompilerBuildType
#        Description: Defines the build type of the builds invoked by the recompiler.
#        Default:     "" - Built-in build type of the module is used.
#                     "Release" - Release builds only
#                     "Debug" - Debug builds only

HotSwap.ReCompilerBuildType = ""

#
###################################################################################################

###################################################################################################
# WARDEN SETTINGS
#
#    Warden.Enabled
#        Description: Enable Warden anticheat system.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Warden.Enabled = 0

#
#    Warden.NumMemChecks
#        Description: Number of Warden memory checks that are sent to the client each cycle.
#        Default:     3 - (Enabled)
#                     0 - (Disabled)

Warden.NumMemChecks = 3

#
#    Warden.NumOtherChecks
#        Description: Number of Warden checks other than memory checks that are added to request
#                     each checking cycle.
#        Default:     7 - (Enabled)
#                     0 - (Disabled)

Warden.NumOtherChecks = 7

#
#    Warden.ClientResponseDelay
#        Description: Time (in seconds) before client is getting disconnecting for not responding.
#        Default:     600 - (10 Minutes)
#                     0 - (Disabled, client won't be kicked)

Warden.ClientResponseDelay = 600

#
#    Warden.ClientCheckHoldOff
#        Description: Time (in seconds) to wait before sending the next check request to the client.
#                     A low number increases traffic and load on client and server side.
#        Default:     30 - (30 Seconds)
#                     0  - (Send check as soon as possible)

Warden.ClientCheckHoldOff = 30

#
#    Warden.ClientCheckFailAction
#        Description: Default action being taken if a client check failed. Actions can be
#                     overwritten for each single check via warden_action table in characters
#                     database.
#        Default:     0 - (Disabled, Logging only)
#                     1 - (Kick)
#                     2 - (Ban)

Warden.ClientCheckFailAction = 0

#
#    Warden.BanDuration
#        Description: Time (in seconds) an account will be banned if ClientCheckFailAction is set
#                     to ban.
#        Default:     86400 - (24 hours)
#                     0     - (Permanent ban)

Warden.BanDuration = 86400

#
###################################################################################################

###################################################################################################
# PLAYER INTERACTION
#
#    AllowTwoSide.Interaction.Calendar
#        Description: Allow calendar invites between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Interaction.Calendar = 0

#
#    AllowTwoSide.Interaction.Channel
#        Description: Allow channel chat between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Interaction.Channel = 0

#
#    AllowTwoSide.Interaction.Group
#        Description: Allow group joining between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Interaction.Group = 0

#
#    AllowTwoSide.Interaction.Guild
#        Description: Allow guild joining between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Interaction.Guild = 0

#
#    AllowTwoSide.Interaction.Auction
#        Description: Allow auctions between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Interaction.Auction = 0

#
#    AllowTwoSide.Trade
#        Description: Allow trading between factions.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AllowTwoSide.Trade = 0

#
#    TalentsInspecting
#        Description: Allow/disallow inspecting other characters' talents.
#                     Doesn't affect game master accounts.
#                     2 - (Enabled for all characters)
#        Default:     1 - (Enabled for characters of the same faction)
#                     0 - (Talent inspecting is disabled)

TalentsInspecting = 1

#
###################################################################################################

###################################################################################################
# CREATURE SETTINGS
#
#    ThreatRadius
#        Description: Distance for creatures to evade after being pulled away from the combat
#                     starting point. If ThreatRadius is less than creature aggro radius then aggro
#                     radius will be used.
#        Default:     60

ThreatRadius = 60

#
#    Rate.Creature.Aggro
#        Description: Aggro radius percentage.
#        Default:     1   - (Enabled, 100%)
#                     1.5 - (Enabled, 150%)
#                     0   - (Disabled, 0%)

Rate.Creature.Aggro = 1

#
#    CreatureFamilyFleeAssistanceRadius
#        Description: Distance for fleeing creatures seeking assistance from other creatures.
#        Default:     30 - (Enabled)
#                     0  - (Disabled)

CreatureFamilyFleeAssistanceRadius = 30

#
#    CreatureFamilyAssistanceRadius
#        Description: Distance for creatures calling for assistance from other creatures without
#                     moving.
#        Default:     10 - (Enabled)
#                     0  - (Disabled)

CreatureFamilyAssistanceRadius = 10

#
#    CreatureFamilyAssistanceDelay
#        Description: Time (in milliseconds) before creature assistance call.
#        Default:     1500 - (1.5 Seconds)

CreatureFamilyAssistanceDelay = 1500

#
#    CreatureFamilyFleeDelay
#        Description: Time (in milliseconds) during which creature can flee if no assistance was
#                     found.
#        Default:     7000 (7 Seconds)

CreatureFamilyFleeDelay = 7000

#
#    WorldBossLevelDiff
#        Description: World boss level difference.
#        Default:     3

WorldBossLevelDiff = 3

#
#    Corpse.Decay.NORMAL
#    Corpse.Decay.RARE
#    Corpse.Decay.ELITE
#    Corpse.Decay.RAREELITE
#    Corpse.Decay.WORLDBOSS
#        Description: Time (in seconds) until creature corpse will decay if not looted or skinned.
#        Default:     60   - (1 Minute, Corpse.Decay.NORMAL)
#                     300  - (5 Minutes, Corpse.Decay.RARE)
#                     300  - (5 Minutes, Corpse.Decay.ELITE)
#                     300  - (5 Minutes, Corpse.Decay.RAREELITE)
#                     3600 - (1 Hour, Corpse.Decay.WORLDBOSS)

Corpse.Decay.NORMAL    = 60
Corpse.Decay.RARE      = 300
Corpse.Decay.ELITE     = 300
Corpse.Decay.RAREELITE = 300
Corpse.Decay.WORLDBOSS = 3600

#
#    Rate.Corpse.Decay.Looted
#        Description: Multiplier for Corpse.Decay.* to configure how long creature corpses stay
#                     after they have been looted.
#         Default:    0.5

Rate.Corpse.Decay.Looted = 0.5

#
#    Rate.Creature.Normal.Damage
#    Rate.Creature.Elite.Elite.Damage
#    Rate.Creature.Elite.RARE.Damage
#    Rate.Creature.Elite.RAREELITE.Damage
#    Rate.Creature.Elite.WORLDBOSS.Damage
#        Description: Mulitplier for creature melee damage.
#        Default:     1 - (Rate.Creature.Normal.Damage)
#                     1 - (Rate.Creature.Elite.Elite.Damage)
#                     1 - (Rate.Creature.Elite.RARE.Damage)
#                     1 - (Rate.Creature.Elite.RAREELITE.Damage)
#                     1 - (Rate.Creature.Elite.WORLDBOSS.Damage)
#

Rate.Creature.Normal.Damage          = 1
Rate.Creature.Elite.Elite.Damage     = 1
Rate.Creature.Elite.RARE.Damage      = 1
Rate.Creature.Elite.RAREELITE.Damage = 1
Rate.Creature.Elite.WORLDBOSS.Damage = 1

#
#    Rate.Creature.Normal.SpellDamage
#    Rate.Creature.Elite.Elite.SpellDamage
#    Rate.Creature.Elite.RARE.SpellDamage
#    Rate.Creature.Elite.RAREELITE.SpellDamage
#    Rate.Creature.Elite.WORLDBOSS.SpellDamage
#        Description: Mulitplier for creature spell damage.
#        Default:     1 - (Rate.Creature.Normal.SpellDamage)
#                     1 - (Rate.Creature.Elite.Elite.SpellDamage)
#                     1 - (Rate.Creature.Elite.RARE.SpellDamage)
#                     1 - (Rate.Creature.Elite.RAREELITE.SpellDamage)
#                     1 - (Rate.Creature.Elite.WORLDBOSS.SpellDamage)

Rate.Creature.Normal.SpellDamage          = 1
Rate.Creature.Elite.Elite.SpellDamage     = 1
Rate.Creature.Elite.RARE.SpellDamage      = 1
Rate.Creature.Elite.RAREELITE.SpellDamage = 1
Rate.Creature.Elite.WORLDBOSS.SpellDamage = 1

#
#    Rate.Creature.Normal.HP
#    Rate.Creature.Elite.Elite.HP
#    Rate.Creature.Elite.RARE.HP
#    Rate.Creature.Elite.RAREELITE.HP
#    Rate.Creature.Elite.WORLDBOSS.HP
#        Description: Mulitplier for creature health.
#        Default:     1 - (Rate.Creature.Normal.HP)
#                     1 - (Rate.Creature.Elite.Elite.HP)
#                     1 - (Rate.Creature.Elite.RARE.HP)
#                     1 - (Rate.Creature.Elite.RAREELITE.HP)
#                     1 - (Rate.Creature.Elite.WORLDBOSS.HP)

Rate.Creature.Normal.HP          = 1
Rate.Creature.Elite.Elite.HP     = 1
Rate.Creature.Elite.RARE.HP      = 1
Rate.Creature.Elite.RAREELITE.HP = 1
Rate.Creature.Elite.WORLDBOSS.HP = 1

#
#    Creature.PickPocketRefillDelay
#        Description: Time in seconds that the server will wait before refilling the pickpocket loot
#                     for a creature
#        Default:     600

Creature.PickPocketRefillDelay = 600

#
#    ListenRange.Say
#        Description: Distance in which players can read say messages from creatures or
#                     gameobjects.
#        Default:     40

ListenRange.Say = 40

#
#    ListenRange.TextEmote
#        Description: Distance in which players can read emotes from creatures or gameobjects.
#        Default:     40

ListenRange.TextEmote = 40

#
#    ListenRange.Yell
#        Description: Distance in which players can read yell messages from creatures or
#                     gameobjects.
#        Default:     300

ListenRange.Yell = 300

#
#    Creature.MovingStopTimeForPlayer
#        Description: Time (in milliseconds) during which creature will not move after
#                     interaction with player.
#        Default: 180000

Creature.MovingStopTimeForPlayer = 180000

#    MonsterSight
#        Description: The maximum distance in yards that a "monster" creature can see
#                     regardless of level difference (through CreatureAI::IsVisible).
#                     Increases CONFIG_SIGHT_MONSTER to 50 yards. Used to be 20 yards.
#        Default:     50.000000

MonsterSight = 50.000000

#
###################################################################################################

###################################################################################################
# CHAT SETTINGS
#
#    ChatFakeMessagePreventing
#        Description: Chat protection from creating fake messages using a lot spaces or other
#                     invisible symbols. Not applied to the addon language, but may break old
#                     addons that use normal languages for sending data to other clients.
#        Default:     1 - (Enabled, Blizzlike)
#                     0 - (Disabled)

ChatFakeMessagePreventing = 1

#
#    ChatStrictLinkChecking.Severity
#        Description: Check chat messages for ingame links to spells, items, quests, etc.
#        Default:     0 - (Disabled)
#                     1 - (Enabled, Check if only valid pipe commands are used, Prevents posting
#                         pictures.)
#                     2 - (Enabled, Verify that pipe commands are used in a correct order)
#                     3 - (Check if color, entry and name don't contradict each other. For this to
#                         work correctly, please assure that you have extracted locale DBCs of
#                         every language specific client playing on this server)

ChatStrictLinkChecking.Severity = 0

#
#    ChatStrictLinkChecking.Kick
#        Description: Defines what should be done if a message is considered to contain invalid
#                     pipe commands.
#        Default:     0 - (Silently ignore message)
#                     1 - (Disconnect players who sent malformed messages)

ChatStrictLinkChecking.Kick = 0

#
#    ChatFlood.MessageCount
#        Description: Chat flood protection, number of messages before player gets muted.
#        Default:     10 - (Enabled)
#                     0  - (Disabled)

ChatFlood.MessageCount = 10

#
#    ChatFlood.MessageDelay
#        Description: Time (in seconds) between messages to be counted into ChatFlood.MessageCount.
#        Default:     1

ChatFlood.MessageDelay = 1

#
#    ChatFlood.MuteTime
#        Description: Time (in seconds) characters get muted for violating ChatFlood.MessageCount.
#        Default:     10

ChatFlood.MuteTime = 10

#
#    Channel.RestrictedLfg
#        Description: Restrict LookupForGroup channel to characters registered in the LFG tool.
#        Default:     1 - (Enabled, Allow join to channel only if registered in LFG)
#                     0 - (Disabled, Allow join to channel in any time)

Channel.RestrictedLfg = 1

#
#    ChatLevelReq.Channel
#    ChatLevelReq.Whisper
#    ChatLevelReq.Emote
#    ChatLevelReq.Say
#    ChatLevelReq.Yell
#        Description: Level requirement for characters to be able to use chats.
#        Default:     1

ChatLevelReq.Channel = 1
ChatLevelReq.Whisper = 1
ChatLevelReq.Emote = 1
ChatLevelReq.Say = 1
ChatLevelReq.Yell = 1

#
#    PartyLevelReq
#        Description: Minimum level at which players can invite to group, even if they aren't on
#                     the invitee friends list. (Players who are on that friend list can always
#                     invite despite having lower level)
#        Default:     1

PartyLevelReq = 1

#
#    PreserveCustomChannels
#        Description: Store custom chat channel settings like password, automatic ownership handout
#                     or ban list in the database. Needs to be enabled to save custom
#                     world/trade/etc. channels that have automatic ownership handout disabled.
#                     (.channel set ownership $channel off)
#        Default:     0 - (Disabled, Blizzlike, Channel settings are lost if last person left)
#                     1 - (Enabled)

PreserveCustomChannels = 1

#
#    PreserveCustomChannelDuration
#        Description: Time (in days) that needs to pass before the customs chat channels get
#                     cleaned up from the database. Only channels with ownership handout enabled
#                     (default behavior) will be cleaned.
#        Default:     14 - (Enabled, Clean channels that haven't been used for 14 days)
#                     0  - (Disabled, Infinite channel storage)

PreserveCustomChannelDuration = 14

#
###################################################################################################

###################################################################################################
# GAME MASTER SETTINGS
#
#    GM.LoginState
#        Description: GM mode at login.
#        Default:     2 - (Last save state)
#                     0 - (Disable)
#                     1 - (Enable)

GM.LoginState = 2

#
#    GM.Visible
#        Description: GM visibility at login.
#        Default:     2 - (Last save state)
#                     0 - (Invisible)
#                     1 - (Visible)

GM.Visible = 2

#
#    GM.Chat
#        Description: GM chat mode at login.
#        Default:     2 - (Last save state)
#                     0 - (Disable)
#                     1 - (Enable)

GM.Chat = 2

#
#    GM.WhisperingTo
#        Description: Is GM accepting whispers from player by default or not.
#        Default:     2 - (Last save state)
#                     0 - (Disable)
#                     1 - (Enable)

GM.WhisperingTo = 2

#
# GM.FreezeAuraDuration
#       Description: Allows to set a default duration to the Freeze Aura
#                    applied on players when using the .freeze command
#       Default:     0 - (Original aura duration. Lasts until the .unfreeze command is used)
#                    N - (Aura duration if unspecified in .freeze command, in seconds)

GM.FreezeAuraDuration = 0

#
#    GM.InGMList.Level
#        Description: Maximum GM level shown in GM list (if enabled) in non-GM state (.gm off).
#        Default:     3 - (Anyone)
#                     0 - (Only players)
#                     1 - (Only moderators)
#                     2 - (Only gamemasters)

GM.InGMList.Level = 3

#
#    GM.InWhoList.Level
#        Description: Max GM level showed in who list (if visible).
#        Default:     3 - (Anyone)
#                     0 - (Only players)
#                     1 - (Only moderators)
#                     2 - (Only gamemasters)

GM.InWhoList.Level = 3

#
#    GM.StartLevel
#        Description: GM character starting level.
#        Default:     1

GM.StartLevel = 1

#
#    GM.AllowInvite
#        Description: Allow players to invite GM characters.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

GM.AllowInvite = 0

#
#    GM.LowerSecurity
#        Description: Allow lower security levels to use commands on higher security level
#                     characters.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

GM.LowerSecurity = 0

#
#    GM.ForceShutdownThreshold
#        Description: Minimum shutdown time in seconds before 'force' is required if other players are connected.
#        Default:     30

GM.ForceShutdownThreshold = 30

#
###################################################################################################

###################################################################################################
# SUPPORT SETTINGS
#
#    Support.Enabled
#        Description: Enable/disable the ticket system. This disables the whole customer
#                     support UI after trying to send a ticket in disabled state
#                     (MessageBox: "GM Help Tickets are currently unavailable.").
#                     UI remains disabled until the character relogs.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Support.Enabled = 1

#
#    Support.TicketsEnabled
#        Description: Allow/disallow opening new tickets.
#        Default:     0 - (Disabled)
#                     1 - (Enabled, Experimental)

Support.TicketsEnabled = 0

#
#    Support.BugsEnabled
#        Description: Allow/disallow opening new bug reports.
#        Default:    0 - (Disabled)
#                    1 - (Enabled, Experimental)

Support.BugsEnabled = 0

#
#    Support.ComplaintsEnabled
#        Description: Allow/disallow creating new player complaints.
#        Default:    0 - (Disabled)
#                    1 - (Enabled, Experimental)

Support.ComplaintsEnabled = 0

#
#    Support.SuggestionsEnabled
#        Description: Allow/disallow opening new suggestion reports.
#        Default:    0 - (Disabled)
#                    1 - (Enabled, Experimental)

Support.SuggestionsEnabled = 0

#
###################################################################################################

###################################################################################################
# VISIBILITY AND DISTANCES
#
#    Visibility.GroupMode
#        Description: Group visibility modes. Defines which groups can aways detect invisible
#                     characters of the same raid, group or faction.
#        Default:     1 - (Raid)
#                     0 - (Party)
#                     2 - (Faction)

Visibility.GroupMode = 1

#
#    Visibility.Distance.Continents
#    Visibility.Distance.Instances
#    Visibility.Distance.BGArenas
#        Description: Visibility distance to see other players or gameobjects.
#                     Visibility on continents on retail ~90 yards. In BG/Arenas ~533.
#                     For instances default ~170.
#                     Max limited by grid size: 533.33333
#                     Min limit is max aggro radius (45) * Rate.Creature.Aggro
#        Default:     90  - (Visibility.Distance.Continents)
#                     170 - (Visibility.Distance.Instances)
#                     533 - (Visibility.Distance.BGArenas)

Visibility.Distance.Continents = 90
Visibility.Distance.Instances = 170
Visibility.Distance.BGArenas = 533

#
#    Visibility.Notify.Period.OnContinents
#    Visibility.Notify.Period.InInstances
#    Visibility.Notify.Period.InBGArenas
#        Description: Time (in milliseconds) for visibility update period. Lower values may have
#                     performance impact.
#        Default:     1000 - (Visibility.Notify.Period.OnContinents)
#                     1000 - (Visibility.Notify.Period.InInstances)
#                     1000 - (Visibility.Notify.Period.InBGArenas)

Visibility.Notify.Period.OnContinents = 1000
Visibility.Notify.Period.InInstances  = 1000
Visibility.Notify.Period.InBGArenas   = 1000

#
###################################################################################################

###################################################################################################
# SERVER RATES
#
#    Rate.Health
#    Rate.Mana
#    Rate.Rage.Income
#    Rate.Rage.Loss
#    Rate.RunicPower.Income
#    Rate.RunicPower.Loss
#    Rate.Focus
#    Rate.Energy
#        Description: Multiplier to configure health and power increase or decrease.
#        Default:     1 for all regen rates

Rate.Health            = 1
Rate.Mana              = 1
Rate.Rage.Gain         = 1
Rate.Rage.Loss         = 1
Rate.Focus             = 1
Rate.Energy            = 1
Rate.ComboPoints.Loss  = 1
Rate.RunicPower.Gain   = 1
Rate.RunicPower.Loss   = 1
Rate.SoulShards.Loss   = 1
Rate.LunarPower.Loss   = 1
Rate.HolyPower.Loss    = 1
Rate.Maelstrom.Loss    = 1
Rate.Chi.Loss          = 1
Rate.Insanity.Loss     = 1
Rate.ArcaneCharges.Loss= 1
Rate.Fury.Loss         = 1
Rate.Pain.Loss         = 1

#
#    Rate.Skill.Discovery
#        Description: Multiplier for skill discovery.
#        Default:     1

Rate.Skill.Discovery = 1

#
#    Rate.Drop.Item.Poor
#    Rate.Drop.Item.Normal
#    Rate.Drop.Item.Uncommon
#    Rate.Drop.Item.Rare
#    Rate.Drop.Item.Epic
#    Rate.Drop.Item.Legendary
#    Rate.Drop.Item.Artifact
#    Rate.Drop.Item.Referenced
#    Rate.Drop.Money
#        Description: Drop rates for money and items based on quality.
#        Default:     1 - (Rate.Drop.Item.Poor)
#                     1 - (Rate.Drop.Item.Normal)
#                     1 - (Rate.Drop.Item.Uncommon)
#                     1 - (Rate.Drop.Item.Rare)
#                     1 - (Rate.Drop.Item.Epic)
#                     1 - (Rate.Drop.Item.Legendary)
#                     1 - (Rate.Drop.Item.Artifact)
#                     1 - (Rate.Drop.Item.Referenced)
#                     1 - (Rate.Drop.Money)

Rate.Drop.Item.Poor             = 1
Rate.Drop.Item.Normal           = 1
Rate.Drop.Item.Uncommon         = 1
Rate.Drop.Item.Rare             = 1
Rate.Drop.Item.Epic             = 1
Rate.Drop.Item.Legendary        = 1
Rate.Drop.Item.Artifact         = 1
Rate.Drop.Item.Referenced       = 1
Rate.Drop.Money                 = 1

#
#    Rate.Drop.Item.ReferencedAmount
#        Description: Multiplier for referenced loot amount.
#        Default:     1

Rate.Drop.Item.ReferencedAmount = 1

#
#    Rate.XP.Kill
#    Rate.XP.Quest
#    Rate.XP.Explore
#        Description: Experience rates.
#        Default:     1 - (Rate.XP.Kill, affects only kills outside of Battlegrounds)
#                     1 - (Rate.XP.Quest)
#                     1 - (Rate.XP.Explore)

Rate.XP.Kill    = 1
Rate.XP.Quest   = 1
Rate.XP.Explore = 1

#
#    Rate.XP.BattlegroundKill
#        Description: Experience rate for honorable kills in battlegrounds,
#                     it works when Battleground.GiveXPForKills = 1
#        Default:     1

Rate.XP.BattlegroundKill = 1

#
#    Rate.Quest.Money.Reward
#    Rate.Quest.Money.Max.Level.Reward
#        Description: Multiplier for money quest rewards. Can not be below 0.
#        Default:     1

Rate.Quest.Money.Reward = 1
Rate.Quest.Money.Max.Level.Reward = 1

#
#    Rate.RepairCost
#        Description: Repair cost rate.
#        Default:     1

Rate.RepairCost = 1

#
#    Rate.Rest.InGame
#    Rate.Rest.Offline.InTavernOrCity
#    Rate.Rest.Offline.InWilderness
#        Description: Resting points grow rates.
#        Default:     1 - (Rate.Rest.InGame)
#                     1 - (Rate.Rest.Offline.InTavernOrCity)
#                     1 - (Rate.Rest.Offline.InWilderness)

Rate.Rest.InGame                 = 1
Rate.Rest.Offline.InTavernOrCity = 1
Rate.Rest.Offline.InWilderness   = 1

#
#    Rate.Damage.Fall
#        Description: Damage after fall rate.
#        Default:     1

Rate.Damage.Fall = 1

#
#    Rate.Auction.Time
#    Rate.Auction.Deposit
#    Rate.Auction.Cut
#        Description: Auction rates (auction time, deposit get at auction start,
#                     auction cut from price at auction end).
#        Default:     1 - (Rate.Auction.Time)
#                     1 - (Rate.Auction.Deposit)
#                     1 - (Rate.Auction.Cut)

Rate.Auction.Time    = 1
Rate.Auction.Deposit = 1
Rate.Auction.Cut     = 1

#
#    Rate.Honor
#        Description: Honor gain rate.
#        Default:     1

Rate.Honor = 1

#
#    Rate.Talent
#        Description: Talent point rate.
#        Default:     1

Rate.Talent = 1

#
#    Rate.Reputation.Gain
#        Description: Reputation gain rate.
#        Default:     1

Rate.Reputation.Gain = 1

#
#    Rate.Reputation.LowLevel.Kill
#        Description: Reputation gain from killing low level (grey) creatures.
#        Default:     1

Rate.Reputation.LowLevel.Kill = 1

#
#    Rate.Reputation.LowLevel.Quest
#        Description: Reputation gain rate.
#        Default:     1

Rate.Reputation.LowLevel.Quest = 1

#
#    Rate.Reputation.RecruitAFriendBonus
#        Description: Reputation bonus rate for recruit-a-friend.
#        Default:     0.1

Rate.Reputation.RecruitAFriendBonus = 0.1

#
#    Rate.MoveSpeed
#        Description: Movement speed rate.
#        Default:     1

Rate.MoveSpeed = 1

#
#    Rate.InstanceResetTime
#        Description: Multiplier for the rate between global raid/heroic instance resets
#                     (dbc value). Higher value increases the time between resets,
#                     lower value lowers the time, you need clean instance_reset in
#                     characters db in order to let new values work.
#        Default:     1

Rate.InstanceResetTime = 1

#
#    SkillGain.Crafting
#    SkillGain.Gathering
#        Description: Crafting/defense/gathering/weapon skills gain rate.
#        Default:     1 - (SkillGain.Crafting)
#                     1 - (SkillGain.Gathering)

SkillGain.Crafting  = 1
SkillGain.Gathering = 1

#
#    SkillChance.Orange
#    SkillChance.Yellow
#    SkillChance.Green
#    SkillChance.Grey
#        Description: Chance to increase skill based on recipe color.
#        Default:     100 - (SkillChance.Orange)
#                     75  - (SkillChance.Yellow)
#                     25  - (SkillChance.Green)
#                     0   - (SkillChance.Grey)

SkillChance.Orange = 100
SkillChance.Yellow = 75
SkillChance.Green  = 25
SkillChance.Grey   = 0

#
#    SkillChance.MiningSteps
#    SkillChance.SkinningSteps
#        Description: Skinning and Mining chance decreases with skill level.
#        Default:     0  - (Disabled)
#                     75 - (In 2 times each 75 skill points)

SkillChance.MiningSteps   = 0
SkillChance.SkinningSteps = 0

#
#    DurabilityLoss.InPvP
#        Description: Durability loss on death during PvP.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

DurabilityLoss.InPvP = 0

#
#    DurabilityLoss.OnDeath
#        Description: Durability loss percentage on death.
#        Default:     10

DurabilityLoss.OnDeath = 10

#
#    DurabilityLossChance.Damage
#        Description: Chance to lose durability on one equipped item from damage.
#        Default:     0.5 - (100/0.5 = 200, Each 200 damage one equipped item will use durability)

DurabilityLossChance.Damage = 0.5

#
#    DurabilityLossChance.Absorb
#        Description: Chance to lose durability on one equipped armor item when absorbing damage.
#        Default:     0.5 - (100/0.5 = 200, Each 200 absorbed damage one equipped item will lose
#                           durability)

DurabilityLossChance.Absorb = 0.5

#
#    DurabilityLossChance.Parry
#        Description: Chance to lose durability on main weapon when parrying attacks.
#        Default:     0.05 - (100/0.05 = 2000, Each 2000 parried damage the main weapon will lose
#                            durability)

DurabilityLossChance.Parry = 0.05

#
#    DurabilityLossChance.Block
#        Description: Chance to lose durability on shield when blocking attacks.
#        Default:     0.05 - (100/0.05 = 2000, Each 2000 blocked damage the shield will lose
#                            durability)

DurabilityLossChance.Block = 0.05

#
#    Death.SicknessLevel
#        Description: Starting level for resurrection sickness.
#        Example:     11 - (Level 1-10 characters will not be affected,
#                           Level 11-19 characters will be affected for 1 minute,
#                           Level 20-MaxPlayerLevel characters will be affected for 10 minutes)
#         Default:    11               - (Enabled, See Example)
#                     MaxPlayerLevel+1 - (Disabled)
#                     -10              - (Enabled, Level 1+ characters have 10 minute duration)

Death.SicknessLevel = 11

#
#    Death.CorpseReclaimDelay.PvP
#    Death.CorpseReclaimDelay.PvE
#        Description: Increase corpse reclaim delay at PvP/PvE deaths.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Death.CorpseReclaimDelay.PvP = 1
Death.CorpseReclaimDelay.PvE = 0

#
#    Death.Bones.World
#    Death.Bones.BattlegroundOrArena
#        Description: Create bones instead of corpses at resurrection in normal zones, instances,
#                     battleground or arenas.
#        Default:     1 - (Enabled, Death.Bones.World)
#                     1 - (Enabled, Death.Bones.BattlegroundOrArena)
#                     0 - (Disabled)

Death.Bones.World               = 1
Death.Bones.BattlegroundOrArena = 1

#
#    Die.Command.Mode
#        Description: Do not trigger things like loot from .die command.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Die.Command.Mode = 1

#
###################################################################################################

###################################################################################################
# STATS LIMITS
#
#    Stats.Limits.Enable
#        Description: Enable or disable stats system.
#        Default:     0 - Disabled

Stats.Limits.Enable = 0

#
#    Stats.Limit.[STAT]
#        Description: Set percentage limit for dodge, parry, block and crit rating.
#        Default:     95.0 (95%)

Stats.Limits.Dodge = 95.0
Stats.Limits.Parry = 95.0
Stats.Limits.Block = 95.0
Stats.Limits.Crit  = 95.0

#
###################################################################################################

###################################################################################################
# AUTO BROADCAST
#
#    AutoBroadcast.On
#        Description: Enable auto broadcast.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AutoBroadcast.On = 0

#
#    AutoBroadcast.Center
#        Description: Auto broadcasting display method.
#        Default:     0 - (Announce)
#                     1 - (Notify)
#                     2 - (Both)

AutoBroadcast.Center = 0

#
#    AutoBroadcast.Timer
#        Description: Timer (in milliseconds) for auto broadcasts.
#        Default:     600000 - (10 minutes)

AutoBroadcast.Timer = 600000

#
###################################################################################################

###################################################################################################
# BATTLEGROUND CONFIG
#
#    Battleground.CastDeserter
#        Description: Cast Deserter spell at players who leave battlegrounds in progress.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Battleground.CastDeserter = 1

#
#    Battleground.QueueAnnouncer.Enable
#        Description: Announce battleground queue status to chat.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Battleground.QueueAnnouncer.Enable = 0

#
#    Battleground.QueueAnnouncer.PlayerOnly
#        Description: Battleground queue announcement type.
#        Default:     0 - (System message, Anyone can see it)
#                     1 - (Private, Only queued players can see it)

Battleground.QueueAnnouncer.PlayerOnly = 0

#
#    Battleground.StoreStatistics.Enable
#        Description: Store Battleground scores in the database.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Battleground.StoreStatistics.Enable = 0

#
#    Battleground.InvitationType
#        Description: Set Battleground invitation type.
#        Default:     0 - (Normal, Invite as much players to battlegrounds as queued,
#                          Don't bother with balance)
#                     1 - (Experimental, Don't allow to invite much more players
#                          of one faction)
#                     2 - (Experimental, Try to have even teams)

Battleground.InvitationType = 0

#
#    Battleground.PrematureFinishTimer
#        Description: Time (in milliseconds) before battleground will end prematurely if there are
#                     not enough players on one team. (Values defined in battleground template)
#        Default:     300000 - (Enabled, 5 minutes)
#                     0      - (Disabled, Not recommended)

Battleground.PrematureFinishTimer = 300000

#
#    Battleground.PremadeGroupWaitForMatch
#        Description: Time (in milliseconds) a pre-made group has to wait for matching group of the
#                     other faction.
#        Default:     1800000 - (Enabled, 30 minutes)
#                     0       - (Disabled, Not recommended)

Battleground.PremadeGroupWaitForMatch = 1800000

#
#    Battleground.GiveXPForKills
#        Description: Give experience for honorable kills in battlegrounds,
#                     the rate can be changed in the Rate.XP.BattlegroundKill setting.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Battleground.GiveXPForKills = 0

#
#    Battleground.Random.ResetHour
#        Description: Hour of the day when the global instance resets occur.
#        Range:       0-23
#        Default:     6 - (06:00 AM)

Battleground.Random.ResetHour = 6

#
#     Battleground.RewardWinnerHonorFirst
#     Battleground.RewardWinnerConquestFirst
#     Battleground.RewardWinnerHonorLast
#     Battleground.RewardWinnerConquestLast
#     Battleground.RewardLoserHonorFirst
#     Battleground.RewardLoserHonorLast
#        Description: Random Battlegrounds / call to the arms rewards.
#        Default:     30 - Battleground.RewardWinnerHonorFirst
#                     25 - Battleground.RewardWinnerArenaFirst
#                     15 - Battleground.RewardWinnerHonorLast
#                     0  - Battleground.RewardWinnerArenaLast
#                     5  - Battleground.RewardLoserHonorFirst
#                     5  - Battleground.RewardLoserHonorLast
#

Battleground.RewardWinnerHonorFirst     = 27000
Battleground.RewardWinnerConquestFirst  = 10000
Battleground.RewardWinnerHonorLast      = 13500
Battleground.RewardWinnerConquestLast   = 5000
Battleground.RewardLoserHonorFirst      = 4500
Battleground.RewardLoserHonorLast       = 3500

#
#    Battleground.ReportAFK
#        Description: Number of reports needed to kick someone AFK from Battleground.
#        Range:       1-9
#        Default:     3

Battleground.ReportAFK = 3

#
###################################################################################################

###################################################################################################
# BATTLEFIELD CONFIG
#
#     Wintergrasp.Enable
#         Description: Enable the Wintergrasp battlefield.
#         Default:     0 - (Disabled)
#                      1 - (Enabled, Experimental as in incomplete, bugged and with crashes)

Wintergrasp.Enable = 0

#
#     Wintergrasp.PlayerMax
#         Description: Maximum number of players allowed in Wintergrasp.
#         Default:     100

Wintergrasp.PlayerMax = 100

#
#     Wintergrasp.PlayerMin
#         Description: Minimum number of players required for Wintergrasp.
#         Default:     0

Wintergrasp.PlayerMin = 0

#
#     Wintergrasp.PlayerMinLvl
#         Description: Required character level for the Wintergrasp battle.
#         Default:     77

Wintergrasp.PlayerMinLvl = 77

#
#     Wintergrasp.BattleTimer
#         Description: Time (in minutes) for the Wintergrasp battle to last.
#         Default:     30

Wintergrasp.BattleTimer = 30

#
#     Wintergrasp.NoBattleTimer
#         Description: Time (in minutes) between Wintergrasp battles.
#         Default:     150

Wintergrasp.NoBattleTimer = 150

#
#     Wintergrasp.CrashRestartTimer
#         Description: Time (in minutes) to delay the restart of Wintergrasp if the world server
#                      crashed during a running battle.
#         Default:     10

Wintergrasp.CrashRestartTimer = 10

#
#     TolBarad.Enable
#         Description: Enable the Tol Barad battlefield.
#         Default:     0 - (Disabled)
#                      1 - (Enabled, Experimental as in incomplete, bugged and with crashes)

TolBarad.Enable = 0

#
#     TolBarad.PlayerMax
#         Description: Maximum number of players allowed in Tol Barad.
#         Default:     100

TolBarad.PlayerMax = 100

#
#     TolBarad.PlayerMin
#         Description: Minimum number of players required for Tol Barad.
#         Default:     0

TolBarad.PlayerMin = 0

#
#     TolBarad.PlayerMinLvl
#         Description: Required character level for the Tol Barad battle.
#         Default:     85

TolBarad.PlayerMinLvl = 85

#
#     TolBarad.BattleTimer
#         Description: Time (in minutes) for the Tol Barad battle to last.
#         Default:     15

TolBarad.BattleTimer = 15

#
#     TolBarad.BonusTime
#         Description: Bonus time (in minutes) for each tower destroyed in Tol Barad battle.
#         Default:     5

TolBarad.BonusTime = 5

#
#     TolBarad.NoBattleTimer
#         Description: Time (in minutes) between TolBarad battles.
#         Default:     150

TolBarad.NoBattleTimer = 150

#
#     TolBarad.CrashRestartTimer
#         Description: Time (in minutes) to delay the restart of TolBarad if the world server
#                      crashed during a running battle.
#         Default:     10

TolBarad.CrashRestartTimer = 10

#
###################################################################################################

###################################################################################################
# ARENA CONFIG
#
#    Arena.MaxRatingDifference
#        Description: Maximum rating difference between two teams in rated matches.
#        Default:     150 - (Enabled)
#                     0   - (Disabled)

Arena.MaxRatingDifference = 150

#
#    Arena.RatingDiscardTimer
#        Description: Time (in milliseconds) after which rating differences are ignored when
#                     setting up matches.
#        Default:     600000 - (Enabled, 10 minutes)
#                     0      - (Disabled)

Arena.RatingDiscardTimer = 600000

#
#    Arena.RatedUpdateTimer
#        Description: Time (in milliseconds) between checks for matchups in rated arena.
#        Default:     5000 - (5 seconds)

Arena.RatedUpdateTimer = 5000

#
#    Arena.AutoDistributePoints
#        Description: Automatically distribute arena points.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Arena.AutoDistributePoints = 0

#
#    Arena.AutoDistributeInterval
#        Description: Time (in days) how often arena points should be distributed if automatic
#                     distribution is enabled.
#        Default:     7 - (Weekly)

Arena.AutoDistributeInterval = 7

#
#    Arena.QueueAnnouncer.Enable
#        Description: Announce arena queue status to chat.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Arena.QueueAnnouncer.Enable = 0

#
#    Arena.ArenaSeason.ID
#        Description: Current arena season id shown in clients.
#        Default:     15

Arena.ArenaSeason.ID = 15

#
#    Arena.ArenaSeason.InProgress
#        Description: State of current arena season.
#        Default:     1 - (Active)
#                     0 - (Finished)

Arena.ArenaSeason.InProgress = 1

#
#    Arena.ArenaStartRating
#        Description: Start rating for new arena teams.
#        Default:     0

Arena.ArenaStartRating = 0

#
#    Arena.ArenaStartPersonalRating
#        Description: Start personal rating when joining a team.
#        Default:     0

Arena.ArenaStartPersonalRating = 0

#
#    Arena.ArenaStartMatchmakerRating
#        Description: Start matchmaker rating for players.
#        Default:     1500

Arena.ArenaStartMatchmakerRating = 1500

#
#    Arena.ArenaWinRatingModifier1
#        Description: Modifier of rating addition when winner team rating is less than 1300
#                     be aware that from 1000 to 1300 it gradually decreases automatically down to the half of it
#                     (increasing this value will give more rating)
#        Default:     48

Arena.ArenaWinRatingModifier1 = 48

#
#    Arena.ArenaWinRatingModifier2
#        Description: Modifier of rating addition when winner team rating is equal or more than 1300
#                     (increasing this value will give more rating)
#        Default:     24

Arena.ArenaWinRatingModifier2 = 24

#
#    Arena.ArenaLoseRatingModifier
#        Description: Modifier of rating subtraction for loser team
#                     (increasing this value will subtract more rating)
#        Default:     24

Arena.ArenaLoseRatingModifier = 24

#
#    Arena.ArenaMatchmakerRatingModifier
#        Description: Modifier of matchmaker rating
#        Default:     24

Arena.ArenaMatchmakerRatingModifier = 24

#
#    ArenaLog.ExtendedInfo
#        Description: Include extended info to ArenaLogFile for each player after rated arena
#                     matches (guid, name, team, IP, healing/damage done, killing blows).
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

ArenaLog.ExtendedInfo = 0

#
###################################################################################################

###################################################################################################
# NETWORK CONFIG
#
#    Network.Threads
#        Description: Number of threads for network.
#         Default:    1 - (Recommended 1 thread per 1000 connections)

Network.Threads = 1

#
#    Network.OutKBuff
#        Description: Amount of memory (in bytes) used for the output kernel buffer (see SO_SNDBUF
#                     socket option, TCP manual).
#        Default:     -1 - (Use system default setting)

Network.OutKBuff = -1

#
#    Network.OutUBuff
#        Description: Amount of memory (in bytes) reserved in the user space per connection for
#                     output buffering.
#         Default:    65536

Network.OutUBuff = 65536

#
#    Network.TcpNoDelay:
#        Description: TCP Nagle algorithm setting.
#         Default:    0 - (Enabled, Less traffic, More latency)
#                     1 - (Disabled, More traffic, Less latency, TCP_NO_DELAY)

Network.TcpNodelay = 1

#
###################################################################################################

###################################################################################################
# CONSOLE AND REMOTE ACCESS
#
#    Console.Enable
#        Description: Enable console.
#        Default:     1 - (Enabled)
#                     0 - (Disabled)

Console.Enable = 1

#
#    Ra.Enable
#        Description: Enable remote console (telnet).
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Ra.Enable = 0

#
#    Ra.IP
#        Description: Bind remote access to IP/hostname.
#        Default:     "0.0.0.0" - (Bind to all IPs on the system)

Ra.IP = "0.0.0.0"

#
#    Ra.Port
#        Description: TCP port to reach the remote console.
#        Default:     3443

Ra.Port = 3443

#
#    Ra.MinLevel
#        Description: Required security level to use the remote console.
#        Default:     3

Ra.MinLevel = 3

#
#    SOAP.Enable
#        Description: Enable soap service.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

SOAP.Enabled = 0

#
#    SOAP.IP
#        Description: Bind SOAP service to IP/hostname.
#        Default:     "127.0.0.1" - (Bind to localhost)

SOAP.IP = "127.0.0.1"

#
#    SOAP.Port
#        Description: TCP port to reach the SOAP service.
#        Default:     7878

SOAP.Port = 7878

#
###################################################################################################

###################################################################################################
# CHARACTER DELETE OPTIONS
#
#    CharDelete.Method
#        Description: Character deletion behavior.
#        Default:     0 - (Completely remove character from the database)
#                     1 - (Unlink the character from account and free up the name, Appears as
#                         deleted ingame)

CharDelete.Method = 0

#
#    CharDelete.MinLevel
#        Description: Required level to use the unlinking method if enabled for non-heroic classes.
#        Default:     0  - (Same method for every level)
#                     1+ - (Only characters with the specified level will use the unlinking method)

CharDelete.MinLevel = 0

#
#    CharDelete.DeathKnight.MinLevel
#        Description: Required level to use the unlinking method if enabled for death knights.
#        Default:     0  - (Same method for every level)
#                     1+ - (Only characters with the specified level will use the unlinking method)

CharDelete.DeathKnight.MinLevel = 0

#
#    CharDelete.DemonHunter.MinLevel
#        Description: Required level to use the unlinking method if enabled for demon hunters.
#        Default:     0  - (Same method for every level)
#                     1+ - (Only characters with the specified level will use the unlinking method)

CharDelete.DemonHunter.MinLevel = 0

#
#    CharDelete.KeepDays
#        Description: Time (in days) before unlinked characters will be removed from the database.
#        Default:     30 - (Enabled)
#                     0  - (Disabled, Don't delete any characters)

CharDelete.KeepDays = 30

#
###################################################################################################

###################################################################################################
# CUSTOM SERVER OPTIONS
#
#     AllowTrackBothResources
#        Description: Allows players to track herbs and minerals at the same time (if they have the skills)
#        Default:     0 - (Do not allow)
#                     1 - (Allow)
#
#        Note:        The following are client limitations and cannot be coded for:
#                     * The minimap tracking icon will display whichever skill is activated second.
#                     * The minimap tracking list will only show a check mark next to the last skill activated (sometimes this
#                       bugs out and doesn't switch the check mark. It has no effect on the actual tracking though).
#                     * The minimap dots are yellow for both resources.

AllowTrackBothResources = 0

#
#    PlayerStart.AllReputation
#        Description: Players will start with most of the high level reputations that are needed
#                     for items, mounts etc.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

PlayerStart.AllReputation = 0

#
#    PlayerStart.AllSpells
#        Description: If enabled, players will start with all their class spells (not talents).
#                     You must populate playercreateinfo_spell_custom table with the spells you
#                     want, or this will not work! The table has data for all classes / races up
#                     to TBC expansion.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

PlayerStart.AllSpells = 0

#
#    PlayerStart.MapsExplored
#        Description: Characters start with all maps explored.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

PlayerStart.MapsExplored = 0

#
#    HonorPointsAfterDuel
#        Description: Amount of honor points the duel winner will get after a duel.
#        Default:     0  - (Disabled)
#                     1+ - (Enabled)

HonorPointsAfterDuel = 0

#
#    ResetDuelCooldowns
#        Description: Reset all cooldowns before duel starts and restore them when duel ends.
#        Default:     0  - (Disabled)
#                     1  - (Enabled)

ResetDuelCooldowns = 0

#    ResetDuelHealthMana
#        Description: Reset health and mana before duel starts and restore them when duel ends.
#        Default:     0  - (Disabled)
#                     1  - (Enabled)

ResetDuelHealthMana = 0

#
#    AlwaysMaxWeaponSkill
#        Description: Players will automatically gain max weapon/defense skill when logging in,
#                     or leveling.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

AlwaysMaxWeaponSkill = 0

#
#    PvPToken.Enable
#        Description: Character will receive a token after defeating another character that yields
#                     honor.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

PvPToken.Enable = 0

#
#    PvPToken.MapAllowType
#        Description: Define where characters can receive tokens.
#        Default:     4 - (All maps)
#                     3 - (Battlegrounds)
#                     2 - (FFA areas only like Gurubashi arena)
#                     1 - (Battlegrounds and FFA areas)

PvPToken.MapAllowType = 4

#
#    PvPToken.ItemID
#        Description: Item characters will receive after defeating another character if PvP Token
#                     system is enabled.
#        Default:     29434 - (Badge of justice)

PvPToken.ItemID = 29434

#
#    PvPToken.ItemCount
#        Description: Number of tokens a character will receive.
#        Default:     1

PvPToken.ItemCount = 1

#
#    NoResetTalentsCost
#        Description: Resetting talents doesn't cost anything.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

NoResetTalentsCost = 0

#
#     Guild.AllowMultipleGuildMaster
#        Description: Allow more than one guild master. Additional Guild Masters must be set using
#                     the ".guild rank" command.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Guild.AllowMultipleGuildMaster = 0

#
#     ShowKickInWorld
#        Description: Determines whether a message is broadcasted to the entire server when a
#                     player gets kicked.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

ShowKickInWorld = 0

#     ShowMuteInWorld
#        Description: Determines whether a message is broadcasted to the entire server when a
#                     player gets muted.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

ShowMuteInWorld = 0

#
#     ShowBanInWorld
#        Description: Determines whether a message is broadcasted to the entire server when a
#                     player gets banned.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

ShowBanInWorld = 0

#
#     RecordUpdateTimeDiffInterval
#        Description: Time (in milliseconds) update time diff is written to the log file.
#                     Update diff can be used as a performance indicator. Diff < 300: good
#                     performance. Diff > 600 bad performance, may be caused by high CPU usage.
#        Default:     60000 - (Enabled, 1 minute)
#                     0     - (Disabled)

RecordUpdateTimeDiffInterval = 60000

#
#     MinRecordUpdateTimeDiff
#        Description: Only record update time diff which is greater than this value.
#        Default:     100

MinRecordUpdateTimeDiff = 100

#
#     PlayerStart.String
#        Description: String to be displayed at first login of newly created characters.
#         Default:    "" - (Disabled)

PlayerStart.String = ""

#
#     LevelReq.Trade
#        Description: Level requirement for characters to be able to trade.
#        Default:     1

LevelReq.Trade = 1

#
#     LevelReq.Auction
#        Description: Level requirement for characters to be able to use the auction house.
#        Default:     1

LevelReq.Auction = 1

#
#     LevelReq.Mail
#        Description: Level requirement for characters to be able to send and receive mails.
#        Default:     1

LevelReq.Mail = 1

#
#     PlayerDump.DisallowPaths
#        Description: Disallow using paths in PlayerDump output files
#        Default:     1

PlayerDump.DisallowPaths = 1

#
#     PlayerDump.DisallowOverwrite
#        Description: Disallow overwriting existing files with PlayerDump
#        Default:     1

PlayerDump.DisallowOverwrite = 1

#
#     UI.ShowQuestLevelsInDialogs
#        Description: Show quest levels next to quest titles in UI dialogs
#        Example:     [13] Westfall Stew
#        Default:     0  - (Do not show)

UI.ShowQuestLevelsInDialogs = 0

#
#     Calculate.Creature.Zone.Area.Data
#        Description: Calculate at loading creature zoneId / areaId and save in creature table (WARNING: SLOW WORLD SERVER STARTUP)
#        Default:     0  - (Do not show)

Calculate.Creature.Zone.Area.Data = 0

#
#     Calculate.Gameoject.Zone.Area.Data
#        Description: Calculate at loading gameobject zoneId / areaId and save in gameobject table (WARNING: SLOW WORLD SERVER STARTUP)
#        Default:     0  - (Do not show)

Calculate.Gameoject.Zone.Area.Data = 0

#
#     NoGrayAggro
#        Description: Gray mobs will not aggro players above/below some levels
#                     NoGrayAggro.Above: If player is at this level or above, gray mobs will not attack
#                     NoGrayAggro.Below: If player is at this level or below, gray mobs will not attack
#        Example:     You can for example make players free from gray until they reach level 30.
#                     Then gray will start to attack them, until they reach max level (80 for example):
#                     NoGrayAggro.Above = 80
#                     NoGrayAggro.Below = 29
#        Default: 0 - (Blizzlike)
#

NoGrayAggro.Above = 0
NoGrayAggro.Below = 0

#
#    PreventRenameCharacterOnCustomization
#        Description: If option is set to 1, player can not rename the character in character customization.
#                     Applies to all character customization commands.
#        Default:     0 - (Disabled, character can be renamed in Character Customization)
#                     1 - (Enabled, character can not be renamed in Character Customization)
#

PreventRenameCharacterOnCustomization = 0

#
#     Creature.CheckInvalidPosition
#        Description: Check possible invalid position for creatures at startup (WARNING: SLOW WORLD SERVER STARTUP)
#        Default:     0  - (Do not show)

Creature.CheckInvalidPosition = 0

#
#     GameObject.CheckInvalidPosition
#        Description: Check possible invalid position for game objects at startup (WARNING: SLOW WORLD SERVER STARTUP)
#        Default:     0  - (Do not show)

GameObject.CheckInvalidPosition = 0

#
###################################################################################################

###################################################################################################
# AUCTION HOUSE BOT SETTINGS
#
#    AuctionHouseBot.Account
#       Description: Account ID for AHBot characters. If non-zero, all auctions and bids associated
#                    with the AHBot will randomly be assigned one of this account's characters.
#       Default:     0
#

AuctionHouseBot.Account = 0

#
#    AuctionHouseBot.Update.Interval
#       Description: Interval in seconds for AHBot to get updated
#       Default:     20
#

AuctionHouseBot.Update.Interval = 20

#
#    AuctionHouseBot.Seller.Enabled
#       Description: General enable or disable AuctionHouseBot Seller functionality
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Seller.Enabled = 0

#
#    AuctionHouseBot.Alliance.Items.Amount.Ratio
#       Description: Enable/Disable (disabled if 0) the part of AHBot that puts items up for auction on Alliance AH
#       Default:     100 - (Enabled with 100% of items specified in AuctionHouse.Items.Amount.color section)

AuctionHouseBot.Alliance.Items.Amount.Ratio = 100

#
#    AuctionHouseBot.Horde.Items.Amount.Ratio
#        Enable/Disable (disabled if 0) the part of AHBot that puts items up for auction on Horde AH
#       Default: 100 (Enabled with 100% of items specified in AuctionHouse.Items.Amount.color section)

AuctionHouseBot.Horde.Items.Amount.Ratio = 100

#
#    AuctionHouseBot.Neutral.Items.Amount.Ratio
#       Description: Enable/Disable (disabled if 0) the part of AHBot that puts items up for auction on Neutral AH
#       Default:     100 - (Enabled with 100% of items specified in AuctionHouse.Items.Amount.color section)

AuctionHouseBot.Neutral.Items.Amount.Ratio = 100

#
#    AuctionHouseBot.MinTime
#       Description: Minimum time for the new auction in hours
#       Default: 1 - (Hour)

AuctionHouseBot.MinTime = 1

#
#    AuctionHouseBot.MaxTime
#       Description: Maximum time for the new auction in hours
#       Default:     72 - (Hours)

AuctionHouseBot.MaxTime = 72

#
#    AuctionHouseBot.Class.CLASS.Allow.Zero = 0
#       Description: Include items without a sell or buy price.
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Class.Consumable.Allow.Zero = 0
AuctionHouseBot.Class.Container.Allow.Zero = 0
AuctionHouseBot.Class.Weapon.Allow.Zero = 0
AuctionHouseBot.Class.Gem.Allow.Zero = 0
AuctionHouseBot.Class.Armor.Allow.Zero = 0
AuctionHouseBot.Class.Reagent.Allow.Zero = 0
AuctionHouseBot.Class.Projectile.Allow.Zero = 0
AuctionHouseBot.Class.TradeGood.Allow.Zero = 0
AuctionHouseBot.Class.Recipe.Allow.Zero = 0
AuctionHouseBot.Class.Quiver.Allow.Zero = 0
AuctionHouseBot.Class.Quest.Allow.Zero = 0
AuctionHouseBot.Class.Key.Allow.Zero = 0
AuctionHouseBot.Class.Misc.Allow.Zero = 0
AuctionHouseBot.Class.Glyph.Allow.Zero = 0

#
#    AuctionHouseBot.Items.Vendor
#       Description: Include items that can be bought from vendors.
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Items.Vendor = 0

#
#    AuctionHouseBot.Items.Loot
#       Description: Include items that can be looted or fished for.
#       Default:     1 - (Enabled)
#                    0 - (Disabled)

AuctionHouseBot.Items.Loot = 1

#
#    AuctionHouseBot.Items.Misc
#       Description: Include misc. items.
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Items.Misc = 0

#
#    AuctionHouseBot.Bind.*
#       Description: Indicates which bonding types to allow the bot to put up for auction
#                       No     - Items that don't bind            Default 1 (Allowed)
#                       Pickup - Items that bind on pickup        Default 0 (Not Allowed)
#                       Equip  - Items that bind on equip         Default 1 (Allowed)
#                       Use    - Items that bind on use           Default 1 (Allowed)
#                       Quest  - Quest Items                      Default 0 (Not Allowed)
#       Values:      0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Bind.No = 1
AuctionHouseBot.Bind.Pickup = 0
AuctionHouseBot.Bind.Equip = 1
AuctionHouseBot.Bind.Use = 1
AuctionHouseBot.Bind.Quest = 0

#
#    AuctionHouseBot.LockBox.Enabled
#       Description: Enable or not lockbox in auctionhouse
#       Default      0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.LockBox.Enabled = 0

#
#    AuctionHouseBot.ItemsPerCycle.Boost
#       Description: This value is used to fill AH faster than normal when there is more than this value on missed items (not auctioned items).
#                    Usually this value is only used once on server start with empty auction table.
#       Default:     1000

AuctionHouseBot.ItemsPerCycle.Boost = 1000

#
#    AuctionHouseBot.ItemsPerCycle.Normal
#       Description: This value is used to fill AH for sold and expired items. A high value will be more resource intensive
#                    Usually this value is used always when auction table is already initialised.
#       Default:     20

AuctionHouseBot.ItemsPerCycle.Normal = 20

#
#    AuctionHouseBot.BuyPrice.Seller
#       Description: Should the Seller use BuyPrice or SellPrice to determine Bid Prices
#       Default:     1 - (use SellPrice)
#                    0 - (use BuyPrice)

AuctionHouseBot.BuyPrice.Seller = 1

#
#    AuctionHouseBot.BidPrice.*
#       Description: These values determine the range that the Bid Price will fall into, as a percentage of the Buy Price
#       Default:     0.6 - (Min)
#                    0.9 - (Max)

AuctionHouseBot.BidPrice.Min = 0.6
AuctionHouseBot.BidPrice.Max = 0.9

#
#    AuctionHouseBot.Alliance.Price.Ratio
#       Description: Percentage by which the price of items selled on Alliance Auction House is incremented / decreased
#       Default:     100 - (Not modify)

AuctionHouseBot.Alliance.Price.Ratio = 100

#
#    AuctionHouseBot.Horde.Price.Ratio
#       Description: Percentage by which the price of items selled on Horde Auction House is incremented / decreased
#       Default:     100 - (Not modify)

AuctionHouseBot.Horde.Price.Ratio = 100

#
#    AuctionHouseBot.Neutral.Price.Ratio
#       Description: Percentage by which the price of items selled on Neutral Auction House is incremented / decreased
#       Default:     100 - (Not modify)

AuctionHouseBot.Neutral.Price.Ratio = 100

#
#    AuctionHouseBot.Items.QUALITY.Price.Ratio
#       Description: Percentage by which the price of items sold of each quality is incremented / decreased (for all houses)
#       Default:     100 - (No change)

AuctionHouseBot.Items.Gray.Price.Ratio = 100
AuctionHouseBot.Items.White.Price.Ratio = 100
AuctionHouseBot.Items.Green.Price.Ratio = 100
AuctionHouseBot.Items.Blue.Price.Ratio = 100
AuctionHouseBot.Items.Purple.Price.Ratio = 100
AuctionHouseBot.Items.Orange.Price.Ratio = 100
AuctionHouseBot.Items.Yellow.Price.Ratio = 100

#
#    AuctionHouseBot.Class.CLASS.Price.Ratio
#       Description: Percentage by which the price of items sold of each class is incremented / decreased (for all houses)
#       Default:   100 - (No change)

AuctionHouseBot.Class.Consumable.Price.Ratio = 100
AuctionHouseBot.Class.Container.Price.Ratio = 100
AuctionHouseBot.Class.Weapon.Price.Ratio = 100
AuctionHouseBot.Class.Gem.Price.Ratio = 100
AuctionHouseBot.Class.Armor.Price.Ratio = 100
AuctionHouseBot.Class.Reagent.Price.Ratio = 100
AuctionHouseBot.Class.Projectile.Price.Ratio = 100
AuctionHouseBot.Class.TradeGood.Price.Ratio = 100
AuctionHouseBot.Class.Generic.Price.Ratio = 100
AuctionHouseBot.Class.Recipe.Price.Ratio = 100
AuctionHouseBot.Class.Quiver.Price.Ratio = 100
AuctionHouseBot.Class.Quest.Price.Ratio = 100
AuctionHouseBot.Class.Key.Price.Ratio = 100
AuctionHouseBot.Class.Misc.Price.Ratio = 100
AuctionHouseBot.Class.Glyph.Price.Ratio = 100

#
#    AuctionHouseBot.Items.ItemLevel.*
#       Description: Prevent seller from listing items below/above this item level
#       Default:     0 - (Disabled)

AuctionHouseBot.Items.ItemLevel.Min = 0
AuctionHouseBot.Items.ItemLevel.Max = 0

#
#    AuctionHouseBot.Items.ReqLevel.*
#       Description: Prevent seller from listing items below/above this required level
#       Default:     0 - (Disabled)

AuctionHouseBot.Items.ReqLevel.Min = 0
AuctionHouseBot.Items.ReqLevel.Max = 0

#
#    AuctionHouseBot.Items.ReqSkill.*
#       Description: Prevent seller from listing items below/above this skill level
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Items.ReqSkill.Min = 0
AuctionHouseBot.Items.ReqSkill.Max = 0

#
#    AuctionHouseBot.Items.Amount.*
#       Description: Define here for every item qualities how many items you want to be shown in Auction House
#                    This value will be adjusted by AuctionHouseBot.FACTION.Items.Amount.Ratio to define the exact amount of
#                    items that will finally be shown on Auction House
#       Default:     0, 2000, 2500, 1500, 1000, 0, 0 (Gray, white, green, blue, purple, orange, yellow)

AuctionHouseBot.Items.Amount.Gray = 0
AuctionHouseBot.Items.Amount.White = 2000
AuctionHouseBot.Items.Amount.Green = 2500
AuctionHouseBot.Items.Amount.Blue = 1500
AuctionHouseBot.Items.Amount.Purple = 1000
AuctionHouseBot.Items.Amount.Orange = 0
AuctionHouseBot.Items.Amount.Yellow = 0

#
#    AuctionHouseBot.Class.*
#       Description: Here you can set the class of items you prefer to be show on AH
#                    These value are sorted by preference, from 0 (disabled) to 10 (max. preference)
#       Default:     Consumable: 6
#                    Container: 4
#                    Weapon: 8
#                    Gem: 3
#                    Armor: 8
#                    Reagent: 1
#                    Projectile: 2
#                    TradeGood: 10
#                    Generic: 1
#                    Recipe: 6
#                    Quiver: 1
#                    Quest: 1
#                    Key: 1
#                    Misc: 5
#                    Glyph: 3

AuctionHouseBot.Class.Consumable = 6
AuctionHouseBot.Class.Container = 4
AuctionHouseBot.Class.Weapon = 8
AuctionHouseBot.Class.Gem = 3
AuctionHouseBot.Class.Armor = 8
AuctionHouseBot.Class.Reagent = 1
AuctionHouseBot.Class.Projectile = 2
AuctionHouseBot.Class.TradeGood = 10
AuctionHouseBot.Class.Generic = 1
AuctionHouseBot.Class.Recipe = 6
AuctionHouseBot.Class.Quiver = 1
AuctionHouseBot.Class.Quest = 1
AuctionHouseBot.Class.Key = 1
AuctionHouseBot.Class.Misc = 5
AuctionHouseBot.Class.Glyph = 3

#
###################################################################################################

###################################################################################################
# AUCTION HOUSE BOT ITEM FINE TUNING
#
#    The following are usefull for limiting what character levels can
#    benefit from the auction house
#
#    AuctionHouseBot.Class.Misc.Mount.ReqLevel.*
#       Description: Prevent seller from listing mounts below/above this required level
#       Default:     0

AuctionHouseBot.Class.Misc.Mount.ReqLevel.Min = 0
AuctionHouseBot.Class.Misc.Mount.ReqLevel.Max = 0

#
#    AuctionHouseBot.Class.Misc.Mount.ReqSkill.*
#       Description: Prevent seller from listing mounts below/above this skill level
#       Default:     0

AuctionHouseBot.Class.Misc.Mount.ReqSkill.Min = 0
AuctionHouseBot.Class.Misc.Mount.ReqSkill.Max = 0

#
#    AuctionHouseBot.Class.Glyph.ReqLevel.*
#       Description: Prevent seller from listing glyphs below/above this required level
#       Default:     0

AuctionHouseBot.Class.Glyph.ReqLevel.Min = 0
AuctionHouseBot.Class.Glyph.ReqLevel.Max = 0

#
#    AuctionHouseBot.Class.Glyph.ItemLevel.*
#       Description: Prevent seller from listing glyphs below/above this item level
#       Default:     0

AuctionHouseBot.Class.Glyph.ItemLevel.Min = 0
AuctionHouseBot.Class.Glyph.ItemLevel.Max = 0

#
#    AuctionHouseBot.Class.TradeGood.ItemLevel.*
#       Description: Prevent seller from listing trade good items below/above this item level
#       Default:     0

AuctionHouseBot.Class.TradeGood.ItemLevel.Min = 0
AuctionHouseBot.Class.TradeGood.ItemLevel.Max = 0

#
#    AuctionHouseBot.Class.Container.ItemLevel.*
#       Description: Prevent seller from listing contianers below/above this item level
#       Default:     0

AuctionHouseBot.Class.Container.ItemLevel.Min = 0
AuctionHouseBot.Class.Container.ItemLevel.Max = 0

#
#    AuctionHouseBot.forceIncludeItems
#       Description: Include these items and ignore ALL filters
#                    List of ids with delimiter ','
#       Default:     ""

AuctionHouseBot.forceIncludeItems = ""

#
#    AuctionHouseBot.forceExcludeItems
#       Description: Exclude these items even if they would pass the filters
#                    List of ids with delimiter ','
#       Example:     "21878,27774,27811,28117,28122,43949" (this removes old items)
#       Default:     ""
#

AuctionHouseBot.forceExcludeItems = ""

#
#    AuctionHouseBot.Class.RandomStackRatio.*
#       Description: Used to determine how often a stack of the class will be single or randomly-size stacked when posted
#                    Value needs to be between 0 and 100, no decimal.  Anything higher than 100 will be treated as 100
#       Examples:    100 = stacks will always be random in size
#                    50 = half the time the stacks are random, the other half being single stack
#                    0 = stacks will always single size
#       Default:     Consumable: 20 (20% random stack size, 80% single stack size)
#                    Container: 0 (100% single stack size)
#                    Weapon: 0 (100% single stack size)
#                    Gem: 20 (20% random stack size, 80% single stack size)
#                    Armor: 0 (100% single stack size)
#                    Reagent: 100 (100% random stack size)
#                    Projectile: 100 (100% random stack size)
#                    TradeGood: 50 (50% random stack size, 50% single stack size)
#                    Generic: 100 (100% random stack size)
#                    Recipe: 0 (100% single stack size)
#                    Quiver: 0 (100% single stack size)
#                    Quest: 100 (100% random stack size)
#                    Key: 100 (100% random stack size)
#                    Misc: 100 (100% random stack size)
#                    Glyph: 0 (100% single stack size)
#

AuctionHouseBot.Class.RandomStackRatio.Consumable = 20
AuctionHouseBot.Class.RandomStackRatio.Container = 0
AuctionHouseBot.Class.RandomStackRatio.Weapon = 0
AuctionHouseBot.Class.RandomStackRatio.Gem = 20
AuctionHouseBot.Class.RandomStackRatio.Armor = 0
AuctionHouseBot.Class.RandomStackRatio.Reagent = 100
AuctionHouseBot.Class.RandomStackRatio.Projectile = 100
AuctionHouseBot.Class.RandomStackRatio.TradeGood = 50
AuctionHouseBot.Class.RandomStackRatio.Generic = 100
AuctionHouseBot.Class.RandomStackRatio.Recipe = 0
AuctionHouseBot.Class.RandomStackRatio.Quiver = 0
AuctionHouseBot.Class.RandomStackRatio.Quest = 100
AuctionHouseBot.Class.RandomStackRatio.Key = 100
AuctionHouseBot.Class.RandomStackRatio.Misc = 100
AuctionHouseBot.Class.RandomStackRatio.Glyph = 0

#
###################################################################################################

###################################################################################################
# AUCTION HOUSE BOT BUYER CONFIG
#
#    AuctionHouseBot.Buyer.Enabled
#       Description: General enable or disable AuctionHouseBot Buyer functionality
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Buyer.Enabled = 0

#
#    AuctionHouseBot.Buyer.FACTION.Enabled
#       Description: Enable or disable buyer independently by faction
#       Default:     0 - (Disabled)
#                    1 - (Enabled)

AuctionHouseBot.Buyer.Alliance.Enabled = 0
AuctionHouseBot.Buyer.Horde.Enabled = 0
AuctionHouseBot.Buyer.Neutral.Enabled = 0

#    AuctionHouseBot.Buyer.ChanceFactor
#       Description: k value in the formula used for the chance to buy an item "100^(1 + (1 - (AuctionBid / ItemPrice)) / k)"
#                    It must be a decimal number in the range of (0, +infinity). The higher the number the higher chance to buy overpriced auctions
#       Default:     2

AuctionHouseBot.Buyer.ChanceFactor = 2

#
#    AuctionHouseBot.Buyer.Baseprice.QUALITY
#       Description: Base sellprices in copper for non priced items for each quality.
#                    The default values are based on average item prices of each quality.
#       Defaults:    Gray   3504
#                    White  5429
#                    Green  21752
#                    Blue   36463
#                    Purple 87124
#                    Orange 214347
#                    Yellow 407406

AuctionHouseBot.Buyer.Baseprice.Gray = 3504
AuctionHouseBot.Buyer.Baseprice.White = 5429
AuctionHouseBot.Buyer.Baseprice.Green = 21752
AuctionHouseBot.Buyer.Baseprice.Blue = 36463
AuctionHouseBot.Buyer.Baseprice.Purple = 87124
AuctionHouseBot.Buyer.Baseprice.Orange = 214347
AuctionHouseBot.Buyer.Baseprice.Yellow = 407406

#
#    AuctionHouseBot.Buyer.ChanceMultiplier.QUALITY
#       Description: Multipliers for the buy/bid chances for each quality. 100 means the chance is 100% of the original,
#                    1 would mean 1 % of the original and 200 would mean 200% of the original chance.
#       Defaults:    Gray   100
#                    White  100
#                    Green  100
#                    Blue   100
#                    Purple 100
#                    Orange 100
#                    Yellow 100

AuctionHouseBot.Buyer.ChanceMultiplier.Gray = 100
AuctionHouseBot.Buyer.ChanceMultiplier.White = 100
AuctionHouseBot.Buyer.ChanceMultiplier.Green = 100
AuctionHouseBot.Buyer.ChanceMultiplier.Blue = 100
AuctionHouseBot.Buyer.ChanceMultiplier.Purple = 100
AuctionHouseBot.Buyer.ChanceMultiplier.Orange = 100
AuctionHouseBot.Buyer.ChanceMultiplier.Yellow = 100

#
#    AuctionHouseBot.Buyer.Recheck.Interval
#       Description: This specifies the time interval (in minutes) between two evaluations of the same sold item.
#                    The smaller this value is, the more chances you give for an item to be bought by ahbot.
#       Default:     20 (20min.)

AuctionHouseBot.Buyer.Recheck.Interval = 20

#
###################################################################################################

###################################################################################################
# BLACK MARKET SETTINGS
#
#    BlackMarket.Enabled
#       Description: General Enable or Disable of the Black Market.
#       Default:     1 - (Enabled)
#                    0 - (Disabled)
#

BlackMarket.Enabled = 1

#
#    BlackMarket.MaxAuctions
#       Description: Maximum amount of auctions present at the same time.
#       Default:     12
#

BlackMarket.MaxAuctions = 12

#
#    BlackMarket.UpdatePeriod
#       Description: How often are the auctions on the black market restored
#       Default:     24 (hours)
#

BlackMarket.UpdatePeriod = 24

#
#
###################################################################################################

###################################################################################################
# LOGGING SYSTEM SETTINGS
#
#  Appender config values: Given a appender "name"
#    Appender.name
#        Description: Defines 'where to log'.
#        Format:      Type,LogLevel,Flags,optional1,optional2,optional3
#
#                     Type
#                         0 - (None)
#                         1 - (Console)
#                         2 - (File)
#                         3 - (DB)
#
#                     LogLevel
#                         0 - (Disabled)
#                         1 - (Trace)
#                         2 - (Debug)
#                         3 - (Info)
#                         4 - (Warn)
#                         5 - (Error)
#                         6 - (Fatal)
#
#                     Flags:
#                         0 - None
#                         1 - Prefix Timestamp to the text
#                         2 - Prefix Log Level to the text
#                         4 - Prefix Log Filter type to the text
#                         8 - Append timestamp to the log file name. Format: YYYY-MM-DD_HH-MM-SS
#                             (Only used with Type = 2)
#                        16 - Make a backup of existing file before overwrite
#                             (Only used with Mode = w)
#
#                     Colors (read as optional1 if Type = Console)
#                         Format: "fatal error warn info debug trace"
#                         0 - BLACK
#                         1 - RED
#                         2 - GREEN
#                         3 - BROWN
#                         4 - BLUE
#                         5 - MAGENTA
#                         6 - CYAN
#                         7 - GREY
#                         8 - YELLOW
#                         9 - LRED
#                        10 - LGREEN
#                        11 - LBLUE
#                        12 - LMAGENTA
#                        13 - LCYAN
#                        14 - WHITE
#                         Example: "13 11 9 5 3 1"
#
#                     File: Name of the file (read as optional1 if Type = File)
#                         Allows to use one "%s" to create dynamic files
#
#                     Mode: Mode to open the file (read as optional2 if Type = File)
#                          a - (Append)
#                          w - (Overwrite)
#
#                     MaxFileSize: Maximum file size of the log file before creating a new log file
#                     (read as optional3 if Type = File)
#                         Size is measured in bytes expressed in a 64-bit unsigned integer.
#                         Maximum value is 4294967295 (4 gb). Leave blank for no limit.
#                         NOTE: Does not work with dynamic filenames.
#                         Example:  536870912 (512 mb)
#

Appender.Console=1,3,0
Appender.Server=2,2,0,Server.log,w
Appender.GM=2,2,15,gm/gm_%s.log
Appender.DBErrors=2,2,0,DBErrors.log

#  Logger config values: Given a logger "name"
#    Logger.name
#        Description: Defines 'What to log'
#        Format:      LogLevel,AppenderList
#
#                     LogLevel
#                         0 - (Disabled)
#                         1 - (Trace)
#                         2 - (Debug)
#                         3 - (Info)
#                         4 - (Warn)
#                         5 - (Error)
#                         6 - (Fatal)
#
#                     AppenderList: List of appenders linked to logger
#                     (Using spaces as separator).
#

Logger.root=5,Console Server
Logger.server=3,Console Server
Logger.commands.gm=3,Console GM
Logger.scripts.hotswap=3,Console Server
Logger.sql.sql=5,Console DBErrors
Logger.sql.updates=3,Console Server
Logger.mmaps=3,Server

#Logger.addon=3,Console Server
#Logger.ahbot=3,Console Server
#Logger.auctionHouse=3,Console Server
#Logger.bg.arena=3,Console Server
#Logger.bg.battlefield=3,Console Server
#Logger.bg.battleground=3,Console Server
#Logger.bg.reportpvpafk=3,Console Server
#Logger.chat.log=3,Console Server
#Logger.calendar=3,Console Server
#Logger.chat.system=3,Console Server
#Logger.cheat=3,Console Server
#Logger.commands.ra=3,Console Server
#Logger.condition=3,Console Server
#Logger.criteria=3,Console Server
#Logger.criteria.achievement=3,Console Server
#Logger.entities.areatrigger=3,Console Server
#Logger.entities.pet=3,Console Server
#Logger.entities.player.character=3,Console Server
#Logger.entities.player.dump=3,Console Server
#Logger.entities.player=3,Console Server
#Logger.entities.player.items=3,Console Server
#Logger.entities.player.loading=3,Console Server
#Logger.entities.player.skills=3,Console Server
#Logger.entities.transport=3,Console Server
#Logger.entities.unit=3,Console Server
#Logger.entities.vehicle=3,Console Server
#Logger.gameevent=3,Console Server
#Logger.guild=3,Console Server
#Logger.lfg=3,Console Server
#Logger.loot=3,Console Server
#Logger.maps.script=3,Console Server
#Logger.maps=3,Console Server
#Logger.misc=3,Console Server
#Logger.network=3,Console Server
#Logger.network.opcode=3,Console Server
#Logger.network.soap=3,Console Server
#Logger.outdoorpvp=3,Console Server
#Logger.phase=3,Console Server
#Logger.pool=3,Console Server
#Logger.rbac=3,Console Server
#Logger.scenes=3,Console Server
#Logger.scripts=3,Console Server
#Logger.scripts.ai=3,Console Server
#Logger.server.bnetserver=3,Console Server
#Logger.spells=3,Console Server
#Logger.spells.periodic=3,Console Server
#Logger.sql.dev=3,Console Server
#Logger.sql.driver=3,Console Server
#Logger.warden=3,Console Server

#
#    Log.Async.Enable
#        Description: Enables asyncronous message logging.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Log.Async.Enable = 0

#
#    Allow.IP.Based.Action.Logging
#        Description: Logs actions, e.g. account login and logout to name a few, based on IP of
#                     current session.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Allow.IP.Based.Action.Logging = 0

#
###################################################################################################

###################################################################################################
# CURRENCIES SETTINGS
#
#    Currency.ResetInterval
#        How often should currency week count reset (days)
#        Default: 7 (weekly)
#

Currency.ResetInterval = 7

#
#    Currency.ResetDay
#        Week day when currency week count is reset (0..6) 0 == Sunday
#        Default: 3 (Wednesday)
#

Currency.ResetDay = 3

#
#    Currency.ResetHour
#        Hour of a day when currency week count is reset (0..23)
#        Default: 6
#

Currency.ResetHour = 6

#
#    Currency.StartApexisCrystals
#        Amount of Apexis Crystals that new players will start with
#        Default: 0 (with precision)
#

Currency.StartApexisCrystals = 0

#
#    Currency.MaxApexisCrystals
#        Amount Apexis Crystals a player can have
#        Default: 20000
#

Currency.MaxApexisCrystals = 20000

#
#    Currency.StartJusticePoints
#        Amount of justice points that new players will start with
#        Default: 0 (with precision)
#

Currency.StartJusticePoints = 0

#
#    Currency.MaxJusticePoints
#        Amount justice points a player can have
#        Default: 4000
#

Currency.MaxJusticePoints = 4000

#
###################################################################################################

###################################################################################################
# PACKET SPOOF PROTECTION SETTINGS
#
# These settings determine which action to take when harmful packet spoofing is detected.
#
#    PacketSpoof.Policy
#        Description: Determines the course of action when packet spoofing is detected.
#        Default:     1 - (Log + kick)
#                     0 - (Log only 'network')
#                     2 - (Log + kick + ban)

PacketSpoof.Policy = 1

#
#    PacketSpoof.BanMode
#        Description: If PacketSpoof.Policy equals 2, this will determine the ban mode.
#        Note:        Banning by character not supported for logical reasons.
#        Default:     0 - Ban Account
#                     2 - Ban IP
#

PacketSpoof.BanMode = 0

#
#    PacketSpoof.BanDuration
#        Description: Duration of the ban in seconds. Only valid if PacketSpoof.Policy is set to 2.
#                     Set to 0 for permanent ban.
#        Default:     86400 seconds (1 day)
#

PacketSpoof.BanDuration = 86400

#
###################################################################################################

###################################################################################################
# METRIC SETTINGS
#
# These settings control the statistics sent to the metric database (currently InfluxDB)
#
#    Metric.Enable
#        Description: Enables statistics sent to the metric database.
#        Default:     0 - (Disabled)
#                     1 - (Enabled)

Metric.Enable = 0

#
#    Metric.Interval
#        Description: Interval between every batch of data sent in seconds
#        Default:     10 seconds
#

Metric.Interval = 10

#
#    Metric.ConnectionInfo
#        Description: Connection settings for metric database (currently InfluxDB).
#        Example:     "hostname;port;database"
#        Default:     "127.0.0.1;8086;worldserver"

Metric.ConnectionInfo = "127.0.0.1;8086;worldserver"

#
#    Metric.OverallStatusInterval
#        Description: Interval between every gathering of overall worldserver status data in seconds
#        Default:     1 second
#

Metric.OverallStatusInterval = 1

#
###################################################################################################