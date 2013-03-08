
exec = require('child_process').exec

exports.compileCore = ->
  console.log 'compile core.js'
  cmd = 'coffee -j public/javascripts/core.js -cwb public/coffeescripts/core'
  result = 'none'
  exec cmd, (err, stdout, stderr) ->
    unless err?
      console.log 'stdout: ' + stdout
      console.log 'success'
      result = stdout
    else
      console.log 'error'

exports.compileWork = ->
  console.log 'compile work.js'
  cmd = 'coffee -j public/javascripts/work.js -cwb public/coffeescripts/work'
  exec cmd, (err, stdout, stderr) ->
    unless err?
      console.log 'success'
    else
      console.log 'error cmd2'
