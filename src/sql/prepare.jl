# module SQLite_Octo.SQL

function prepare(adapter::QueryBuilders.AbstractAdapter, from::QueryBuilders.FromClause)
    tablename = from.tablename
    SQLite.Source(adapter.db, "SELECT * FROM $tablename LIMIT 0")
end
