require 'rspec'

describe 'Generating a product of 2 numbers from a list. The numbers are chosen for having a specific sum' do
    it 'provides the product of 1721 and 299, since they sum up to 2000' do
        expect(give_product([1721,979, 366, 299, 675, 1456])).to eq(1721 * 299)
    end
end