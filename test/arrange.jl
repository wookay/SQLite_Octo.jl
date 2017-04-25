using SQLite_Octo
using Base.Test

adapter = SQL.connect(db="test.db")
@test !isa(adapter.db, Void)

u = table_from(adapter, "users")
@test repr(u) == "FROM users"
@test repr(u[*]) == "SELECT * FROM users"
@test repr(u[u.id]) == "SELECT id FROM users"

SQL.arrange(DefaultArrangement, STDOUT, u[*](:where => and(u.id == 1, u.name == "John")))
println()

# custom arrangement
function SQL.arrange(io::IO, q::Queryable)
    write(io, "sqlite> ")
    write(io, QueryBuilders.colored_repr(q), ";\n")
    write(io, string(SQL.query(q), "\n"))
end

Octo.Text.colors[:keyword] = :bold

SQL.arrange(STDOUT, u[*](:where => and(u.id == 1, u.name == "John")))

Octo.Text.colors[:keyword] = :normal

SQL.arrange(STDOUT, u[u.name](:where => and(u.id == 1, u.name == "John")))

SQL.arrange(STDOUT, u[u.name, u.id](:where => and(u.id == 1, u.name == "John"), :limit => 2))
