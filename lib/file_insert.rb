
def prep_file(path)
  headers_path = path.gsub(".txt", "-with-headers.txt")
  File.write(headers_path, "state_abbr,sex,year,name,frequency")

  system("cat -v #{path} | sed -e 's/\^M//' >> #{headers_path}")

  headers_path
end

def insert_file(path)
  system("psql -d my_database_development -c \"COPY state_birth_names (state_abbr,sex,year,name,frequency) FROM '#{path}' WITH CSV HEADER\"")
end