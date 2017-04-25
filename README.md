# SQLite_Octo

```julia
julia> Pkg.clone("https://github.com/wookay/Octo.jl.git")

julia> Pkg.clone("https://github.com/wookay/SQLite_Octo.jl.git")
```

```julia
julia> using SQLite_Octo

julia> adapter = SQL.connect(db="test.db")
SQLite_Octo.SQL.SQLiteAdapter(SQLite.DB("test.db"))

julia> u = table_from(adapter, "users")
FROM users

julia> u[*]
SELECT * FROM users
1×2 DataFrames.DataFrame
│ Row │ id │ name   │
├─────┼────┼────────┤
│ 1   │ 1  │ "John" │

julia> u[u.name]
SELECT name FROM users
1×1 DataFrames.DataFrame
│ Row │ name   │
├─────┼────────┤
│ 1   │ "John" │

julia> u[u.name](:where => u.id == 1)
SELECT name FROM users WHERE id = 1
1×1 DataFrames.DataFrame
│ Row │ name   │
├─────┼────────┤
│ 1   │ "John" │

julia> u[u.name](:where => u.id == 1, :limit => 3)
SELECT name FROM users WHERE id = 1 LIMIT 3
1×1 DataFrames.DataFrame
│ Row │ name   │
├─────┼────────┤
│ 1   │ "John" │

julia> # custom arrangement
       function SQL.arrange(io::IO, q::Queryable)
           write(io, "sqlite> ")
           write(io, QueryBuilders.colored_repr(q), ";\n")
           write(io, string(SQL.query(q)))
       end

julia> u[u.name](:where => u.id == 1, :limit => 3)
sqlite> SELECT name FROM users WHERE id = 1 LIMIT 3;
1×1 DataFrames.DataFrame
│ Row │ name   │
├─────┼────────┤
│ 1   │ "John" │
```
