require_relative 'app'

cohort = Cohort.find(1)
p cohort
cohort.attributes[:name] = 'IT WORKS'
cohort.save

p cohort