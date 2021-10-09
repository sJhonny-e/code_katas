def give_product(numbers)
    desired_sum = 2020
    elements = do_find_numbers(numbers, desired_sum, 2)
    elements.reduce(1) {|prod, n| prod * n}
end

def give_product_three(numbers)
    desired_sum = 2020
    elements = do_find_numbers(numbers, desired_sum, 3)
    elements.reduce(1) {|prod, n| prod * n}
end

def do_find_numbers(numbers, desired_sum, number_of_elements)
    return [] if desired_sum == 0 && number_of_elements == 0 # nothing left to search - we've found it!
    return nil if desired_sum <= 0 || number_of_elements == 0 || numbers.empty? # we've overshot the desired sum, OR we've run out of elements
    
    candidate = numbers.first
    new_desired_sum = desired_sum - candidate
    new_numbers = numbers[1..]
    res = do_find_numbers(new_numbers, new_desired_sum, number_of_elements - 1)
    # if we were able to find the remaining sum in the remaining array - return a result starting with 'candidate'
    # otherwise - try and find the full sum in the remaining array
    res ? [candidate] + res : do_find_numbers(new_numbers, desired_sum, number_of_elements)
end