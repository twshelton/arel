module Arel
  module SqlCompiler
    class SQLServerCompiler < GenericCompiler

      def limited_update_conditions(conditions, taken)
        quoted_primary_key = engine.quote_column_name(primary_key)
        "WHERE #{quoted_primary_key} IN (SELECT TOP #{taken} #{quoted_primary_key} FROM #{engine.connection.quote_table_name table.name} #{conditions})"
      end
      
      def delete_sql
        raise "limits placed on deletions not yet supported" unless taken.blank?
        super
      end

    end
  end
end
