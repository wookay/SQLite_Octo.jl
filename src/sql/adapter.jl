# module SQLite_Octo.SQL

type SQLiteAdapter <: QueryBuilders.AbstractAdapter
    db::Union{Void, SQLite.DB}
end
