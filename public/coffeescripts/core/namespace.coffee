window.namespace = (target, name, block) ->
  if arguments.length < 3
    [target, name, block] = [(if exports? then exports else window), arguments...]

  top = target
  target = target[item] or= {} for item in name.split('.')
  block target, top

window.use = (ns) ->
  namespace ns, (exports) -> exports
