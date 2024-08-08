require "pg"

class DatabasePersistance
  def initialize(logger)
    @db =  PG.connect(dbname: "contacts")
    @logger = logger
  end

  def query(sql, *params)
    @logger.info "#{sql}: #{params}"
    @db.exec_params(sql, params)
  end

  def all_contacts
    sql = "SELECT * FROM contacts"
    result = query(sql)
    result.map do |tuple|
      {id: tuple["id"],
       name: tuple["name"],
       email: tuple["email"],
       phone_number: tuple["phone_number"],
       date_added: tuple["date_added"]
      }
    end
  end

  def add_contact(name, number, email)
    sql = "INSERT INTO contacts(name, email, phone_number) VALUES ($1, $2, $3)"
    query(sql, name, email, number)
  end

  def delete_contact(contact_id)
    sql = "DELETE FROM contacts WHERE id = $1"
    query(sql, contact_id)
  end

end