local contents, size = love.filesystem.read('sources.bin')
if type(size) == 'number' and size > 0 then
  print("Load cache!")
  local contents = love.math.decompress(contents, 'lz4')
  local sources = pl.pretty.read(contents)

  if sources then
    return sources
  end
end

return require('src.wordbase.sources')
