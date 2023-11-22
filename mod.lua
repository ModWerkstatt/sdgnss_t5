function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "schweiz", "db", "waggon", "goods", "Intermodal", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

		params = {
			{
				key = "sdgnss_t5_fake",
				name = _("Fake_sdgnss_t5_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_wagen_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},

	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["hupac_fake.mdl"] = true,
			["hupac2_fake.mdl"] = true,
			["wascosa_fake.mdl"] = true,
			["hupac_fake_walter.mdl"] = true,
			["hupac_fake_wetron.mdl"] = true,
			["hupac_fake_winner.mdl"] = true,
			["hupac2_fake_walter.mdl"] = true,
			["hupac2_fake_wetron.mdl"] = true,
			["hupac2_fake_winner.mdl"] = true,
			["wascosa_fake_walter.mdl"] = true,
			["wascosa_fake_winner.mdl"] = true,
			["wascosa_fake_wetron.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/sdgnss_t5_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["sdgnss_t5_fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
