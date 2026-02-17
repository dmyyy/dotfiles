import os
import platform

import catppuccin

c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

config.load_autoconfig(False) # don't load from gui

# Fix 'TrustedHTML' error
c.content.javascript.log_message.excludes = {
    "userscript:_qute_stylesheet": [
        "*Refused to apply inline style because it violates the following Content Security Policy directive: *"
    ],
    "userscript:_qute_js": ["*TrustedHTML*"],
}

# --------------------------------theme--------------------------------
# catpuccin as reasonable base
catppuccin.setup(c, 'mocha', True)# pylint: disable=C0111

# manual tweaks
c.colors.tabs.even.bg = "#26233a"
c.colors.tabs.odd.bg = "#26233a"
c.colors.tabs.selected.even.bg = "#6e6a86"
c.colors.tabs.selected.odd.bg = "#6e6a86"
c.colors.statusbar.insert.bg = "#6e6a86"
c.colors.statusbar.caret.bg = "#6e6a86"

c.window.hide_decoration = True

c.tabs.title.format = "{audio}{current_title}"
c.tabs.show = "multiple"
c.tabs.width = '25%'
c.tabs.position = "left"

c.content.autoplay = False

# https://app.raindrop.io/my/0
#
# TODO:
# - randomly choose an image and load that instead!
# file:///Users/dmy/OneDrive/Pictures/art/inspiration/environment/elden_ring/1%20-%20AOXbUSm.jpg# 
# 
c.url.default_page = 'https://web.tabliss.io/'
c.url.start_pages = ['https://web.tabliss.io/']

c.keyhint.delay = 0

c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!aw': 'https://wiki.archlinux.org/?search={}',
    '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
    '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
    '!yt': 'https://www.youtube.com/results?search_query={}',
}

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

c.auto_save.session = True # save tabs on quit/restart

# Look here for more inspiration
# https://codeberg.org/Frestein/dotfiles/src/commit/a4a92e2b8a582509f4ff1552b1d296512eb331e8/dot_config/private_qutebrowser/config.py.tmpl#L83 

c.editor.command = [
    "alacritty",
    "hx",
    "{file}",
    "+{line}",
]

# use yazi for file selection
c.fileselect.handler = "external"
yazi_chooser = [
    "alacritty",
    "--",
    "--title",
    "yazi-flt",
    "yazi",
    "--chooser-file",
    "{}",
]
c.fileselect.single_file.command = yazi_chooser
c.fileselect.multiple_files.command = yazi_chooser
c.fileselect.folder.command = yazi_chooser

# --------------------keys--------------------
# normal
config.bind('ge', 'scroll-to-perc 100')
config.bind('<Ctrl-j>', 'tab-next')
config.unbind('J', mode='normal')
config.bind('<Ctrl-k>', 'tab-prev')
config.unbind('K', mode='normal')
config.bind('<Ctrl-o>', 'back')
config.unbind('H', mode='normal')
config.bind('<Ctrl-i>', 'forward')
config.unbind('L', mode='normal')
config.bind('<Alt-i>', 'tab-move +')
config.bind('<Alt-o>', 'tab-move -')
config.bind('gn', 'open -t')
config.bind('<Space>,r', 'config-source')
config.bind('<Space>e', 'config-cycle tabs.show multiple never')
config.bind('sh', 'config-cycle statusbar.show always never')
config.bind("cm", "clear-messages") 

# control video speed
config.bind("<Up>",     "jseval document.querySelector('video').playbackRate += 0.25;") 
config.bind("<Down>",   "jseval document.querySelector('video').playbackRate -= 0.25;") 

# search for the current URL in archive.org's wayback machine
config.bind(",w", "open http://web.archive.org/{url}")

# caret
config.bind('gl', 'move-to-end-of-line', mode='caret')
config.bind('gh', 'move-to-start-of-line', mode='caret')
config.bind('ge', 'move-to-end-of-document', mode='caret')


# todo: do i need this
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cc', 'hint images spawn sh -c "cliphist link {hint-url}"')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gm', 'tab-move')

# dark mode setup
# c.colors.webpage.darkmode.enabled = True
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.policy.images = 'never'
# config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
c.content.user_stylesheets = ["~/.qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators

# fonts
c.fonts.default_family = "San Francisco"
c.fonts.default_size = '16pt'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# --------------------adblock--------------------
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]

# --------------------keepassxc--------------------
if platform.system() == "Darwin":
    # MacOS requires a different socket path
    socket_path = os.path.join(os.environ["TMPDIR"], "org.keepassxc.KeePassXC.BrowserServer")
    config.bind(
        '<Alt-Shift-u>',
        f"spawn --userscript qute-keepassxc --key FCE4350814537D0C6DAAC712DF20929362CA2E48 --socket {socket_path}",
        mode='insert'
    )
    config.bind(
        'pw',
        f"spawn --userscript qute-keepassxc --key FCE4350814537D0C6DAAC712DF20929362CA2E48 --socket {socket_path}",
        mode='normal'
    )
# default linux setup!
# config.bind('<Alt-Shift-u>', 'spawn --userscript qute-keepassxc --key FCE4350814537D0C6DAAC712DF20929362CA2E48', mode='insert')
# config.bind('pw', 'spawn --userscript qute-keepassxc --key FCE4350814537D0C6DAAC712DF20929362CA2E48', mode='normal')
