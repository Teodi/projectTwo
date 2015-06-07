require "pg"

$db = PG.connect({
  dbname: 'teopedia'
})
