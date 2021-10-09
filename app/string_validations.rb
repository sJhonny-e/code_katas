def valid_string?(str)
    lower_bound, upper_bound = bounds(str)
    return false if lower_bound.nil? || upper_bound.nil?

    letter_to_find, string_to_search = letter_and_string_to_search(str)
    (lower_bound..upper_bound).include?(string_to_search.count(letter_to_find))
end

def valid_string_with_pos?(str)
    positions = bounds(str)
    return false if positions.include?(nil)

    letter_to_find, string_to_search = letter_and_string_to_search(str)
    positions.select {|i| string_to_search[i] == letter_to_find}.count == 1
end

def bounds(str)
    range_strs = str.split('-')
    return [nil, nil] unless range_strs.length == 2
    lower_bound_str = range_strs[0]
    upper_bound_str = range_strs[1].split.first
    lower_bound = lower_bound_str.to_i
    upper_bound = upper_bound_str.to_i
    return [nil, nil] unless lower_bound.to_s == lower_bound_str && upper_bound.to_s == upper_bound_str 

    [lower_bound, upper_bound]
end

def letter_and_string_to_search(str)
    split_str = str.split(':')
    letter_to_find = split_str[0][-1]
    string_to_search = split_str[1]
    [letter_to_find, string_to_search]
end