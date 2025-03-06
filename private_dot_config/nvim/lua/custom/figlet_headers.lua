local M = {}

M.run = function()
  local isAvailable, Job = pcall(require, 'plenary.job')

  if not isAvailable then
    return
  end

  Job:new({
    command = 'figsay',
    cwd = '/Users/yo/.nix-profile/bin',
    args = {
      '-t "Neovim"',
      '-f "BlurVision ASCII"'
    },
    on_exit = function(j, return_val)
      print(return_val)
      local result = j:result()
      for k in pairs(result) do
        print(k)
      end
    end,
  }):start()
end

-- M.run()

M.headers = {
  -- NOTE: All ascii-art generated with ~rogeruiz/figsay on sourcehut.

  { -- Impossible - https://patorjk.com/software/taag/#p=display&f=Impossible&t=Neovim
    [[         _             _            _      _          _        _         _   _       ]],
    [[        /\ \     _    /\ \         /\ \   /\ \    _ / /\      /\ \      /\_\/\_\ _   ]],
    [[       /  \ \   /\_\ /  \ \       /  \ \  \ \ \  /_/ / /      \ \ \    / / / / //\_\ ]],
    [[      / /\ \ \_/ / // /\ \ \     / /\ \ \  \ \ \ \___\/       /\ \_\  /\ \/ \ \/ / / ]],
    [[     / / /\ \___/ // / /\ \_\   / / /\ \ \ / / /  \ \ \      / /\/_/ /  \____\__/ /  ]],
    [[    / / /  \/____// /_/_ \/_/  / / /  \ \_\\ \ \   \_\ \    / / /   / /\/________/   ]],
    [[   / / /    / / // /____/\    / / /   / / / \ \ \  / / /   / / /   / / /\/_// / /    ]],
    [[  / / /    / / // /\____\/   / / /   / / /   \ \ \/ / /   / / /   / / /    / / /     ]],
    [[ / / /    / / // / /______  / / /___/ / /     \ \ \/ /___/ / /__ / / /    / / /      ]],
    [[/ / /    / / // / /_______\/ / /____\/ /       \ \  //\__\/_/___\\/_/    / / /       ]],
    [[\/_/     \/_/ \/__________/\/_________/         \_\/ \/_________/        \/_/        ]],
  },
  { -- isometric4.flf
    [[      ___           ___           ___                                      ___     ]],
    [[     /  /\         /  /\         /  /\          ___            ___        /  /\    ]],
    [[    /  /::|       /  /::\       /  /::\        /  /\          /__/\      /  /::|   ]],
    [[   /  /:|:|      /  /:/\:\     /  /:/\:\      /  /:/          \__\:\    /  /:|:|   ]],
    [[  /  /:/|:|__   /  /::\ \:\   /  /:/  \:\    /  /:/           /  /::\  /  /:/|:|__ ]],
    [[ /__/:/ |:| /\ /__/:/\:\ \:\ /__/:/ \__\:\  /__/:/  ___    __/  /:/\/ /__/:/_|::::\]],
    [[ \__\/  |:|/:/ \  \:\ \:\_\/ \  \:\ /  /:/  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/]],
    [[     |  |:/:/   \  \:\ \:\    \  \:\  /:/   |  |:|/  /:/  \  \::/           /  /:/ ]],
    [[     |__|::/     \  \:\_\/     \  \:\/:/    |__|:|__/:/    \  \:\          /  /:/  ]],
    [[     /__/:/       \  \:\        \  \::/      \__\::::/      \__\/         /__/:/   ]],
    [[     \__\/         \__\/         \__\/           ~~~~                     \__\/]],
  },
  { -- Shaded Blocky - https://patorjk.com/software/taag/#p=display&f=Shaded%20Blocky&t=Neovim
    [[ ░   ░░░  ░░        ░░░      ░░░  ░░░░  ░░        ░░  ░░░░  ░]],
    [[ ▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒   ▒▒   ▒]],
    [[ ▓  ▓  ▓  ▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓▓  ▓▓  ▓▓▓▓▓▓  ▓▓▓▓▓        ▓]],
    [[ █  ██    ██  ████████  ████  ████    ███████  █████  █  █  █]],
    [[ █  ███   ██        ███      ██████  █████        ██  ████  █]],
  },
  { -- Bloody - https://patorjk.com/software/taag/#p=display&f=Bloddy&t=Neovim
    [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
    [[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
    [[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
    [[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
    [[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
    [[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
    [[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
    [[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
    [[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
    [[                                ░                  ]],
  },
  { -- 3D diagonal https://patorjk.com/software/taag/#p=display&f=3D%20Diagonal&t=Neovim
    [[          ,--.                                                        ]],
    [[        ,--.'|                                                 ____   ]],
    [[    ,--,:  : |                                ,--,           ,'  , `. ]],
    [[ ,`--.'`|  ' :             ,---.            ,--.'|        ,-+-,.' _ | ]],
    [[ |   :  :  | |            '   ,'\      .---.|  |,      ,-+-. ;   , || ]],
    [[ :   |   \ | :   ,---.   /   /   |   /.  ./|`--'_     ,--.'|'   |  || ]],
    [[ |   : '  '; |  /     \ .   ; ,. : .-' . ' |,' ,'|   |   |  ,', |  |, ]],
    [[ '   ' ;.    ; /    /  |'   | |: :/___/ \: |'  | |   |   | /  | |--'  ]],
    [[ |   | | \   |.    ' / |'   | .; :.   \  ' .|  | :   |   : |  | ,     ]],
    [[ '   : |  ; .''   ;   /||   :    | \   \   ''  : |__ |   : |  |/      ]],
    [[ |   | '`--'  '   |  / | \   \  /   \   \   |  | '.'||   | |`-'       ]],
    [[ '   : |      |   :    |  `----'     \   \ |;  :    ;|   ;/           ]],
    [[ ;   |.'       \   \  /               '---" |  ,   / '---'            ]],
    [[ '---'          `----'                       ---`-'                   ]],
  },

  { -- BlurVision ASCII - https://patorjk.com/software/taag/#p=display&f=BlurVision%20ASCII&t=Neovim
    [[ ░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░  ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
    [[ ░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓██████▓▒░   ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
  },
  { -- o8.flf
    [[ oooo   oooo                                  o88                 ]],
    [[  8888o  88  ooooooooo8  ooooooo  oooo   oooo oooo  oo ooo oooo   ]],
    [[  88 888o88 888oooooo8 888     888 888   888   888   888 888 888  ]],
    [[  88   8888 888        888     888  888 888    888   888 888 888  ]],
    [[ o88o    88   88oooo888  88ooo88      888     o888o o888o888o888o ]],
  },
  {
    [[  __   __    _____   _____     _     _   __    __    __   ]],
    [[ /_/\ /\_\ /\_____\ ) ___ (   /_/\ /\_\ /\_\  /_/\  /\_\  ]],
    [[ ) ) \ ( (( (_____// /\_/\ \  ) ) ) ( ( \/_/  ) ) \/ ( (  ]],
    [[/_/   \ \_\\ \__\ / /_/ (_\ \/_/ / \ \_\ /\_\/_/ \  / \_\ ]],
    [[\ \ \   / // /__/_\ \ )_/ / /\ \ \_/ / // / /\ \ \\// / / ]],
    [[ )_) \ (_(( (_____\\ \/_\/ /  \ \   / /( (_(  )_) )( (_(  ]],
    [[ \_\/ \/_/ \/_____/ )_____(    \_\_/_/  \/_/  \_\/  \/_/  ]],
  },
  { -- Ghoulish - https://patorjk.com/software/taag/#p=display&f=Ghoulish&t=Neovim
    [[  )\  )\   )\.---.     .-./(       .-.  .'(   )\   )\  ]],
    [[ (  \, /  (   ,-._(  ,'     )  ,'  /  ) \  ) (  ',/ /  ]],
    [[  ) \ (    \  '-,   (  .-, (  (  ) | (  ) (   )    (   ]],
    [[ ( ( \ \    ) ,-`    ) '._\ )  ) './ /  \  ) (  \(\ \  ]],
    [[  `.)/  )  (  ``-.  (  ,   (  (  ,  (    ) \  `.) /  ) ]],
    [[     '.(    )..-.(   )/ ._.'   )/..'      )/      '.(  ]],
  },
  { -- smisome1.flf
    [[    ___       ___       ___       ___       ___       ___ ]],
    [[   /\__\     /\  \     /\  \     /\__\     /\  \     /\__\ ]],
    [[  /:| _|_   /::\  \   /::\  \   /:/ _/_   _\:\  \   /::L_L_ ]],
    [[ /::|/\__\ /::\:\__\ /:/\:\__\ |::L/\__\ /\/::\__\ /:/L:\__\ ]],
    [[ \/|::/  / \:\:\/  / \:\/:/  / |::::/  / \::/\/__/ \/_/:/  / ]],
    [[   |:/  /   \:\/  /   \::/  /   L;;/__/   \:\__\     /:/  / ]],
    [[   \/__/     \/__/     \/__/               \/__/     \/__/ ]],
  },
  { -- fraktur.flf
    [[     ...     ...                               _            . ]],
    [[  .=*8888n.."%888:                            u            @88> ]],
    [[ X    ?8888f '8888                     u.    88Nu.   u.    %8P      ..    .     : ]],
    [[ 88x. '8888X  8888>       .u     ...ue888b  '88888.o888c    .     .888: x888  x888. ]],
    [['8888k 8888X  '"*8h.   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~'888X`?888f` ]],
    [[ "8888 X888X .xH8    :888'8888.  888R I888>   8888  8888 ''888E`   X888  888X '888> ]],
    [[   `8" X888!:888X    d888 '88%"  888R I888>   8888  8888   888E    X888  888X '888> ]],
    [[  =~`  X888 X888X    8888.+"     888R I888>   8888  8888   888E    X888  888X '888> ]],
    [[   :h. X8*` !888X    8888L      u8888cJ888   .8888b.888P   888E    X888  888X '888> ]],
    [[  X888xX"   '8888..: '8888c. .+  "*888*P"     ^Y8888*""    888&   "*88%""*88" '888!` ]],
    [[:~`888f     '*888*"   "88888%      'Y"          `Y"        R888"    `~    "    `"` ]],
    [[    ""        `"`       "YP'                                "" ]],
  },
  { -- drpepper.flf
    [[  _ _  ___  ___  _ _  _  __ __ ]],
    [[ | \ || __>| . || | || ||  \  \]],
    [[ |   || _> | | || ' || ||     |]],
    [[ |_\_||___>`___'|__/ |_||_|_|_|]],
    [[                               ]],
  },
  { -- roman.flf
    [[ ooooo      ooo                                  o8o                    ]],
    [[ `888b.     `8'                                  `"'                    ]],
    [[  8 `88b.    8   .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.   ]],
    [[  8   `88b.  8  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b  ]],
    [[  8     `88b.8  888ooo888 888   888   `88..8'    888   888   888   888  ]],
    [[  8       `888  888    .o 888   888    `888'     888   888   888   888  ]],
    [[ o8o        `8  `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o ]],
    [[                                                                        ]],
  },
  { -- calgphy2.flf
    [[                                                                         ]],
    [[      ##### #     ##                                                     ]],
    [[   ######  /#    #### /                             #                    ]],
    [[  /#   /  / ##    ###/                             ###                   ]],
    [[ /    /  /  ##    # #                  ##           #                    ]],
    [[     /  /    ##   #                    ##                                ]],
    [[    ## ##    ##   #    /##       /###   ##    ### ###   ### /### /###    ]],
    [[    ## ##     ##  #   / ###     / ###  / ##    ### ###   ##/ ###/ /##  / ]],
    [[    ## ##     ##  #  /   ###   /   ###/  ##     ### ##    ##  ###/ ###/  ]],
    [[    ## ##      ## # ##    ### ##    ##   ##      ## ##    ##   ##   ##   ]],
    [[    ## ##      ## # ########  ##    ##   ##      ## ##    ##   ##   ##   ]],
    [[    #  ##       ### #######   ##    ##   ##      ## ##    ##   ##   ##   ]],
    [[       /        ### ##        ##    ##   ##      ## ##    ##   ##   ##   ]],
    [[   /##/          ## ####    / ##    ##   ##      /  ##    ##   ##   ##   ]],
    [[  /  #####           ######/   ######     ######/   ### / ###  ###  ###  ]],
    [[ /     ##             #####     ####       #####     ##/   ###  ###  ### ]],
    [[ #                                                                       ]],
    [[  ##                                                                     ]],
  },
  { -- Chiseled -- https://patorjk.com/software/taag/#p=display&f=Chiseled&t=Neovim
    [[  .-._           ,----.     _,.---._           ,-.-. .=-.-.       ___   ]],
    [[ /==/ \  .-._ ,-.--` , \  ,-.' , -  `.  ,--.-./=/ ,//==/_ /.-._ .'=.'\  ]],
    [[ |==|, \/ /, /==|-  _.-` /==/_,  ,  - \/==/, ||=| -|==|, |/==/ \|==|  | ]],
    [[ |==|-  \|  ||==|   `.-.|==|   .=.     \==\,  \ / ,|==|  ||==|,|  / - | ]],
    [[ |==| ,  | -/==/_ ,    /|==|_ : ;=:  - |\==\ - ' - /==|- ||==|  \/  , | ]],
    [[ |==| -   _ |==|    .-' |==| , '='     | \==\ ,   ||==| ,||==|- ,   _ | ]],
    [[ |==|  /\ , |==|_  ,`-._ \==\ -    ,_ /  |==| -  ,/|==|- ||==| _ /\   | ]],
    [[ /==/, | |- /==/ ,     /  '.='. -   .'   \==\  _ / /==/. //==/  / / , / ]],
    [[ `--`./  `--`--`-----``     `--`--''      `--`--'  `--`-` `--`./  `--`  ]],
  },
  { -- cosmic.flf
    [[ :::.    :::.  .,::::::        ...       :::      .::.  :::  .        :   ]],
    [[ `;;;;,  `;;;  ;;;;''''     .;;;;;;;.    ';;,   ,;;;'   ;;;  ;;,.    ;;;  ]],
    [[   [[[[[. '[[   [[cccc     ,[[     \[[,   \[[  .[[/     [[[  [[[[, ,[[[[, ]],
    [[   $$$ "Y$c$$   $$""""     $$$,     $$$    Y$c.$$"      $$$  $$$$$$$$"$$$ ]],
    [[   888    Y88   888oo,__   "888,_ _,88P     Y88P        888  888 Y88" 888o]],
    [[   MMM     YM   """"YUMMM    "YMMMMMP"       MP         MMM  MMM  M'  "MMM]],
  },
  { -- banner3-D.flf
    [[ '##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:]],
    [[  ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:]],
    [[  ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:]],
    [[  ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:]],
    [[  ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:]],
    [[  ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:]],
    [[  ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:]],
    [[ ..::::..::........:::.......::::::...:::::....::..:::::..::]],
  },
  { -- lean.flf
    [[                                                                    ]],
    [[     _/      _/                                  _/                 ]],
    [[    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/    ]],
    [[   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/   ]],
    [[  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/    ]],
    [[ _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/     ]],
    [[                                                                    ]],
  },
  { -- Rozzo - https://patorjk.com/software/taag/#p=display&f=Rozzo&t=Neovim
    [[ Y88b Y88                             ,e,             ]],
    [[  Y88b Y8  ,e e,   e88 88e  Y8b Y888P  "  888 888 8e  ]],
    [[ b Y88b Y d88 88b d888 888b  Y8b Y8P  888 888 888 88b ]],
    [[ 8b Y88b  888   , Y888 888P   Y8b "   888 888 888 888 ]],
    [[ 88b Y88b  "YeeP"  "88 88"     Y8P    888 888 888 888 ]],
    [[                                                      ]],
  },
  { -- smkeyboard.flf
    [[ ____ ____ ____ ____ ____ ____  ]],
    [[||N |||e |||o |||v |||i |||m || ]],
    [[||__|||__|||__|||__|||__|||__|| ]],
    [[|/__\|/__\|/__\|/__\|/__\|/__\| ]],
    [[ ]],
  },
  { -- poison.flf
    [[@@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@   ]],
    [[@@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@  ]],
    [[@@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!  ]],
    [[!@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!  ]],
    [[@!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@  ]],
    [[!@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!  ]],
    [[!!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:  ]],
    [[:!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:  ]],
    [[ ::   ::   :: ::::  ::::: ::    ::::     ::  :::     ::   ]],
    [[::    :   : :: ::    : :  :      :      :     :      :    ]],
    [[                                                          ]],
  },
  { -- peaks.flf
    [[ /^^^     /^^                                                ]],
    [[ /^ /^^   /^^                                /^              ]],
    [[ /^^ /^^  /^^   /^^       /^^    /^^     /^^   /^^^ /^^ /^^  ]],
    [[ /^^  /^^ /^^ /^   /^^  /^^  /^^  /^^   /^^ /^^ /^^  /^  /^^ ]],
    [[ /^^   /^ /^^/^^^^^ /^^/^^    /^^  /^^ /^^  /^^ /^^  /^  /^^ ]],
    [[ /^^    /^ ^^/^         /^^  /^^    /^/^^   /^^ /^^  /^  /^^ ]],
    [[ /^^      /^^  /^^^^      /^^        /^^    /^^/^^^  /^  /^^ ]],
  }
}

return M.headers
