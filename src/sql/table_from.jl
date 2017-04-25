# module SQLite_Octo.SQL

function table_from(adapter::QueryBuilders.AbstractAdapter, tablename::String)
    so = SQL.prepare(adapter, QueryBuilders.FromClause(tablename))
    fields = tuple(map(Symbol, so.schema.header)...)
    Octo.Adapters.Base.build_table(adapter, tablename, nothing, fields)
end
