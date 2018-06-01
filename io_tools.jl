module io_tools

function read_data(filename, delim = ',')
	open(filename) do f
		s = readstring(f)
		lines = split(s, '\n')
		data = map(line -> convert(Array{String}, split(line, delim)), lines)
		if length(data[1]) == 1
			data_arr = [row[1] for row in data]
		else
			data_arr = data
		end
		return data_arr
	end
end

end