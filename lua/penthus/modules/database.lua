--setfenv(1, getfenv(3)) --setting the fenv to the one we created

class "database" {
	public {
		___onLoaded = function(self)
			self:load()
		end;
		
		addTable = function(self, name)
			self.tables[name] = self.tables[name] or {}

			self:save()
		end;

		updateTable = function(self, tbl, data)
			if not self.tables[tbl] or not data then return end
			self.tables[tbl] = data

			self:save()
		end;

		getTable = function(self, name)
			return self.tables[name]
		end;
	};

	private {
		tables = {};
		lastSaved = 0;

		save = function(self)
			cookie.Set("penthus", util.TableToJSON(self.tables))
			self.lastSaved = CurTime()
		end;

		load = function(self)
			local tmpData = cookie.GetString("penthus", "nope")
			if tmpData == "nope" then return end

			self.tables = util.JSONToTable(tmpData)
		end;
	};
}