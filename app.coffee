
express = require('express')
routes = require('./routes')
http = require('http')
path = require('path')

compile = require("./compile")
compile.compileCore()
compile.compileWork()

app = express()

app.configure () ->
  app.set('port', process.env.PORT || 3003)
  app.set('views', __dirname + '/views')
  app.set('view engine', 'ejs')
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use(express.static(path.join(__dirname, 'public')))

app.configure 'development', () ->
  app.use(express.errorHandler())

app.get('/', routes.index)
app.get('/face', routes.face)

http.createServer(app).listen app.get('port'), () ->
  console.log("Express server listening on port " + app.get('port'))
