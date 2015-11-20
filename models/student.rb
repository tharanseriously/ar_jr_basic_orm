class Student < Database::Model


  self.attribute_names =  [:id, :cohort_id, :first_name, :last_name, :email,
                           :gender, :birthdate, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  def cohort
    Cohort.where('id = ?', self[:cohort_id]).first
  end

  def cohort=(cohort)
    self[:cohort_id] = cohort[:id]
    self.save
    cohort
  end

  private

  # def insert!
  #   self.class[:created_at] = DateTime.now
  #   self.class[:updated_at] = DateTime.now

  #   fields = self.class.attributes.keys
  #   values = self.class.attributes.values
  #   marks  = Array.new(fields.length) { '?' }.join(',')

  #   if self.class == 'Student'
  #     insert_sql = "INSERT INTO students (#{fields.join(',')}) VALUES (#{marks})"
  #   elsif self.class == 'Cohort'
  #      insert_sql = "INSERT INTO cohorts (#{fields.join(',')}) VALUES (#{marks})"
  #   end

  #   results = Database::Model.execute(insert_sql, *values)

  #   # This fetches the new primary key and updates this instance
  #   self.class[:id] = Database::Model.last_insert_row_id
  #   results
  # end

  # def update!
  #   self[:updated_at] = DateTime.now

  #   fields = self.attributes.keys
  #   values = self.attributes.values

  #   update_clause = fields.map { |field| "#{field} = ?" }.join(',')

  #   if self.class == 'Student'
  #     update_sql = "UPDATE students SET #{update_clause} WHERE id = ?"
  #   elsif
  #     update_sql = "UPDATE cohorts SET #{update_clause} WHERE id = ?"
  #   end

  #   # We have to use the (potentially) old ID attribute in case the user has re-set it.
  #   Database::Model.execute(update_sql, *values, self.old_attributes[:id])
  # end
end
