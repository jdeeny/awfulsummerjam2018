local Words = class('Words')

function Words.test()
  local response = datamuse.lookup("rel_syn=unnecessary&v=enwiki&max=30")
  local output = ""

  local obj, pos, err = json.decode(response, 1, nil)
  if err then
    print ("JSON Error: " .. err)
  else

    for i,v in ipairs(obj) do
        local tags = ""
        --[[for i,v in ipairs(v.tags) do
          tags = tags .. " " .. v
        end]]
        local score = v.score or 0
        output = output .. v.word .. "\n"
        print(pl.pretty.write(v))
        print("# ".. i)

    end
    print(output)
    print("----")
    local out = ""
  end
  return output
end

return Words
