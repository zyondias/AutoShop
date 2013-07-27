describe Array do
	it "Deveria adcionar um elemento no array" do 
		array = []
		array << 1
		expect(array).to have(1).item
	end
end