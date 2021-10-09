def valid_string?(str)
    lower_bound = str[0].to_i
    upper_bound = str[2].to_i

    split_str = str.split(':')
    letter_to_find = split_str[0][-1]
    string_to_search = split_str[1]

    (lower_bound..upper_bound).include?(string_to_search.count(letter_to_find))
end