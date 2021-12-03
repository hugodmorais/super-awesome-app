class Learn::Ranges::StarWarsMovie < Learn::Ranges::RangeableArray
  def values
    ['A New Hope', 'The Empire Strikes Back', 'Return of the Jedi', 'The Phantom Menace', 'Attack of the Clones', 'Revenge of the Sith', 'The Force Awakens', 'Rogue One', 'The Last Jedi', 'Solo', 'The Rise of Skywalker']
  end

  def error_message
    'Unknown Movie'
  end
end
