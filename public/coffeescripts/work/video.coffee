
namespace 'sample.video', (exports) ->
  _videoUrl = ''

  exports.show = () ->
    $('#localVideo').attr 'src', _videoUrl

  exports.hide = () ->
    $('#localVideo').attr 'src', ''
    sample.face.drawEnd()

  exports.on = () ->
    getUserMedia()

  getUserMedia = () ->
    try
      navigator.webkitGetUserMedia(
        {audio:true, video:true},
        onUserMediaSuccess,
        onUserMediaError
      )
      console.log("Requested access to local media with new syntax.")
    catch e1
      try
        navigator.webkitGetUserMedia(
          "video,audio",
          onUserMediaSuccess,
          onUserMediaError
        )
        console.log("Requested access to local media with old syntax.")
      catch e2
        alert("webkitGetUserMedia() failed. Is the MediaStream flag enabled in about:flags?")
        console.log("webkitGetUserMedia failed with exception: " + e.message)

  onUserMediaSuccess = (stream) ->
    console.log("User has granted access to local media.")
    _videoUrl = webkitURL.createObjectURL(stream)

  onUserMediaError = (error) ->
    console.log("Failed to get access to local media. Error code was " + error.code)

