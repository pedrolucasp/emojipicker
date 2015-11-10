app           = require('app')
BrowserWindow = require('browser-window')

# Report crashs
require('crash-reporter').start()

mainWindow = null

# Only quit when user type Cmd + Q on OSX
app.on 'window-all-closed', ->
  app.quit() if process.platform != "darwin"

# When Electron finish doing all the heavy work for us
app.on 'ready', ->
  mainWindow = new BrowserWindow({width: 800, height: 600})
  # load the index.html
  mainWindow.loadUrl('file://' + __dirname + '/browser/index.html')

# Dispose our Window
app.on 'closed', ->
  mainWindow = null
