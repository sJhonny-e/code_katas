def valid_string?(str)
    lower_bound = str[0].to_i
    upper_bound = str[2].to_i
    return false unless lower_bound.to_s == str[0] && upper_bound.to_s == str[2] 

    split_str = str.split(':')
    letter_to_find = split_str[0][-1]
    string_to_search = split_str[1]

    (lower_bound..upper_bound).include?(string_to_search.count(letter_to_find))
end