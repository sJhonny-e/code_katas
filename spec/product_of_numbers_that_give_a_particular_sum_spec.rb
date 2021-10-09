require 'rspec'
require_relative '../app/product_of_numbers_that_give_a_particular_sum'

describe 'Generating a product of 2 numbers from a list. The numbers are chosen for having a specific sum' do
    it 'provides the product of 1721 and 299, since they sum up to 2020' do
        expect(give_product([1721,979, 366, 299, 675, 1456])).to eq(1721 * 299)
    end

    it 'can also detect these 2 numbres from a large list' do
        numbers = File.readlines('./spec/fixtures/input1.txt').map(&:to_i)
        expect(give_product(numbers)).to eq(1013211)
    end
end

describe 'Generating a product of 3 numbers from a list. The numbers are chosen for having a specific sum' do
    it 'provides the product of  979, 366, and 675, since they sum up to 2020' do
        expect(give_product_three([1721,979, 366, 299, 675, 1456])).to eq(979 * 366 * 675)
    end

    it 'can also detect these 3 numbres from a large list' do
        numbers = File.readlines('./spec/fixtures/input1.txt').map(&:to_i)
        expect(give_product_three(numbers)).to eq(13891280)
    end
end