# module SQLite_Octo.SQL

function arrange(::Type{DefaultArrangement}, io::IO, q::QueryBuilders.Queryable)
    write(io, QueryBuilders.colored_repr(q), "\n")
    write(io, string(SQL.query(q), "\n"))
end
