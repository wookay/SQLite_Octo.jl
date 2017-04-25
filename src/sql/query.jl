# module SQLite_Octo.SQL

function query(q::QueryBuilders.Queryable)
    SQLite.query(q.adapter.db, repr(q))
end
