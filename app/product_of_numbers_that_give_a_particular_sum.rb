def give_product(numbers)
    desired_sum = 2020
    numbers.find.with_index do |n, i|
        other_numbres = numbers.dup.tap{|new_arr| new_arr.delete_at(i)}
        complementary_number = other_numbres.find {|other_n| n + other_n == desired_sum}
        return complementary_number * n if complementary_number
    end
end