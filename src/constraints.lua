local kiwi = require('lib.kiwi.kiwi')

local solver = kiwi.solver()
local x1 = kiwi.variable('x1')
local x2 = kiwi.variable('x2')
local x2 = kiwi.variable('x2')

local vars = {x1 = x1, x2 = x2}

solver:add_constraint(kiwi.parse_constraint(vars, 'x1 >= 0'))
solver:add_constraint(kiwi.parse_constraint(vars, 'x2 >= 0'))
solver:add_constraint(kiwi.parse_constraint(vars, 'x1 == 3 x2'))

solver:add_constraint(kiwi.parse_constraint(vars, 'x1 == 3 x2'))

solver:add_edit_variable(x1, kiwi.strength.medium)
solver:suggest_value(x1, 10)

solver:update_variables()

print(x1.value, x2.value)
solver:update_variables()

print(x1.value, x2.value)
