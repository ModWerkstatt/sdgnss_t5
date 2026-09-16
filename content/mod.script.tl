local mod = {}

mod.postRunFn = function(captureParams : NativeLuaTable, configDict : {{string, string}}, allModParams : {string : {string : integer}} )
	log.message("postRunFn called")

	local ganzzug_hide: {{string}} = {
		[1] = { 
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_lkw_walter.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_wetron.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_winner.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_hupac_ganzzug_lkw_walter.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_hupac_ganzzug_wetron.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_hupac_ganzzug_winner.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_hupac_trailer.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_hupac2_trailer.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/sdgnss_t5_wascosa_trailer.mdl",
		},
		[2] = { }
	}
	local fake_hide: {{string}} = {
		[1] = {
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_lkw_walter.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_wetron.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_ganzzug_winner.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac_trailer.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac2.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_hupac2_trailer.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_wascosa.mdl",
			"mw_sdgnss_t5::/vehicle/waggon/sdgnss_t5/fake_sdgnss_t5_wascosa_trailer.mdl",
		},
		[2] = { }
	}
	
	local selectedfilter_ganzzug: integer = allModParams[getCurrentModId()].sdgnss_t5_ganzzug

	for _, v in ipairs(ganzzug_hide[selectedfilter_ganzzug]) do
		debugPrint("hide " .. v .. api.res.modelRep.find(v))
		api.res.modelRep.setVisible(api.res.modelRep.find(v), false)
	end

	local selectedfilter_fake: integer = allModParams[getCurrentModId()].sdgnss_t5_fake

	for _, v in ipairs(fake_hide[selectedfilter_fake]) do
		debugPrint("hide " .. v .. api.res.modelRep.find(v))
		api.res.modelRep.setVisible(api.res.modelRep.find(v), false)
	end
	

end

return mod