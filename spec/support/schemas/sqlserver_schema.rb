sql = <<-SQL
  if exists (select * from dbo.sysobjects where id = object_id(N'[hrtappadmin].[users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
    drop table [hrtappadmin].[users];

  CREATE TABLE users (
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL
  );

  if exists (select * from dbo.sysobjects where id = object_id(N'[hrtappadmin].[photos]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
     drop table [hrtappadmin].[photos];

  CREATE TABLE photos (
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    camera_id INTEGER NOT NULL
  );
  
  if exists (select * from dbo.sysobjects where id = object_id(N'[hrtappadmin].[developers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
     drop table [hrtappadmin].[developers];
  
  CREATE TABLE developers (
    id INTEGER NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL,
    department VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
  )
SQL

sql.split(/;/).select(&:present?).each do |sql_statement|
  ActiveRecord::Base.connection.execute sql_statement
end
