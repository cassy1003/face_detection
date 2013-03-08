namespace 'wrap.ajax', (exports) ->
  _type = 'GET'
  _cache = false
  _url = 'http://mydic.cassy.jp.net/server'

  exports.send = (data, type = _type, cache = _cache, url = _url) ->
    $.Deferred (d) ->
      $.ajax({
        type: type,
        url: url,
        data: data,
        cache: cache,
        success: (result) ->
          d.resolve result
      })
