# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    # Your code Here
    $candidates.find { |candidate| candidate[:id] == id}
  end
  
  def experienced?(candidate)
    # Your code Here
    candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    candidates.select do |candidate|
      experienced?(candidate) &&
      github_points?(candidate) &&
      knows_languages?(candidate) &&
      applied_recently?(candidate) &&
      of_age?(candidate)
    end
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end

  
  # More methods will go below

  def github_points?(candidate)
    candidate[:github_points] >= 100
  end

  def knows_languages?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  def applied_recently?(candidate)
    (Date.today - candidate[:date_applied]) <= 15
  end

  def of_age?(candidate)
    candidate[:age] >= 18
  end