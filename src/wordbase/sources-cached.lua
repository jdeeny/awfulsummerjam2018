local contents, size = love.filesystem.read('sources.bin')
if type(size) == 'number' and size > 0 then
  print("Load cache!")
  --local contents = love.data.decompress('data', love.data.unpack(contents))
  local sources = pl.pretty.read(contents)

  if sources then
    --return sources
  end
end

return require('src.wordbase.sources')
