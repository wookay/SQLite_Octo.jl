# module SQLite_Octo.SQL

function execute(adapter::QueryBuilders.AbstractAdapter, commands::String)
    print_with_color(:bold, commands, "\n")
    df = SQLite.query(adapter.db, commands)
    print_with_color(:normal, string(df), "\n")
end
