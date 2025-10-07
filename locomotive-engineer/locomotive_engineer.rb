class LocomotiveEngineer
  def self.generate_list_of_wagons(*list)
    @@list = list
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    one_id, two_id, locomotive_one, *one_wagon_ids = each_wagons_id
    first_wagon, *other_missing_wagons = missing_wagons

    [locomotive_one, first_wagon, other_missing_wagons, one_wagon_ids, one_id, two_id].flatten
  end

  def self.add_missing_stops(route_range, *stops)
    route_range.merge(stops: stops.reduce(:merge).to_h.values)
  end

  def self.extend_route_information(route, more_route_information)
    # raise 'Please implement the LocomotiveEngineer.extend_route_information method'
    route.merge(more_route_information)
  end
end
