for index, force in pairs(game.forces) do
	if force.technologies["fusion-railway"].researched then
		force.recipes['fusion-locomotive-mk1'].enabled = true
	end
end