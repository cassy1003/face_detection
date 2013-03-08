
exports.index = (req, res) ->
  res.render 'index',
    title: 'Index'

exports.face = (req, res) ->
  res.render 'face',
    title: 'Face Recognition'
