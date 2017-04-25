# module SQLite_Octo.SQL

function connect(; kw...)::SQLiteAdapter
    options = Dict(kw)
    SQLiteAdapter(SQLite.DB(options[:db]))
end
