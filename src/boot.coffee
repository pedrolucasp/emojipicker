app           = require('app')
BrowserWindow = require('browser-window')
menubar       = require('menubar')
globalShorcut = require('global-shortcut')
Menu          = require('menu')

appOptions = {
  dir: __dirname + '/browser'
  width: 600
  height: 300
  preloadWindow: true
  icon: __dirname + '/browser/IconTemplate.png'
  showDockIcon: true
  'always-on-top': true
  'window-position': 'topRight'
}

mb = menubar(appOptions)
# Report crashs
require('crash-reporter').start()

# Our template menu
template = [
  {
    label: 'EmojiPicker',
    submenu: [
      {
        label: 'Copy',
        accelerator: 'Command+C',
        selector: 'copy:'
      },
      {
        label: 'Quit App',
        accelerator: 'Command+Q',
        selector: 'terminate:'
      },
    ]
  }
]


# When Electron finish doing all the heavy work for us
mb.on 'ready', ->
  # Menu
  menu = Menu.buildFromTemplate template
  Menu.setApplicationMenu menu

  # Shortcuts
  shortcut = globalShorcut.register 'ctrl+shift+space', ->
    if mb.window.isVisible() then mb.hideWindow() else mb.showWindow()

  quitShotcut = globalShorcut.register 'esc', ->
    mb.hideWindow() if mb.window.isVisible()

  console.log "Failed to Register Shortcut" unless shortcut


# Dispose our Window
mb.app.on 'will-quit', ->
  globalShorcut.unregisterAll()
