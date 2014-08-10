class ExportBackup
	DEFAULT_EXPORT_TABLES = [ DataSource ]
	DESTINATION_FOLDER = "tmp/"
	 
	def self.export_tables_to_csv(tables = DEFAULT_EXPORT_TABLES)
		tables.each { |klass| export_table_to_csv(klass) }
	end
	 
	def self.export_table_to_csv(klass)		
		output_file = File.open(filename_for_class(klass), "w")		
		output_file << klass.attribute_names.to_csv
		klass.all.each{ |row| output_file << row.attributes.values.to_csv }
		output_file.close
	end
	 
	def self.filename_for_class(klass)
		DESTINATION_FOLDER + klass.to_s.underscore + '.csv'
	end
end