class RocketModule
  attr_accessor :mass

  def initialize(mass:)
    @mass = mass
  end

  def fuel_required
    (@mass / 3.0).floor - 2
  end

  def total_fuel
    return 0 if fuel_required <= 0

    fuel_required + RocketModule.new(mass: fuel_required).total_fuel
  end
end

class Rocket
  attr_accessor :modules

  def initialize(modules:)
    @modules = modules
  end

  def fuel_required
    modules.map(&:fuel_required).sum
  end

  def total_fuel_required
    modules.map(&:total_fuel).sum
  end
end

# Helpers
def fuel_required(module_masses)
  modules = module_masses.map { |m| RocketModule.new(mass: m) }
  Rocket.new(modules: modules).fuel_required
end

def total_fuel_required(module_masses)
  modules = module_masses.map { |m| RocketModule.new(mass: m) }
  Rocket.new(modules: modules).total_fuel_required
end

# Input
masses = [51753, 53456, 128133, 118219, 136490, 113318, 134001, 99775, 84746, 68712, 104274, 72530, 101517, 65533, 98719, 100215, 144296, 114166, 62930, 118494, 144800, 97604, 112836, 73074, 62591, 99278, 94544, 73035, 146631, 148331, 144573, 121956, 94088, 60092, 126397, 117285, 122292, 77413, 145860, 76968, 64790, 58479, 94035, 148441, 78999, 74329, 145182, 129497, 106765, 67046, 58702, 123344, 63866, 121123, 126808, 115190, 86467, 136359, 148718, 88225, 126185, 82745, 142546, 149788, 137524, 114690, 68075, 60244, 127157, 123719, 87843, 107714, 51281, 92123, 146495, 50761, 130708, 53103, 75289, 121675, 61726, 70674, 101755, 97736, 100141, 81085, 55493, 73071, 85321, 119965, 147313, 105201, 107107, 130007, 67834, 137614, 140848, 64038, 106078, 71447]
print("Total fuel required is #{fuel_required(masses)}\n")
print("Recursive total fuel required is #{total_fuel_required(masses)}\n")
