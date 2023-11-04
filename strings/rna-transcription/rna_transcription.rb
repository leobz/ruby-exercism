module Complement
    @rna = {"G" => "C", "C" => "G", "T" => "A", "A" => "U"}

    def self.of_dna(string)
        string.chars.map {|c| @rna[c]}.join
    end
end